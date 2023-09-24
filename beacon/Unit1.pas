unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, System.Beacon,
  System.Bluetooth, FMX.Memo.Types, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, System.Beacon.Components;

type
  TForm1 = class(TForm)
    Beacon1: TBeacon;
    Memo1: TMemo;
    Button1: TButton;
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Beacon1BeaconEnter(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('New Beacon');
  Memo1.Lines.Add(
    Format('UUID: %s marjor: %d minor: %d Distance: %f',
    [ABeacon.GUID.ToString,ABeacon.Major,ABeacon.Minor,ABeacon.Distance]));
  Memo1.Lines.Add('Current Beacons count :'+Length(CurrentBeaconList).toString);
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('Beacon Exited');
  Memo1.Lines.Add(
    Format('UUID: %s marjor: %d minor: %d',
    [ABeacon.GUID.ToString,ABeacon.Major,ABeacon.Minor]));
  Memo1.Lines.Add('Current Beacons count :'+Length(CurrentBeaconList).toString);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Button1.Text = 'start' then
  begin
    Button1.Text := 'stop';
    Beacon1.Enabled := True;
  end
  else if Button1.Text = 'stop' then
  begin
    Button1.Text := 'start';
    Memo1.Lines.Clear;
    Beacon1.Enabled := False;
  end;
end;

end.
