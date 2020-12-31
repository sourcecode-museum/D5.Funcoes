function StrToIntRange(Const S: String; Min, Max: Longint): Longint;
// converte uma string em Integer desde que esteje dentro da faixa selecionada
begin
result := StrToInt(S);
if (result < Min) or (result > Max) then
   begin
   raise ERangeError.CreateFmt('%d está fora da faixa de valores permitidos de %d..%d',[Result, Min, Max]);
   end;  
end;