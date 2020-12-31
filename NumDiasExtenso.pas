Function NumDiasExtenso(NumDias:integer):string;
{Retorna o número de dias calculados em extenso}
var
Anos, Meses, Dias : integer;
sAnos, sMeses, sDias : string;
begin
{ --- Calcula o número de anos --- }
Anos := 0;
while NumDias >= 365 do
      begin
      Anos := Anos + 1;
      NumDias := NumDias - 365;
      end;
if Anos > 1 then
   begin
   sAnos := ' anos ';
   end
else
   begin
   sAnos := ' ano ';
   end;
{ --- Calcula o número de meses --- }
Meses := 0;
while NumDias >= 30 do
      begin
      Meses := Meses + 1;
      NumDias := NumDias - 30;
      end;
if Meses > 1 then
   begin
   sMeses := ' meses e ';
   end
else
   begin
   sMeses := ' mês e ';
   end;
{ --- O Número de dias é a sobra --- }
Dias := NumDias;
if Dias > 1 then
   begin
   sDias := ' dias ';
   end
else
   begin
   sDias := ' dia ';
   end;
Result := Inttostr(Anos)+sAnos+inttostr(Meses)+sMeses+inttostr(Dias)+sDias;
end;
