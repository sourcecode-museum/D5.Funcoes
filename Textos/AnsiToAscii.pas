function AnsiToAscii( str: String ): String;
//
// Converte um caractere da tabela Ansi para
// Ascii
//
var i: Integer;
begin
for i := 1 to Length (str) do
    begin
    case str[i] of
         'á': str[i] := 'a';
         'é': str[i] := 'e';
         'í': str[i] := 'i';
         'ó': str[i] := 'o';
         'ú': str[i] := 'u';
         'à': str[i] := 'a';
         'è': str[i] := 'e';
         'ì': str[i] := 'i';
         'ò': str[i] := 'o';
         'ù': str[i] := 'u';
         'â': str[i] := 'a';
         'ê': str[i] := 'e';
         'î': str[i] := 'i';
         'ô': str[i] := 'o';
         'û': str[i] := 'u';
         'ä': str[i] := 'a';
         'ë': str[i] := 'e';
         'ï': str[i] := 'i';
         'ö': str[i] := 'o';
         'ü': str[i] := 'u';
         'ã': str[i] := 'a';
         'õ': str[i] := 'o';
         'ñ': str[i] := 'n';
         'ç': str[i] := 'c';
         'Á': str[i] := 'A';
         'É': str[i] := 'E';
         'Í': str[i] := 'I';
         'Ó': str[i] := 'O';
         'Ú': str[i] := 'U';
         'À': str[i] := 'A';
         'È': str[i] := 'E';
         'Ì': str[i] := 'I';
         'Ò': str[i] := 'O';
         'Ù': str[i] := 'U';
         'Â': str[i] := 'A';
         'Ê': str[i] := 'E';
         'Î': str[i] := 'I';
         'Ô': str[i] := 'O';
         'Û': str[i] := 'U';
         'Ä': str[i] := 'A';
         'Ë': str[i] := 'E';
         'Ï': str[i] := 'I';
         'Ö': str[i] := 'O';
         'Ü': str[i] := 'U';
         'Ã': str[i] := 'A';
         'Õ': str[i] := 'O';
         'Ñ': str[i] := 'N';
         'Ç': str[i] := 'C';
         end;
    end;
    Result := str;
end;
