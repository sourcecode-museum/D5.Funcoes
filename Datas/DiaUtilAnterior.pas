Function DiaUtilAnterior(dData : TDateTime) : TDateTime;
//
// Retorna o Ultimo dia Útil caso a data informada caia em um fim de semana
//
begin
if DayOfWeek(dData) = 7 then
   begin
   dData := dData - 1;
   end
else if DayOfWeek(dData) = 1 then
        begin
        dData := dData - 2;
        end;
Result := dData;
end;