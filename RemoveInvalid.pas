Function RemoveInvalid(what, where: string): string;
// elimina a parte da string a partir dos caracteres inválidos especificados
var
  tstr: string;
begin
  tstr := where;
  while pos(what, tstr)>0 do
    tstr := copy(tstr,1,pos(what,tstr)-1) +
       copy(tstr,pos(what,tstr)+length(tstr),length(tstr));
  Result := tstr;
end;
