function StrZerodec(Numero: Double; Total, Decimal: integer): string;
{Insere Zeros e decimais à frente de uma string}
var
 TempStr: string;
begin
 Str(Numero:0:Decimal,TempStr);
 while length(TempStr) < Total do
       Insert('0',TempStr,1);
       StrZero:=TempStr;
end;
