function IsAM: Boolean;
//
// Testa se a hora é antes de Meio dia
//
begin
Result := Frac(Time) < 0.5
end;
