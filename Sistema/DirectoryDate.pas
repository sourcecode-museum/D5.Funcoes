function DirectoryDate(aDir: String): String;
//
// Retorna a data da criação de um diretório
//
var
srFile: TSearchRec;
begin
if FindFirst('C:\WINDOWS',faDirectory,srFile)=0 then
   begin
   result := DateToStr(FileDateToDateTime(srFile.Time));
   end;
end;
