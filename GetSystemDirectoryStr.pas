function GetSystemDirectoryStr: string;
//
// Retorna o path do diretório System
// do Windows
//
const
fsPathName = 255;
var
Buff: array [0..fsPathName] of char;
begin
GetSystemDirectory(Buff,fsPathName);
Result := StrPas(Buff);
end ;
