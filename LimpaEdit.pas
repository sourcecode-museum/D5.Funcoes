Procedure LimpaEdit; 
{Limpa Todos os Edit's de um Form de uma só vez}
var i : Integer; 
begin 
for i := 0 to ComponentCount -1 do
    begin 
    if Components[i] is TEdit then
       begin  
       TEdit(Components[i]).Text := ''; 
       end; 
    end; 
end;