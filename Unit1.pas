unit Unit1;

interface

uses
   Winsock,registry,Dialogs,SysUtils,Windows,ExtCtrls,StdCtrls,ComCtrls,Controls,Classes,MMSystem,
   Forms,  Buttons, xpman;
Type
  TForm1 = class(TForm)
    CB: TComboBox;
    Label1: TLabel;
    SB: TStatusBar;
    Button1: TButton;
    Timer1: TTimer;
    // FormPlacement1: TFormPlacement;
    EB: TSpeedButton;
    M: TRichEdit;
    Button2: TButton;
    Button3: TButton;
    procedure FormDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CBEnter(Sender: TObject);
    procedure EBClick(Sender: TObject);
    procedure Wave;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure SetRU;
    procedure SetEN;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MKeyPress(Sender: TObject; var Key: Char);
    procedure EB1Click(Sender: TObject);
    procedure CBKeyPress(Sender: TObject; var Key: Char);
    procedure MEnter(Sender: TObject);
    procedure MKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mas:array[1..15]of string;
  lastuser, count,curpos:byte;
  add,tocheck:boolean;
  save,statbar:string;
  path,buffer,s,temp:string;
  i,j:integer;
  cbactive,keyflag:boolean;

Function NetMessageBufferSend (
  servername: LPCWSTR; msgname: LPCWSTR;
  fromname: LPCWSTR; buf: Pointer;
  buflen: DWORD
): longint; stdcall; external 'netapi32.dll';

implementation

uses help, custom;

{$R *.DFM}
{$R Wav.res}

function LocalIP : string;
type
    TaPInAddr = array [0..10] of PInAddr;
    PaPInAddr = ^TaPInAddr;
var
    phe  : PHostEnt;
    pptr : PaPInAddr;
    Buffer : array [0..63] of char;
    I    : Integer;
    GInitData      : TWSADATA;

begin
   WSAStartup($101, GInitData);
    Result := '';
    GetHostName(Buffer, SizeOf(Buffer));
    phe :=GetHostByName(buffer);
    if phe = nil then Exit;
    pptr := PaPInAddr(Phe^.h_addr_list);
    I := 0;
    while pptr^[I] <> nil do begin
      result:=StrPas(inet_ntoa(pptr^[I]^));
      Inc(I);
    end;
    WSACleanup;
end;


function SendLanMessage:boolean;
Var
 lpwRemote: LPCWSTR;
 lpwBuf   : LPCWSTR;
 pwlIP    : LPCWSTR;
 dwSize: Integer;
 ip:string;
Begin
 if paramcount<1 then ip:=localip else ip:=ParamStr(1);
 // Перевод path > lpwRemote
  dwSize := SizeOf (WideChar) * Length (path)+1;
 GetMem (lpwRemote, dwSize);
 if StringToWideChar (path, lpwRemote, dwSize)=nil
  then begin form1.SB.SimpleText:='Cообщение не отправлено... Ошибка ввода';exit;end;

 // Перевод localip >   pwlIP
  dwSize := SizeOf (WideChar) * Length (ip)+1;
 GetMem (pwlIP, dwSize);
 if StringToWideChar (ip, pwlIP, dwSize)=nil
  then begin form1.SB.SimpleText:='Cообщение не отправлено... Ошибка ввода';exit;end;

 // Перевод text > lpwBuf
 dwSize := SizeOf (WideChar) * Length (buffer)+1;
 GetMem (lpwBuf, dwSize);
 if StringToWideChar (buffer, lpwBuf, dwSize)=nil
  then begin form1.SB.SimpleText:='Cообщение не отправлено... Ошибка ввода';exit;end;

 // Sending
 If NetMessageBufferSend (nil, lpwRemote, pwlIP, lpwBuf, dwSize) <> NO_ERROR
 then begin
  form1.SB.SimpleText:='Cообщение не отправлено...'
 end else begin
  if form3.SoundCB.Checked then form1.wave;
  form1.SB.SimpleText:='Message is send successfully...';
  form1.Button1click(form1.Button1);
 end;
End;

procedure TForm1.Wave;
var WaveHandle  : THandle;
    WavePointer : pointer;
begin
  WaveHandle  := FindResource(hInstance,'Wave',RT_RCDATA);
  if WaveHandle<>0 then
     begin
       WaveHandle:= LoadResource(hInstance,WaveHandle);
       if WaveHandle<>0 then
         begin;
           WavePointer := LockResource(WaveHandle);
           sndPlaySound(WavePointer,snd_Memory OR SND_ASYNC);
           UnlockResource(WaveHandle);
           FreeResource(WaveHandle);
         end;
     end;
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
  form2.show;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
{  Button3.Left:=round((form1.width/2)-(button3.width/2))-2;
  Button3.top:=form1.Height-80;
  CB.left:=85;
  CB.width:=form1.width-129;
  EB.left:=form1.width-41;
  M.width:=form1.width-26;
  M.height:=form1.height-105; }
end;

