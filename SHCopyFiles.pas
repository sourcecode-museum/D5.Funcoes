function SHCopyFiles(source, destn: string): boolean;
//
// Copia um arquivo de um lugar para outro via API do Windows
//
// Requer a ShellApi declarada na clausula Uses da unit
//
var
SHFileOpStruct: TSHFileOpStruct;
begin
with SHFileOpStruct do
     begin
     Wnd := Screen.ActiveForm.Handle;
     wFunc := FO_COPY;
     pFrom := PChar(source + chr(0));
     pTo := PChar(destn);
     fFlags := FOF_FILESONLY or FOF_NOCONFIRMATION;
     hNameMappings := nil;
     lpszProgressTitle := nil;
     end;
if SHFileOperation(SHFileOpStruct) = 0 then
   begin
   Result := True;
   end
else
   begin
   Result := False;
   end;
end;
