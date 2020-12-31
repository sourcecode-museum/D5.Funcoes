function Replace(aValue, aFind, aReplaceWith : String) : String;
//
// Substitui, em uma cadeia de caracteres, todas as ocorrências
// de uma string por outra
//
// aValue: Cadeia de strings
// aFind: String a ser substituida
// aReplaceWith : String Substituta
//
var
LaFind,
X : Integer;
UaReplaceWith,
UaValue,
UaFind : String;
begin
UaValue := Uppercase(aValue);
UaFind := Uppercase(aFind);
UaReplaceWith := Uppercase(aReplaceWith);
LaFind := Length(aFind);
for X:= Length(aValue) downto 1 do
    begin
    if Copy(UaValue,X,LaFind) = UaFind then
       begin
       Delete(aValue,X,LaFind);
       Insert(aReplaceWith,aValue,X);
       Delete(UaValue,X,LaFind);
       Insert(UaReplaceWith,UaValue,X);
       end;
    end;
Result := aValue;
end;
