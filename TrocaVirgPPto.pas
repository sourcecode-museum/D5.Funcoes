function TrocaVirgPPto(Valor: string): String;
//
// Troca a virgula pelo ponto em um valor Float
//
var i:integer;
begin
if Valor <> ' ' then
   begin
   for i := 0 to Length(Valor) do
       begin
       if Valor[i]='.' then
          begin
          Valor[i]:=',';
          end
       else if Valor[i] = ',' then
               begin
               Valor[i]:='.';
               end;
       end;
   end;
   Result := valor;
end;
