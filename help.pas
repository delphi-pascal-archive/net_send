unit help;

interface

uses
  Windows, Forms, Classes, Graphics, Controls, StdCtrls, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation



{$R *.DFM}

procedure TForm2.FormDeactivate(Sender: TObject);
begin
 hide;
end;

end.
