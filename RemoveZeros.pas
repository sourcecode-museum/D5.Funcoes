function RemoveZeros(S: string): string;
//
// Remove os zeros a frente de um valor
//
var
I, J : Integer;
begin
I := Length(S);
while (I > 0) and (S[I] <= ' ') do
      begin
      Dec(I);
      end;
J := 1;
while (J < I) and ((S[J] <= ' ') or (S[J] = '0')) do
      begin
      Inc(J);
      end;
Result := Copy(S, J, (I-J)+1);
end;