procedure TForm1.SetRU;
var
Layout: array[0.. KL_NAMELENGTH] of char;
begin
LoadKeyboardLayout( StrCopy(Layout,'00000419'),KLF_ACTIVATE);
end;

procedure TForm1.SetEN;
var
Layout: array[0.. KL_NAMELENGTH] of char;
begin
LoadKeyboardLayout(StrCopy(Layout,'00000409'),KLF_ACTIVATE);
end;

procedure TForm1.CBEnter(Sender: TObject);
VAR i:integer;
begin
  SetEN;
  CB.Items.Clear;
  for i:=1 to count do CB.Items.Add(mas[i]);
end;

procedure TForm1.EBClick(Sender: TObject);
begin
  form3.show();
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#27 then close();
end;

procedure run;
begin
    if i<length(Form1.SB.SimpleText)then inc(i) else exit;
    temp:=UpperCase(s[i]); // UpperCase(s[i]);
    S[i]:=temp[1];
    Form1.SB.SimpleText:=s; //show;
    Form1.Timer1.Enabled:=true; //wait;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 s:=SB.SimpleText;
 i:=0;
 Run;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    temp:=LowerCase(s[i]); // LowerCase(s[i]);
    S[i]:=temp[1];
    run;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
VAR i:integer;
    regini:TReginiFile;
begin
  regini:=TreginiFile.create;
  regini.rootkey:=HKEY_CURRENT_USER;
  if regini.openkey('Software\TopSoft',true) then begin
    for i:=1 to count do if mas[i]=CB.text then regini.Writeinteger('NetSend','lastNetSend',i);
    for i:=1 to count do regini.WriteString('NetSend','User'+inttostr(i),mas[i]);
    regini.Writeinteger('NetSend','count',count);
    if Form3.CheckBox.checked then regini.Writeinteger('NetSend','tocheck',1) else regini.Writeinteger('NetSend','tocheck',0);
    if Form3.SoundCB.checked then regini.Writeinteger('NetSend','playsound',1) else regini.Writeinteger('NetSend','playsound',0);
  end;
  regini.free;
end;

procedure TForm1.FormShow(Sender: TObject);
VAR i:integer;
    regini:TReginiFile;
begin
  regini:=TreginiFile.create;
  regini.rootkey:=HKEY_CURRENT_USER;
  regini.openkey('Software\TopSoft',true);
  lastuser:=regini.Readinteger('NetSend','lastNetSend',0);
  CB.text:=regini.ReadString('NetSend','User'+inttostr(lastuser),'<enter name or IP>');
  if regini.Readinteger('NetSend','playsound',1)=0 then Form3.SoundCB.checked:=false;
  if regini.Readinteger('NetSend','tocheck',1)=0 then Form3.CheckBox.checked:=false;
  if lastuser<>0 then begin
    count:=regini.Readinteger('NetSend','count',0);
    for i:=1 to count do mas[i]:=regini.ReadString('NetSend','User'+inttostr(i),'');
    for i:=1 to count do CB.Items.Add(mas[i]);
  end else count:=0;
    regini.free;
end;

procedure TForm1.MKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#10)and((Word(GetKeyState(VK_CONTROL)) and $8000)<>0)then begin
      keyflag:=false;
      Button3Click(Button3);
      key:=#0;
  end;
  if key=#27 then close;
end;

procedure TForm1.EB1Click(Sender: TObject);
begin
  if CB.Focused then cbactive:=true else cbactive:=false;
  form3.show();
end;

procedure TForm1.CBKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0;
      M.SetFocus;
    end;
  if key=#27 then close();
end;

procedure TForm1.MEnter(Sender: TObject);
begin
 SetRU;
end;

procedure TForm1.MKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key=VK_F1 then begin

    m.text:=save;
    Keybd_Event(VK_LCONTROL, MapVirtualKey(VK_LCONTROL,0), 0, 0);
    Keybd_Event(VK_END, MapVirtualKey(VK_END,0), KEYEVENTF_EXTENDEDKEY, 0);
    Keybd_Event(VK_LCONTROL, MapVirtualKey(VK_LCONTROL,0), KEYEVENTF_KEYUP, 0);

  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 SendLanMessage;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i:integer;
 new:boolean;
 ThID : Cardinal;
begin
  if M.text<>'' then
     begin
        save:=M.text;
        path:=form1.CB.Text;
        buffer:=form1.M.Text;
        if Form3.CheckBox.checked then SB.SimpleText:='Посылаем...' else begin if form3.SoundCB.Checked then wave; SB.SimpleText:=''; end;
        if Form3.CheckBox.Checked then CreateThread(nil,0,@SendLanMessage,0,0,ThID) else winexec(pchar('net send '+CB.Text+' '+M.text),0);
        M.Clear;
        new:=true;
        for i:=1 to count do if mas[i]=CB.text then begin new:=false;break;end;
        if new and (count<15) then
          begin
            inc(count);
            mas[count]:=CB.text;
            CB.Items.Add(CB.text);
          end;
     end;
  M.SetFocus;
end;

end.
