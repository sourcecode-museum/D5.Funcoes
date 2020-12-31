function GetWinDir: string;
//
// Retorna o path corrente do diretório
// do Windows
//
var
S: string;
i: integer;
begin
i := 255;
SetLength(S, i);
i := GetWindowsDirectory(PChar(S), i);
SetLength(S, i);
Result := Trim(S);
end;



