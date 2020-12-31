function DecToBinStr(n: integer): string;
{Converte um numero decimal em binário}
var
S: string;
i: integer;
Negative: boolean;
begin
if n < 0 then
   begin
   Negative := true;
   end;
n := Abs(n);
for i := 1 to SizeOf(n) * 8 do
    begin
    if n < 0 then
       begin
       S := S + '1';
       end
    else
       begin
       S := S + '0';
       end;
    n := n shl 1;
    end;
Delete(S,1,Pos('1',S) - 1);//remove leading zeros
if Negative then
   begin
   S := '-' + S;
   end;
Result := S;
end;
