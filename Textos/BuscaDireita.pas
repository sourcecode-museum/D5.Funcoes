function BuscaDireita(Busca,Text : string) : integer;
{Pesquisa um caractere à direita da string,
 retornando sua posição}
var n,retorno : integer;
begin
retorno := 0;
for n := length(Text) downto 1 do
   begin
      if Copy(Text,n,1) = Busca then
         begin
            retorno := n;
            break;
         end;
   end;
Result := retorno;
end;

