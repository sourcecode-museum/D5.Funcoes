Function NomeComputador : String;
//
// Retorna o nome do computador
//
var
lpBuffer : PChar;
nSize    : DWord;
const
Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
begin
nSize := Buff_Size;
lpBuffer := StrAlloc(Buff_Size);
GetComputerName(lpBuffer,nSize);
Result := String(lpBuffer);
StrDispose(lpBuffer);
end;
