function LastPos(Substr, S : String) : Integer;
//
// Essa função vai retornar a última posição encontrada. Se a
// substring for maior que a string, com certeza é diferente.
// Se for igual, é checar se as strings são iguais. Se for
// menor, procura pelos "pedaços" da string original. É igual
// ao Pos, se não encontrar nada, resulta zero (0).
//
var
I : Integer;
begin
Result := 0;
if length (Substr) = length (S) then
   begin
   if Substr = S then
      begin
      Result := 1;
      end
   else
      begin
      Result := 0;
      end;
   end
else
  if length (Substr) < length (S) then
     begin
     I := length (S) - length (Substr);
     repeat
     if copy (S, I, length (Substr)) = Substr then
        begin
        Result := I;
        end;
     dec (I);
     until (I = 0) or (Result <> 0);
     end;
end;
