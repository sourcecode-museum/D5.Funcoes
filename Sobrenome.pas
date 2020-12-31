function Sobrenome(S : string) : string;
//
// Retorna o Sobrenome de um nome especificado
//
var
  i, Size: Integer;
begin
  i := Pos(#32, S);
  if i = 0 then
     begin
     Result := S;
     Exit;
     end
  else
     begin
     Size := (Length(S) - i);
     Move(S[i + 1], S[1], Size);
     SetLength(S, Size);
     Result := S;
     end;
end;
