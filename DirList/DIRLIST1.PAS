{ Import this Unit into a new project and delete the default Unit1 }
unit Dirlist1;

interface

uses
  SysUtils,
  WinTypes,
  WinProcs,
  Messages,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { this is the notification function for the directory scan }
    Function LogFiles( Const path: String; Const SRec: TSearchRec ): Boolean;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

USes DirScan;

{$R *.DFM}

Function TForm1.LogFiles( Const path: String; Const SRec: TSearchRec ): Boolean;
  Begin
    Listbox1.Items.Add( path+SRec.Name );
    Result := True;   (* proceeed with recursion *)
  End;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  ListBox1.Clear;
  Listbox1.Perform( WM_SETREDRAW, 0, 0 );
  FindRecursive( Edit1.Text, Edit2.Text, LogFiles );
  Listbox1.Perform( WM_SETREDRAW, 1, 0 );
  Listbox1.Refresh;
  Screen.Cursor := crDefault;
  If ListBox1.Items.Count = 0 Then
    MessageDlg('No files matching the mask were found!',
               mtInformation, [mbOK], 0);
end;

end.
