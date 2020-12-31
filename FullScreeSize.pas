function FullScreeSize: String;
//
// Retorna a área da área de trabalho
// disponível na tela
//
var
Area : TRect;
begin
SystemParametersInfo(SPI_GETWORKAREA, 0, @Area, 0);
Result := '('+IntToStr(Area.Left)+','+IntToStr(Area.Top)+')-('+IntToStr(Area.Bottom)+','+IntToStr(Area.Right)+')';
end;
