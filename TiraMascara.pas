function TiraMascara(text:string): String;
//
// Remove mascaras de valores Numericos
//
var aux:string;
    i:integer;
begin
Aux := '';
for i :=1 to Length(text) do
    begin
    if(copy(text,i,1)<>'.') and (copy(text,i,1)<>'-') and (copy(text,i,1)<>'/')and(copy(text,i,1)<>'\') then
      begin
      Aux := Aux + copy(text,i,1);
      end;
    end;
Result := Aux;
end;
