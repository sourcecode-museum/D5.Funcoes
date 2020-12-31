function DiaSemana(Data: TDateTime): String;
{Retorna o dia da semana em Extenso de uma determinada data}
const
  Dias : Array[1..7] of String[07] = ('DOMINGO', 'SEGUNDA', 'TERCA','QUARTA','QUINTA', 'SEXTA','SABADO');
begin
  Result := Dias[DayOfWeek(Data)];
end;

