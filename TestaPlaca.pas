Procedure TestaPlaca(Value:integer);
{Testa se existe uma placa de som no seu computador}
begin
som := '';
if WaveOutGetNumDevs > 0 then
   begin
   result := True
   end
else
   begin
   Result := False;
   end;
end;
