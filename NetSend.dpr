program NetSend;

uses
  Forms, Windows, SysUtils,  Dialogs,
  Unit1 in 'Unit1.pas' {Form1},
  help in 'help.pas' {Form2},
  custom in 'custom.pas' {Form3},
  addedit in 'addedit.pas' {Form4};

{$R *.RES}
var sdir : Array[0..MAX_PATH] of char;
begin
  GetSystemDirectory(sdir, sizeof(sdir));
  if copy(sdir,StrLen(sdir)-1,2)<>'32' then begin showmessage('    Эта программа использует сервис Messenger для NT операционных систем! Не для Win9x!'); halt; end;
  Application.Initialize;
  Application.Title := 'NetSend for NT Messenger Service';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
 Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
