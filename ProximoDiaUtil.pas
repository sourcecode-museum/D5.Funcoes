Function ProximoDiaUtil(dData : TDateTime) : TDateTime;
//
// Retorna o próximo dia útil caso a data informada caia em um fim de semana
//
begin
if DayOfWeek(dData) = 7 then
   begin
   dData := dData + 2
   end
else if DayOfWeek(dData) = 1 then
        begin
        dData := dData + 1;
        end;
Result := dData;
end;
