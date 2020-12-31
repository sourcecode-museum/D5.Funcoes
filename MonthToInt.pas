function MonthToInt(const Month: string): integer;
//
// Entre com o Mes em Extenso e ela retorna
// seu correspondente em inteiro.
//
// Requer a Sysutils declarada na clausua Uses da unit
//
var
MonthIndex: integer;
NotFound : boolean;
begin
result := 0;
NotFound := true;
MonthIndex := 0;
while (MonthIndex < 12) and NotFound do
       begin
       inc(MonthIndex);
       if Month = LongMonthNames[MonthIndex] then
          begin
          NotFound := false;
          result := MonthIndex
          end;
      end;
end;
