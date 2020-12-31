function RemoveExtension(pStrValue: string ): string ;
//
// Retorna o nome do arquivo especificado sem a extensão
//
var i : integer ;
begin
i := Pos('.',pStrValue) ;
if i <> 0 then
   begin
   result := copy(pStrValue,1,i - 1) ;
   end
else
   begin
   result := pStrValue ;
   end;
end;
