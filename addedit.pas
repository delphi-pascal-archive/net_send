unit addedit;

interface

uses
  SysUtils,Windows,  Forms, StdCtrls, Classes, Controls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Button2: TButton;
    NameEdit: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure doedit(Sender: TObject; var Key: Char);
    procedure SetEN;
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1, custom;

{$R *.DFM}

procedure TForm4.SetEN;
var
Layout: array[0.. KL_NAMELENGTH] of char;
begin
LoadKeyboardLayout(StrCopy(Layout,'00000409'),KLF_ACTIVATE);
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  close();
end;

procedure TForm4.Button1Click(Sender: TObject);
VAR new:boolean;
    i:integer;
begin
  new:=true;
  for i:=0 to count do if mas[i]=NameEdit.text then
     begin
        new:=false;
        Application.MessageBox('Такое имя или IP уже есть','Ошибка',MB_OK + MB_DEFBUTTON1);
        break;
     end;
  if(new)and(NameEdit.text<>'')and(add)then
     begin
       inc(count);
       mas[count]:=NameEdit.text;
       close();
     end;
   if(new)and(NameEdit.text<>'')and(not add)then
     begin
       mas[form3.LB.ItemIndex+1]:=NameEdit.text;
       close();
     end;

end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  SetEN;
  NameEdit.text:='';
  NameEdit.SetFocus;
end;

procedure TForm4.doedit(Sender: TObject; var Key: Char);
begin
  case key of
  #13:begin
        Button1Click(Button1);
      end;
  #27: close();
  end;
end;

procedure TForm4.FormDeactivate(Sender: TObject);
begin
hide;
Form3.BringToFront;
end;

end.
