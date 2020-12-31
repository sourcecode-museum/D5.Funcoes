program Dirlist;

uses
  Forms,
  Dirlist1 in 'DIRLIST1.PAS',
  Dirscan in 'DIRSCAN.PAS';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
