function DiasNoMes(AYear, AMonth: Integer): Integer;
//
// Retorna quantos dias tem um referido mes do ano
//
const
DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
if AMonth = 2 then
   begin
   if Ayear mod 4 = 0 then
      begin
      Inc(DaysInMonth[AMonth]);
      end;
   end;
Result := DaysInMonth[AMonth];
end;
