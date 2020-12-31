procedure RunOnStartup(sProgTitle,sCmdLine: string; bRunOnce: boolean );
//
// Insere um programa na chave "Run" do Registro para que
// ele seje executado na inicialização do Windows
//
// Requer a Registry declarada na clausula Uses da unit
//
// Ex: RunOnStartup('Bloco de Notas','C:\Windows\Notepad.exe',False);
//
var
sKey : string;
reg  : TRegIniFile;
begin
if( bRunOnce )then
   begin
   sKey := 'Once'
   end
else
  begin
  sKey := '';
  end;
reg := TRegIniFile.Create( '' );
reg.RootKey := HKEY_LOCAL_MACHINE;
reg.WriteString('Software\Microsoft' + '\Windows\CurrentVersion\Run'+ sKey + #0, sProgTitle, sCmdLine );
reg.Free;
end;
