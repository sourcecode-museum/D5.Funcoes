Function ReplaceString(ToBeReplaced, ReplaceWith : string; TheString :string):string;
//
// Substitui, em uma cadeia de caracteres, todas as ocorrências
// de uma string por outra
//
// ToBeReplaced: String a ser substituida
// ReplaceWith : String Substituta
// TheString: Cadeia de strings
//
var
Position:  Integer;
LenToBeReplaced:  Integer;
TempStr:  String;
TempSource:   String;
begin
LenToBeReplaced:=length(ToBeReplaced);
TempSource:=TheString;
TempStr:='';
repeat
      position := pos(ToBeReplaced, TempSource);
      if (position <> 0) then
         begin
         TempStr := TempStr + copy(TempSource, 1, position-1); //Part before ToBeReplaced
         TempStr := TempStr + ReplaceWith; //Tack on replace with string
         TempSource := copy(TempSource, position+LenToBeReplaced, length(TempSource));  // Update what's left
         end
      else
         begin
         Tempstr := Tempstr + TempSource; // Tack on the rest of the string
         end;
until (position = 0);
Result:=Tempstr;
end;
