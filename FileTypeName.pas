function  FileTypeName(const aFile: String): String;
{Retorna descrição do tipo do arquivo. Requer a unit ShellApi}
var
  aInfo: TSHFileInfo;
begin
  if SHGetFileInfo(PChar(aFile),0,aInfo,Sizeof(aInfo),SHGFI_TYPENAME)<>0 then
     Result := StrPas(aInfo.szTypeName)
  else begin
     Result := ExtractFileExt(aFile);
     Delete(Result,1,1);
     Result := Result +' File';
  end;
end;
