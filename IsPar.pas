function IsPar(TestaInteiro : Integer) : boolean;
begin
if (TestaInteiro div 2) = (TestaInteiro/2) then
   begin
   result := True;
   end
else
   begin
   result := False;
   end;
end;
