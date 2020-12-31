function IntToBin(Value: LongInt;Size: Integer): String;
{Converte uma string em binário}
var
  i: Integer;
begin
Result:='';
for i:=Size downto 0 do
    begin
    if Value and (1 shl i)<>0 then
       begin
       Result:=Result+'1';
       end
    else
       begin
       Result:=Result+'0';
       end;
    end;
end;

