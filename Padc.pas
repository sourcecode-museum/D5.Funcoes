function PadC(S:string;Len:byte):string;
// Centraliza uma string em um espaço determinado
var
 Str:String;
 L:byte;
begin
str :='';
if len < Length(s) then
   begin
   Result := '';
   Exit;
   end;
l:=(Len-Length(S)) div 2;
while l > 0 do
      begin
      str:=str+' ';
      dec(l);
      end;
for l:=1 to length(S) do
    begin
    str := str+s[L];
    end;
 Result := str;
end;
