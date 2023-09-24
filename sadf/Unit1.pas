unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon,
  System.Bluetooth, System.Beacon.Components, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Beacon1: TBeacon;
    Button1: TButton;
    Memo1: TMemo;
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
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
  Memo1.Lines.Add('new beacon');
  Memo1.Lines.Add(
    Format('UUID: %s Marjor: %d Minor: %d Distance: %f',
    [ABeacon.GUID.ToString, ABeacon.Major, ABeacon.Minor, ABeacon.Distance]));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Button1.Text = 'start' then
  begin
    Button1.Text := 'stop';
    Beacon1.Enabled := True;
  end
  else
  begin
    Button1.Text := 'start';
    Beacon1.Enabled := False;
  end;

end;

end.
