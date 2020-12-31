function Before(const Search, Find: string): string;
{Retorna uma cadeia de caracteres antecedentes
 a uma parte da string selecionada}
const
   BlackSpace = [#33..#126];
var
   index: byte;
begin
   index:=Pos(Find, Search);
   if index = 0 then
      Result:=Search
   else
      Result:=Copy(Search, 1, index - 1);
end;
