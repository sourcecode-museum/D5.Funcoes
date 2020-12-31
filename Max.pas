function Max(A, B: Integer): Integer;
{Compara dois valores Retornando o maior deles}
begin
  if A > B then
    Result := A
  else
    Result := B;
end;
