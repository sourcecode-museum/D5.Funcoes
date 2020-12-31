function DiskSpace( drive: byte ): String;
//
// Retorna o espaço livre em disco
// Esta funcao so funciona em Fat16
//
var
bytes: longint;
begin
bytes := DiskFree(drive);
if ( bytes >= 0 ) then
   result := inttostr( bytes div 1024 ) +' KB'
else
   result := '> 2GB';
end;
