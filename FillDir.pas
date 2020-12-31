function FillDir(Const AMask: string): TStringList;
{Retorna uma TStringlist de todos os arquivos localizados
 no path corrente , Esta função trabalha com mascaras}
var
  SearchRec  : TSearchRec;
  intControl : integer;
begin
  Result := TStringList.create;
  intControl := FindFirst( AMask, faAnyFile, SearchRec );
  if intControl = 0 then
     begin
     while (intControl = 0) do
           begin
           Result.Add( SearchRec.Name );
           intControl := FindNext( SearchRec );
           end;
     FindClose( SearchRec );
     end;
end;
