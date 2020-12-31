function MaskString(Valor: String) : String;
{coloca uma máscara númerica em uma String numérica}
begin
Result := FormatMaskText('!aaaaaaaaaaaaaa;0; ',(FormatFloat('#,##0.00',StrToFloat(valor))));
end;

