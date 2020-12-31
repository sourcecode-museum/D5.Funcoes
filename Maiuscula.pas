function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para
 maiuscula e as restantes para minuscula}
var
OldStart: Integer;
begin
if Texto <> '' then
    begin
    Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
    Result := Texto;
    end;
end;
