function LongToShortPath(Long: string): string;
//
// Retorna um Path em formato de nome curto (8 Caracteres)
//
// Requer a filectrl declarada na clausula uses da unit
//
var
ActualLength: Longint;
begin
if directoryexists(Long) then
   begin
   SetLength(Result, Length(Long) + 1);
   ActualLength := GetShortPathName(PChar(Long), PChar(Result), Length(Result));
   SetLength(Result, ActualLength);
   end
else
   begin
   result :=  'Caminho inválido ou não encontrado';
   end;
end;
