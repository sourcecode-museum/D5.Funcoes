function DeleteFile(sMask: string): Boolean;
{
 Para deletar, use o seguinte codigo:

 var
   s: string;
 begin
   s := Table1.TableName;
   s := copy(s, 1, Length(s)-3);
   DeleteFiles(s + '*');
 end;
}
var
  SearchRec: TSearchRec;
begin
  Result := (FindFirst(sMask, faArchive, SearchRec) = 0);
  try
    if Result then
      repeat
        Result := SysUtils.DeleteFile(AddSlash(ExtractFilePath(sMask)) + 
          SearchRec.Name);
      until (FindNext(SearchRec) <> 0);
  finally
    FindClose(SearchRec);
  end;
end; 