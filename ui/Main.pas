unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  System.ImageList, FMX.ImgList, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Ani, FMX.Edit, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TfrmMain = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    bluepit: TBrushObject;
    orange: TBrushObject;
    gird: TBrushObject;
    page1: TBrushObject;
    page2: TBrushObject;
    ImageList1: TImageList;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    CornerButton3: TCornerButton;
    CornerButton4: TCornerButton;
    CornerButton5: TCornerButton;
    StyleBook1: TStyleBook;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Rectangle5: TRectangle;
    whitegreen: TBrushObject;
    Rectangle6: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    Text5: TText;
    Text6: TText;
    Rectangle7: TRectangle;
    Rectangle9: TRectangle;
    blue: TBrushObject;
    Text7: TText;
    GridPanelLayout2: TGridPanelLayout;
    Arc2: TArc;
    FloatAnimation2: TFloatAnimation;
    Arc3: TArc;
    FloatAnimation3: TFloatAnimation;
    Text8: TText;
    Text9: TText;
    Text10: TText;
    GridPanelLayout3: TGridPanelLayout;
    Text11: TText;
    Arc1: TArc;
    FloatAnimation1: TFloatAnimation;
    Text14: TText;
    Text15: TText;
    Text16: TText;
    Text17: TText;
    Text18: TText;
    Text19: TText;
    Text20: TText;
    Text23: TText;
    Timer1: TTimer;
    Rectangle8: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Circle1: TCircle;
    Rectangle12: TRectangle;
    GridPanelLayout4: TGridPanelLayout;
    Text12: TText;
    Rectangle13: TRectangle;
    Text13: TText;
    Rectangle14: TRectangle;
    GridPanelLayout5: TGridPanelLayout;
    Rectangle15: TRectangle;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Rectangle19: TRectangle;
    Edit4: TEdit;
    Edit5: TEdit;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle20: TRectangle;
    CornerButton6: TCornerButton;
    CornerButton7: TCornerButton;
    CornerButton9: TCornerButton;
    CornerButton11: TCornerButton;
    CornerButton13: TCornerButton;
    GridPanelLayout6: TGridPanelLayout;
    Text21: TText;
    Rectangle18: TRectangle;
    Text22: TText;
    GridPanelLayout7: TGridPanelLayout;
    Arc4: TArc;
    Rectangle21: TRectangle;
    Arc5: TArc;
    Rectangle22: TRectangle;
    Arc6: TArc;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    GridPanelLayout8: TGridPanelLayout;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    Text24: TText;
    Text25: TText;
    Text26: TText;
    Rectangle28: TRectangle;
    Text27: TText;
    GridPanelLayout9: TGridPanelLayout;
    Arc7: TArc;
    Rectangle29: TRectangle;
    Arc8: TArc;
    Rectangle30: TRectangle;
    Arc9: TArc;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    GridPanelLayout10: TGridPanelLayout;
    Rectangle33: TRectangle;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    Text28: TText;
    Text29: TText;
    Text30: TText;
    Rectangle36: TRectangle;
    Text31: TText;
    GridPanelLayout11: TGridPanelLayout;
    Arc10: TArc;
    Rectangle37: TRectangle;
    Arc11: TArc;
    Rectangle38: TRectangle;
    Arc12: TArc;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    GridPanelLayout12: TGridPanelLayout;
    Rectangle41: TRectangle;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    Text32: TText;
    Text33: TText;
    Text34: TText;
    Rectangle44: TRectangle;
    Text35: TText;
    GridPanelLayout13: TGridPanelLayout;
    Arc13: TArc;
    Rectangle45: TRectangle;
    Arc14: TArc;
    Rectangle46: TRectangle;
    Arc15: TArc;
    Rectangle47: TRectangle;
    Rectangle48: TRectangle;
    GridPanelLayout14: TGridPanelLayout;
    Rectangle49: TRectangle;
    Rectangle50: TRectangle;
    Rectangle51: TRectangle;
    Text36: TText;
    Text37: TText;
    Text38: TText;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    red: TBrushObject;
    Text40: TText;
    Rectangle52: TRectangle;
    procedure CornerButton5Click(Sender: TObject);
    procedure CornerButton4Click(Sender: TObject);
    procedure CornerButton3Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure CornerButton6Click(Sender: TObject);
    procedure CornerButton7Click(Sender: TObject);
    procedure CornerButton9Click(Sender: TObject);
    procedure CornerButton11Click(Sender: TObject);
    procedure CornerButton13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
  private
    { Private declarations }
  public
    { Public declarations }
    A1 : string;
    A2 : string;
    A3 : string;
    B1 : string;
    B2 : string;
    B3 : string;
    C1 : string;
    C2 : string;
    C3 : string;
    D1 : string;
    D2 : string;
    D3 : string;
    F1 : string;
    F2 : string;
    F3 : string;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}
procedure TfrmMain.CornerButton11Click(Sender: TObject);
begin
  if Edit4.Text = '' then
  begin
    Edit4.Text := '';
  end
  else
  begin
    C1 := Edit4.Text + '/tem';
    C2 := Edit4.Text + '/hum';
    C3 := Edit4.Text + '/co';
    Text31.Text := Edit4.Text;
    sgcWSPClient_MQTT1.Subscribe(C1);
    sgcWSPClient_MQTT1.Subscribe(C2);
    sgcWSPClient_MQTT1.Subscribe(C3);
  end;
end;

