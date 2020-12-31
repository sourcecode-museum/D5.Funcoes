Function RecycleBin(sFileName : string ) : boolean;
// Envia um arquivo para a lixeira
var
fos : TSHFileOpStruct;
Begin
FillChar( fos, SizeOf( fos ), 0 );
With fos do
begin
wFunc := FO_DELETE;
pFrom := PChar( sFileName );
fFlags := FOF_ALLOWUNDO
or FOF_NOCONFIRMATION
or FOF_SILENT;
end;
Result := (0 = ShFileOperation(fos));
end;
