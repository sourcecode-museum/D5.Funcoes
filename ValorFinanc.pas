function ValorFinanc(l: Longint;Cifr:Boolean): string;
//
// Insere uma mascara de Valores $ em um valor integer
//
var
len, count: integer;
s: string;
begin
str(l, s);
len := length(s);
insert(',',s, len -(len - (Len -1)));
len := len - 2;
for count := ((len - 1) div 3) downto 1 do
    begin
    insert('.', s, len - (count * 3) + 1);
    len := len + 1;
    end;
if Cifr then
   begin
   Result := 'R$ '+ s;
   end
else
   begin
   Result := s;
   end;
end;
