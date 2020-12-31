procedure ExploreWeb(page:PChar);
//
// Executa uma url com o Browser padrão
//
// Requer a ShellApi declarada na clausua uses da unit
//
var
Returnvalue   : integer;
begin
ReturnValue := ShellExecute(0, 'open', page, nil, nil,SW_SHOWNORMAL);
if ReturnValue <= 32 then
   begin
   case Returnvalue of
        0 : MessageBox(0,'Error: Out of memory','Error',0);
        ERROR_FILE_NOT_FOUND: MessageBox(0,'Error: File not found','Error',0);
        ERROR_PATH_NOT_FOUND: MessageBox(0,'Error: Directory not found','Error',0);
        ERROR_BAD_FORMAT    : MessageBox(0,'Error: Wrong format in EXE','Error',0);
   else
        MessageBox(0,PChar('Error Nr: '+IntToStr(Returnvalue)+' inShellExecute'),'Error',0)
   end;
   end;
end;
