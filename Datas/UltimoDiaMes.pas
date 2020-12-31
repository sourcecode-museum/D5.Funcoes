function UltimoDiaDoMes(pnMes: Integer):Integer;
{Retorna o ultimo dia de um determinado mes}
begin
  if pnMes = 2 then
    Result := 28

  else if pnMes in [1,3,5,7,8,10,12] then
    Result := 31

  else if pnMes in [4,6,9,11] then
    Result := 30

  else begin
    ShowMessage('Mês inválido!');
    Result := 0;
  end;
end;
