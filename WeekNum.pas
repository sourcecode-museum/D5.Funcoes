function  WeekNum(const TDT:TDateTime) : Word;
//
// Retorna quantos fins de semana já se passaram
// no corrente ano
//
var
Y,M,D:Word;
dtTmp:TDateTime;
begin
DecodeDate(TDT,Y,M,D);
dtTmp := EnCodeDate(Y,1,1);
Result := (Trunc(TDT-dtTmp)+(DayOfWeek(dtTmp)-1)) DIV 7;
if Result = 0  then
   begin
   Result := 51
   end
else
   begin
   Result := Result-1;
   end;
End;

