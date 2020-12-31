function IsFileInUse(fName : string) : boolean;
//
// Testa se um certo arquivo está em uso
//
var
HFileRes : HFILE;
begin
Result := false;
if not FileExists(fName) then
   begin
   exit;
   end;
HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE,0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
Result := (HFileRes = INVALID_HANDLE_VALUE);
if not Result then
   begin
   CloseHandle(HFileRes);
   end;
end;
