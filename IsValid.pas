function IsValid(Ident: string;Modo:integer): Boolean;
//
// Função para validar somente
// numeros ou caracteres em uma string
//
const
Alpha = ['A'..'Z', 'a'..'z', '_'];
AlphaNumeric = ['0'..'9'];
var
I: Integer;
Value: set of char;
begin
case modo of
     1: Value := Alpha;
     2: Value := AlphaNumeric;
end;
Result := False;
if (Length(Ident) = 0) or not (Ident[1] in Value) then
    begin
    Exit;
    end;
for I := 2 to Length(Ident) do
    begin
    if not (Ident[I] in Value) then
       begin
       Exit;
       end;
    end;
Result := True;
end;
