function RoundNum(Valor:Extended;Decimais:Integer):Extended;
{Quando houver,Arredonda uma possivel terceira casa decimal em uma variável}
var
  I:Integer;
  Multiplicador:Integer;
begin
  if Decimais > 15 then
     begin
     Decimais := 15;
     end
  else if Decimais < 0 then
          begin
          Decimais := 0;
          end;
  Multiplicador := 1;
  for I:=1 to Decimais do
      begin
      Multiplicador := Multiplicador*10;
      end;
Result := round(Valor*Multiplicador)/Multiplicador;
end;
