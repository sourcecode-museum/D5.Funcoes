function Min(A, B: Integer): Integer;
{Compara dois valores Retornando o menor deles}
begin
  if A < B then
    Result := A
  else
    Result := B;
end;
