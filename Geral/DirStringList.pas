procedure DirList( ASource : string; ADirList :TStringList );
//
// Pesquisa arquivos retornando-os em um StringList.
//
// use-a assim:
//             var
//             lista: TStringlist;
//             begin
//             lista:= TStringlist.create;
//             DirList('C:\*.bat',lista);
//             ListBox1.Items.Assign(Lista);
//             end;
//
//
var
SearchRec : TSearchRec;
Result : integer;
begin
Result := FindFirst( ASource, faAnyFile, SearchRec );
if Result = 0 then
   while (Result = 0) do
         begin
         if (SearchRec.Name+' ')[1] = '.' then
            { Se pegou nome de SubDiretorio }
            begin
            Result := FindNext( SearchRec );
            Continue;
            end;
         ADirList.Add( SearchRec.Name );
         Result := FindNext( SearchRec );
         end;
FindClose( SearchRec );
ADirList.Sort;
end;
