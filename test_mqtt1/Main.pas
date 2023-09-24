unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, RDuAngularGauge,
  RDuCircularProgress, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    Panel1: TPanel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    ToolBar1: TToolBar;
    GridPanelLayout1: TGridPanelLayout;
    ProgressBar1: TProgressBar;
    GridPanelLayout2: TGridPanelLayout;
    Button1: TButton;
    Button2: TButton;
    RDCircularProgress1: TRDCircularProgress;
    RDAngularGauge1: TRDAngularGauge;
    Memo1: TMemo;
    Button3: TButton;
    Switch1: TSwitch;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure sgcWSPClient_MQTT1MQTTSubscribe(Connection: TsgcWSConnection;
      aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS;
      SubscribeProperties: TsgcWSMQTTSUBACKProperties);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Switch1Click(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  sgcWebSocketClient1.Active := False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  sgcWSPClient_MQTT1.Subscribe('lighth3');
  sgcWSPClient_MQTT1.Subscribe('forest/sw');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  //c
  Memo1.Lines.Add('connect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  //d
  Memo1.Lines.Add('dconnect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if aTopic = 'lighth3' then
  begin
    if aText = '0' then
    begin
      ProgressBar1.Value := 0;
    end
    else
    begin
      ProgressBar1.Value := 100;
    end;
    Memo1.Lines.Add(aText);
  end;
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTSubscribe(Connection: TsgcWSConnection;
  aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS;
  SubscribeProperties: TsgcWSMQTTSUBACKProperties);
begin
  //s
end;

procedure TForm1.Switch1Click(Sender: TObject);
begin
  if Switch1.IsChecked then
  begin
    sgcWSPClient_MQTT1.Publish('forest/sw','1');
  end
  else
  begin
    sgcWSPClient_MQTT1.Publish('forest/sw','0');
  end;
end;
end.
