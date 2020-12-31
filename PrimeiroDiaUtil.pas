Function PrimeiroDiaUtil(Data : TDateTime) : TDateTime;
//
// Retorna data do primeiro dia Util do mes, de uma data informada
//
var Ano, Mes, Dia : word;
DiaDaSemana : Integer;
begin
DecodeDate (Data, Ano, Mes, Dia);
Dia := 1;
DiaDaSemana := DayOfWeek(Data);
if DiaDaSemana = 1 Then
   begin
   Dia := 2;
   end
else if DiaDaSemana = 7 Then
        begin
        Dia := 3;
        end;
Result := EncodeDate (Ano, Mes, Dia);
end;
