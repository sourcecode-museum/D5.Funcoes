function AnoBis(Data: TDateTime): Boolean;
{Testa se um ano é bixesto, retornando True em caso positivo}
var
   Dia,Mes,Ano : Word;
begin
DecodeDate(Data,Ano,Mes,Dia);
if Ano mod 4 <> 0 then
   begin
   AnoBis := False;
   end
else if Ano mod 100 <> 0 then
        begin
        AnoBis := True;
        end
else if Ano mod 400 <> 0 then
        begin
        AnoBis := False;
        end
else
   begin
   AnoBis := True;
   end;
end;
