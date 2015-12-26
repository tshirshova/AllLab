unit Lab6Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TLab6Form = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    ListBox1: TListBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lab6Form: TLab6Form;

implementation
  function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;
{$R *.dfm}

function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;
Var Nm:Array[0..255] of Char; // for name
    Cs: Array[0..255] of Char; // for class
Begin
  GetWindowText(Wd,Nm,255); // text of window's header
  GetClassName(Wd,Cs,255); // name of window's class
  TLab6Form.ListBox1.Items.Add(String(Nm)+'/'+String(Cs)); //add window's name and class to list
  EnumProc := TRUE; // continue to find windows
end;

procedure TLab6Form.BitBtn1Click(Sender: TObject);
begin
  close();
end;

procedure TLab6Form.Button1Click(Sender: TObject);
begin
  close();
end;

procedure TLab6Form.Button2Click(Sender: TObject);
var wd:HWND; //handle
begin
  wd:=FindWindow(nil,'test1');   // handle
  if wd<>0 then
  begin
    if IsIconic(wd) then        // if minimize
      ShowWindow(wd, SW_SHOWMAXIMIZED) //  do maximize
    else
      ShowWindow(wd, SW_MINIMIZE); // do minimize
  end;
end;

procedure TLab6Form.Button3Click(Sender: TObject);
begin
  lst1.Items.Clear;
  EnumWindows(@EnumProc,0);
end;

procedure TLab6Form.Button4Click(Sender: TObject);
var wd:HWND;   // for handle
    canvas:TCanvas;
begin
  wd:=FindWindow(nil,'������ � ������');//handle
  //SendMessage(wd,WM_PAINT,0,0);// call redraw
  canvas:=TCanvas.Create; // create canvas
  with canvas do
  begin
    Handle:=GetDC(wd);   // contecst display
    Rectangle(20,200,120,300); // rectangle on window
    Font.Color:=clRed; //red font
    TextOut(30,210,'Test');
    TextOut(30,230,'Text');
    Free;

  end;
  ReleaseDC(0,wd);  // ����������� ����� ��� ������� �������� ����������, �����
  // ��� ��������� ��� ������ ���������� �����
end;

end.






