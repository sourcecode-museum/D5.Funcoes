function PeriodoMes(Periodo :String):Integer;
{Retorna o numero correspondente ao periodo}
begin
Periodo := Uppercase(periodo);
if Periodo = 'MENSAL' then
   begin
   Result := 1;
   end
else if Periodo = 'BIMESTRAL' then
        begin
        Result := 2;
        end
else if Periodo = 'TRIMESTRAL' then
        begin
        Result := 3;
        end
else if Periodo = 'QUADRIMESTRAL' then
        begin
        Result := 4;
        end
else if Periodo = 'SEMESTRAL' then
        begin
        Result :=  6;
        end
else if Periodo = 'ANUAL' then
        begin
        Result := 12;
        end
else
   begin
   result := 0;
   end;
end;
