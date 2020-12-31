function CheckDateFormat(SDate:string):string;
//
// Converte qualquer caractere separador de datas para o
// caractere "-"
//
var
IDateChar:string;
x,y:integer;
begin
IDateChar:='.,\/';
for y:=1 to length(IDateChar) do
    begin
    x:=pos(IDateChar[y],SDate);
    while x > 0 do
          begin
          Delete(SDate,x,1);
          Insert('-',SDate,x);    
          x := pos(IDateChar[y],SDate);
          end;
     end;
Result := SDate;
end;
