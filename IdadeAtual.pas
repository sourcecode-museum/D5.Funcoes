function IdadeAtual(Nasc : TDate): Integer;
//
// Retorna a idade Atual de uma pessoa a partir da data de nascimento
//
// Esta função retorna a idade em formato integer
//
Var AuxIdade, Meses : String;
    MesesFloat : Real;
    IdadeInc, IdadeReal : Integer;
begin
  AuxIdade := Format('%0.2f', [(Date - Nasc) / 365.6]);
  Meses := FloatToStr(Frac(StrToFloat(AuxIdade)));
  if AuxIdade = '0' then
     begin
     Result := 0;
     Exit;
     end;
  if Meses[1] = '-' then
     begin
     Meses := FloatToStr(StrToFloat(Meses) * -1);
     end;
  Delete(Meses, 1, 2);
  if Length(Meses) = 1 then
     begin
     Meses := Meses + '0';
     end;
  if (Meses <> '0') And (Meses <> '') then
     begin
     MesesFloat := Round(((365.6 * StrToInt(Meses)) / 100) / 30.47)
     end
  else
     begin
     MesesFloat := 0;
     end;
  if MesesFloat <> 12 then
     begin
     IdadeReal := Trunc(StrToFloat(AuxIdade)); // + MesesFloat;
     end
  else
     begin
     IdadeInc := Trunc(StrToFloat(AuxIdade));
     Inc(IdadeInc);
     IdadeReal := IdadeInc;
     end;
  Result := IdadeReal;
end;