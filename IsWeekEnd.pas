Function IsWeekEnd(dData : TDateTime) : boolean;
//
// Verifica se uma data informada cai em um final de semana
//
begin
if (DayOfWeek(dData) = 1) or (DayOfWeek(dData) = 7) Then
    begin
    result := true;
    end
else
   begin
   result := false;
   end;
end;