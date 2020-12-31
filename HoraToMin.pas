Function HoraToMin(Hora: String): Integer;
//
//  Converte hora (formato HH:MM) para minutos
//
begin
Result := (StrToInt(Copy(Hora,1,2))*60) + StrToInt(Copy(Hora,4,2));
end;
