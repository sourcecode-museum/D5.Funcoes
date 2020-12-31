function BuscaTroca(Text,Busca,Troca : string) : string;
{ Substitui um caractere dentro da string}
var n : integer;
begin
for n := 1 to length(Text) do
   begin
   if Copy(Text,n,1) = Busca then
      begin
      Delete(Text,n,1);
      Insert(Troca,Text,n);
      end;
   end;
Result := Text;
end;
