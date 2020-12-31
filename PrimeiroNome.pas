function PrimeiroNome (Nome : String) : String;
// Para pegar o primeiro nome de uma pessoa
var
  PNome : String;
begin
PNome := '';
if pos (' ', Nome) <> 0 then
   begin
   PNome := copy (Nome, 1, pos (' ', Nome) - 1);
   end;
Result := PNome;
end;
 