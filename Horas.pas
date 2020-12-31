function  Horas(Hora: TDateTime): Integer;
{Retorna a hora de uma determinada hora}
var
  Hour,Minute,Sec,Sec100: Word;
begin
  DecodeTime(Hora,Hour,Minute,Sec,Sec100);
  Result := Hour;
end;
