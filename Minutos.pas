function  Minutos(Hora: TDateTime): Integer;
{Retorna os minutos de uma determinada hora}
var
  Hour,Minute,Sec,Sec100: Word;
begin
  DecodeTime(Hora,Hour,Minute,Sec,Sec100);
  Result := Minute;
end;
