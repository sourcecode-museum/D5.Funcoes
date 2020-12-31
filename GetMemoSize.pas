function GetMemoSize(TheMemo: TObject): integer;
//
// Retorna o tamanho de um campo memo
//
var i: integer;
begin
result := 0;
with (TheMemo as TMemo).lines do
     begin
     for i := count - 1 downto 0 do
         begin
         result := result + length(strings[i]);
         end;
     end;
end;
