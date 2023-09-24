unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types, FMX.Effects,
  FMX.Media, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation, FMX.Objects, System.Permissions,
  FMX.ScrollBox, FMX.Memo, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket;

type
  TForm1 = class(TForm)
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    Memo1: TMemo;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    GridPanelLayout1: TGridPanelLayout;
    Switch1: TSwitch;
    Camera: TCameraComponent;
    procedure FormCreate(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure sgcWSPClient_MQTT1MQTTSubscribe(Connection: TsgcWSConnection;
      aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS;
      SubscribeProperties: TsgcWSMQTTSUBACKProperties);
    procedure Switch1Switch(Sender: TObject);
  private
    FPermissionCamera: string;
    procedure SetFlashlightState(Active: Boolean);
    procedure AccessCameraPermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
    procedure ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
    procedure DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
{$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
{$ENDIF}
  FMX.DialogService;

{$R *.fmx}
//{$R *.LgXhdpiPh.fmx ANDROID}

procedure TForm1.AccessCameraPermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
begin
  // 1 permission involved: CAMERA
  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
    //ImageOff.Enabled := Camera.HasFlash
  else
    TDialogService.ShowMessage('Cannot access the camera flashlight because the required permission has not been granted');
end;

procedure TForm1.DisplayRationale(Sender: TObject; const APermissions: TClassicStringDynArray; const APostRationaleProc: TProc);
begin
  // Show an explanation to the user *asynchronously* - don't block this thread waiting for the user's response!
  // After the user sees the explanation, invoke the post-rationale routine to request the permissions
  TDialogService.ShowMessage('The app needs to access the camera in order to work',
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

procedure TForm1.ActivateCameraPermissionRequestResult(Sender: TObject; const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray);
begin
  // 1 permission involved: CAMERA
  if (Length(AGrantResults) = 1) and (AGrantResults[0] = TPermissionStatus.Granted) then
  begin
    Camera.Active := True;
    SetFlashlightState(True);
  end
  else
    TDialogService.ShowMessage('Cannot access the camera flashlight because the required permission has not been granted');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID}
    FPermissionCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  {$ENDIF}
    PermissionsService.RequestPermissions([FPermissionCamera], AccessCameraPermissionRequestResult, DisplayRationale);
  FPermissionCamera := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
  sgcWSPClient_MQTT1.Subscribe('forest/p');
  sgcWSPClient_MQTT1.Subscribe('forest/sw');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
//a
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
//b
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if aTopic = 'forest/sw' then
  begin
    if aText = '0' then
    begin
      SetFlashlightState(false);
      Memo1.Lines.Add('true');
    end
    else if aText = '1' then
    begin
      PermissionsService.RequestPermissions([FPermissionCamera], ActivateCameraPermissionRequestResult, DisplayRationale);
      Memo1.Lines.Add('true');
    end;
    Memo1.Lines.Add(aText);
  end;
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTSubscribe(Connection: TsgcWSConnection;
  aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS;
  SubscribeProperties: TsgcWSMQTTSUBACKProperties);
begin
//c
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  if Switch1.IsChecked then
  begin
    sgcWSPClient_MQTT1.Publish('forest/p','1');
  end
  else
  begin
    sgcWSPClient_MQTT1.Publish('forest/p','0');
  end;
end;

procedure TForm1.SetFlashlightState(Active: Boolean);
begin
  if Active then
    Camera.TorchMode := TTorchMode.ModeOn
  else
    Camera.TorchMode := TTorchMode.ModeOff;
end;

end.