procedure TfrmMain.CornerButton13Click(Sender: TObject);
begin
  if Edit5.Text = '' then
  begin
    Edit5.Text := '';
  end
  else
  begin
    D1 := Edit5.Text + '/tem';
    D2 := Edit5.Text + '/hum';
    D3 := Edit5.Text + '/co';
    Text35.Text := Edit5.Text;
    sgcWSPClient_MQTT1.Subscribe(D1);
    sgcWSPClient_MQTT1.Subscribe(D2);
    sgcWSPClient_MQTT1.Subscribe(D3);
  end;
end;

procedure TfrmMain.CornerButton1Click(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.CornerButton2Click(Sender: TObject);
begin
  Rectangle5.Visible := False;
  Rectangle4.Visible := False;
  Rectangle6.Visible := False;
  Rectangle12.Visible := True;
end;

procedure TfrmMain.CornerButton3Click(Sender: TObject);
begin
  Rectangle5.Visible := False;
  Rectangle4.Visible := True;
  Rectangle6.Visible := False;
  Rectangle12.Visible := False;
end;

procedure TfrmMain.CornerButton4Click(Sender: TObject);
begin
  Rectangle5.Visible := False;
  Rectangle4.Visible := False;
  Rectangle6.Visible := True;
  Rectangle12.Visible := False;
end;

procedure TfrmMain.CornerButton5Click(Sender: TObject);
begin
  Rectangle5.Visible := True;
  Rectangle4.Visible := False;
  Rectangle6.Visible := False;
  Rectangle12.Visible := False;
end;

procedure TfrmMain.CornerButton6Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Edit1.Text := '';
  end
  else
  begin
    F1 := Edit1.Text + '/tem';
    F2 := Edit1.Text + '/hum';
    F3 := Edit1.Text + '/co';
    sgcWSPClient_MQTT1.Subscribe(F1);
    sgcWSPClient_MQTT1.Subscribe(F2);
    sgcWSPClient_MQTT1.Subscribe(F3);
  end;
end;

procedure TfrmMain.CornerButton7Click(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    Edit2.Text := '';
  end
  else
  begin
    A1 := Edit2.Text + '/tem';
    A2 := Edit2.Text + '/hum';
    A3 := Edit2.Text + '/co';
    Text22.Text := Edit2.Text;
    sgcWSPClient_MQTT1.Subscribe(A1);
    sgcWSPClient_MQTT1.Subscribe(A2);
    sgcWSPClient_MQTT1.Subscribe(A3);
  end;
end;

procedure TfrmMain.CornerButton9Click(Sender: TObject);
begin
  if Edit3.Text = '' then
  begin
    Edit3.Text := '';
  end
  else
  begin
    B1 := Edit3.Text + '/tem';
    B2 := Edit3.Text + '/hum';
    B3 := Edit3.Text + '/co';
    Text27.Text := Edit3.Text;
    sgcWSPClient_MQTT1.Subscribe(B1);
    sgcWSPClient_MQTT1.Subscribe(B2);
    sgcWSPClient_MQTT1.Subscribe(B3);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
end;

procedure TfrmMain.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  //Memo1.Lines.Add('#c');
end;

procedure TfrmMain.sgcWSPClient_MQTT1MQTTDisconnect(
  Connection: TsgcWSConnection; ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  //Memo1.Lines.Add('#d');
end;

procedure TfrmMain.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if (pos(F1, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 50) then
    begin
      //Rectangle6.Fill.Color := '#FFD1E6DF';
    end;
    Text17.Text := aText;
    Arc1.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(F2, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 80) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text18.Text := aText;
    Arc2.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(F3, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 400) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text19.Text := aText;
    Arc3.EndAngle := StrToInt(aText) / 2 + 40;
  end;
  if (pos(A1, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 50) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text24.Text := 'Temperature : ' + aText;
    Arc4.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(A2, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 80) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text25.Text := 'Temperature : ' + aText;
    Arc5.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(A3, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 400) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text26.Text := 'Carbon Monoxide : ' + aText;
    Arc6.EndAngle := StrToInt(aText) / 2 + 40;
  end;
  if (pos(B1, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 50) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text28.Text := 'Temperature : ' + aText;
    Arc7.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(B2, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 80) then
    begin
     // Rectangle6.Fill.Color := red;
    end;
    Text29.Text := 'Temperature : ' + aText;
    Arc8.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(B3, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 400) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text30.Text := 'Carbon Monoxide : ' + aText;
    Arc9.EndAngle := StrToInt(aText) / 2 + 40;
  end;
  if (pos(C1, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 50) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text32.Text := 'Temperature : ' + aText;
    Arc10.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(C2, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 80) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text33.Text := 'Temperature : ' + aText;
    Arc11.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(C3, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 400) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text34.Text := 'Carbon Monoxide : ' + aText;
    Arc12.EndAngle := StrToInt(aText) / 2 + 40;
  end;
  if (pos(D1, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 50) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text36.Text := 'Temperature : ' + aText;
    Arc13.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(D2, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 80) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text37.Text := 'Temperature : ' + aText;
    Arc14.EndAngle := StrToInt(aText) * 4;
  end
  else if (pos(D3, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 400) then
    begin
      //Rectangle6.Fill.Color := red;
    end;
    Text38.Text := 'Carbon Monoxide : ' + aText;
    Arc15.EndAngle := StrToInt(aText) / 2 + 40;
  end;

end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  date : string;
  msg : string;
begin
  date := FormatDateTime('YYYY-MM-DD hh:mm',now);
  msg := Format('Time : %s',[date]);
  Text23.Text := msg;
end;

end.
