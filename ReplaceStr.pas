function ReplaceStr(Sstring: string; OldChar, NewChar: char): string;
//
// Substitui um carctere por outro em uma string
//
var
Temp: string;
I: integer;
begin
Temp := '';
for I := 1 to Length (Sstring) do
    begin
    if S[I] <> OldChar then
       begin
       Temp := Temp + Sstring[I];
       end
    else
       begin
       Temp := Temp + NewChar;
       end;
    end;
Result := Temp;
end;
