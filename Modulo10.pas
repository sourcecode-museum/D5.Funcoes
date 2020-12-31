function Modulo10(S: String): Word;
//
// Calcula o modulo 10 para do numero que vem embaixo do
// codigo de barra, para o caso do leitor ótico nao
// conseguir ler o numero
//
var
Indice: ShortInt;
Peso: ShortInt;
Soma: Integer;
Total: ShortInt;
DV: ShortInt;
begin
Soma := 0;
Peso := 2;
for Indice := Length(S) downto 1 do
    begin
    Total := StrToInt(Copy(S, Indice, 1)) * Peso;
    if Total > 9 then
       begin 
       Soma := Soma + 1 + (Total - 10);
       end      
    else
       begin
       Soma := Soma + Total;
       end;
    if Peso = 1 then
       begin
       Peso := 2
       end
    else
       begin
       Peso := 1;
       end;
    end;
DV := 10 - Soma Mod 10;
if DV = 10 then
   begin
   DV := 0;
   end;
Result := DV;
end;
