procedure Deltree( cPath: string );
//
// Remove um diretorio
//
var
search: TSearchRec;
nFiles: integer;
begin
nFiles:=FindFirst( cPath + '\*.*', faAnyFile,  search );
while nFiles=0 do
      begin
      if Search.Attr = faDirectory then
         begin
         if (Search.Name<>'.') and (Search.Name<>'..') then
             begin
             Deltree( cPath + '\' + Search.Name );
             RMDir( cPath + '\' + Search.Name );
             end;
         end
      else
         begin
         SysUtils.DeleteFile(cPath + '\' + Search.Name);
         end;
      nFiles:=FindNext( Search );
      end;
SysUtils.FindClose(Search);
RMDir(cPath);
end;
