function DecToBase( Decimal: LongInt; const Base: Byte): String;
{converte um número decimal na base especificada}
const
  Symbols: String[16] = '0123456789ABCDEF';
var
  scratch: String;
  remainder: Byte;
begin
  scratch := '';
  repeat
    remainder := Decimal mod Base;
    scratch := Symbols[remainder + 1] + scratch;
    Decimal := Decimal div Base;
  until ( Decimal = 0 );
  Result := scratch;
end;
