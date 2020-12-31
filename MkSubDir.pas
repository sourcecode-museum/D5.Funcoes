function MkSubDir(sPath : string): Boolean;
//
// Esta função permite criar diretórios e subdiretórios
// diretamente.
//
// Requer a FileCtrl declarada na clausula Uses da unit
//
begin
if('\' = sPath[Length(sPath)])then
   begin
   sPath := Copy(sPath, 1,Length(sPath)-1);
   end;
if((Length(sPath) < 3) or FileCtrl.DirectoryExists(sPath))then
   begin
   Exit;
   end;
MkDirMulti(SysUtils.ExtractFilePath(sPath));
try
  System.MkDir( sPath );
  Result := true;
except
  Result := False;
end;
end;
