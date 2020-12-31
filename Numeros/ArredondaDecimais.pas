function Arredonda(Valor : Real ; Decimais : Byte) : Extended;
// 
// Arredonda as casas decimais de um valor Float
//
var
  i : Byte;
  ML : string;
  RR : string;
begin
ML := '0.';
for i := 1 To Decimais do
    begin
    ML := ML + '0';
    end;
RR := FormatFloat(ML,Valor);
Result := StrToFloat (RR);
end;
