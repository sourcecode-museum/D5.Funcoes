function Padr(s:string;n:integer):string;
{alinha uma string à direita}
begin
Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;
