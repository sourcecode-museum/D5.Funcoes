function DecToRoman( Decimal: LongInt ): String;
{Converte um numero decimal em algarismos romanos}
const
Romans:  Array[1..13] of String = ( 'I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC', 'C', 'CD', 'D', 'CM', 'M' );
Arabics: Array[1..13] of Integer =( 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000);
var
i: Integer;
scratch: String;
begin
  scratch := '';
  for i := 13 downto 1 do
    while ( Decimal >= Arabics[i] ) do
           begin
           Decimal := Decimal - Arabics[i];
           scratch := scratch + Romans[i];
           end;
   Result := scratch;
end;
