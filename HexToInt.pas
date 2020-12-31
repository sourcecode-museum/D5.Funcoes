function HexToInt(const HexStr: string): longint;
//
// Converte um valor Hexadecimal em Integer
//
var
iNdx: integer;
cTmp: Char;
begin
result := 0;
for iNdx := 1 to Length(HexStr) do 
    begin
    cTmp := HexStr[iNdx];
    case cTmp of
         '0'..'9': Result := 16 * Result + (Ord(cTmp) - $30);
         'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37);
         'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57);
     else
         raise EConvertError.Create('Illegal character in hex string');
     end;
     end;
end;