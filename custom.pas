unit custom;

interface

uses
   SysUtils, Windows, Graphics,  Forms, 
  StdCtrls, Classes, Controls;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    Button3: TButton;
    LB: TListBox;
    CheckBox: TCheckBox;
    SoundCB: TCheckBox;
    procedure Button5Click(Sender: TObject);
    procedure doedit3(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LBClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1, addedit;

{$R *.DFM}

procedure TForm3.doedit3(Sender: TObject; var Key: Char);
begin
  case key of
  #13:
    begin
      Button2Click(Button2);
      Key:=#0;
    end;
  #27: close();
  end;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  close();
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  form3.left:=form1.left+34;
  form3.top:=form1.top+20;
  curpos:=count;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  if LB.Items.Count<15 then begin add:=true;form4.show();end else Application.MessageBox('    Нет места!    ','Ошибка',MB_OK + MB_DEFBUTTON1);
end;

procedure TForm3.FormActivate(Sender: TObject);
VAR i:integer;
begin
  LB.Items.Clear;
  for i:=1 to count do LB.Items.Add(mas[i]);
  if curpos>0 then LB.Selected[curpos-1]:=true;
  if (LB.SelCount=0)and(LB.Items.count>0) then
      for i:=0 to count-1 do if Form1.cb.Text=LB.Items.Strings[i] then LB.Selected[i]:=true;
  Form4.SetEN;
end;

procedure TForm3.Button3Click(Sender: TObject);
VAR i:integer;
begin
  if Lb.ItemIndex<0 then Application.MessageBox('Выбирите пункт меню','Ошибка',MB_OK + MB_DEFBUTTON1) else
    if LB.Items.count>0 then
    begin
      for i:=Lb.ItemIndex to count-2 do mas[i+1]:=mas[i+2];
      dec(count);
      if(LB.ItemIndex+1)<lastuser then
        begin
          Lastuser:=lastuser-1;
        end;
      if curpos=LB.Items.count then dec(curpos);
      FormActivate(Form3);
    end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Lb.ItemIndex>=0 then lastuser:=Lb.ItemIndex+1;
  if not cbactive then Form1.Setru else Form1.setEN;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  add:=false;
  if(LB.ItemIndex>=0)and(LB.items.count>0) then form4.show();
  form4.NameEdit.text:=mas[LB.ItemIndex+1];
  form4.NameEdit.SelectAll;
end;

procedure TForm3.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close();
end;

procedure TForm3.LBClick(Sender: TObject);
var i:integer;
begin
  for i:=1 to LB.items.count do if LB.Selected[i-1] then curpos:=i;
end;

procedure TForm3.FormDeactivate(Sender: TObject);
begin
 Form1.CB.text:=mas[lastuser];
 if not cbactive then Form1.Setru else Form1.SetEN;
end;

end.
