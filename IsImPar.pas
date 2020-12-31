function IsImPar(TestaInteiro : Integer) : boolean;
begin
if (TestaInteiro div 2) = (TestaInteiro/2) then
   begin
   result := False;
   end
else
   begin
   result := True;
   end;
end;
