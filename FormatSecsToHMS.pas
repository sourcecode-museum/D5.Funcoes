function FormatSecsToHMS(Secs: LongInt): string;
//
// Converte um certo número de segundos em horas
// já formatada
//
var
Hrs, Min: Word;
begin
Hrs := Secs div 3600;
Secs := Secs mod 3600;
Min := Secs div 60;
Secs := Secs mod 60;
Result := Format('%d:%d:%d', [Hrs, Min, Secs]);
end;
