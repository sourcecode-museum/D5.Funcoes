function FormatNumber(l: longint): string;
//
// Formata um valor numérico inserindo mascaras
// do ponto nele.
//
var
len, count: integer;
s: string;
begin
str(l, s);
len := length(s);
for count := ((len - 1) div 3) downto 1 do
    begin
    insert('.', s, len - (count * 3) + 1);
    len := len + 1;
    end;
FormatNumber := s;
end;
