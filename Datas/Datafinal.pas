function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acresçida de mais um certo número de dias
// uteis descontando os fins de semana
//
var dw:integer;
begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 5)*2;
end;
