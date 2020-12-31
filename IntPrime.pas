function IntPrime(Value: Integer): Boolean;
{Testa se um numero é primo ou não}
var
i : integer;
begin
Result := False;
Value := Abs(Value);
if Value mod 2 <> 0 then
   begin
   i := 1;
   repeat
   i := i + 2;
   Result:= Value mod i = 0
   until Result or ( i > Trunc(sqrt(Value)) );
         Result:= not Result;
   end;
end;
