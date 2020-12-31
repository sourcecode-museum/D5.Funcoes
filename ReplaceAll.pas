function ReplaceAll(StartString, FindString, ReplaceString: String): String;
//
// Substitui, em uma cadeia de caracteres, todas as ocorrências
// de uma string por outra
//
// StartString: Cadeia de strings
// FindString: String a ser substituida
// ReplaceString : String Substituta
//
var
NewStrBuffer: String;
CutText: String;
FindLength: Integer;
StartLength: LongInt;
TagStart: LongInt;
begin
FindLength := Length(FindString);
NewStrBuffer := '';
if FindLength = 0 then
   begin
   result := StartString;
   Exit;
   end;
if (FindString = ReplaceString) then
   begin
   result := StartString;
   Exit;
   end;
if Pos(FindString, StartString) <> 0 then  //if find tag found
   begin
   while Pos(FindString, StartString) <> 0 do
         begin
         StartLength := Length(StartString);
         TagStart := Pos(FindString, StartString);
         CutText := Copy(StartString, 0, TagStart - 1);
         StartString := Copy(StartString, TagStart + FindLength,StartLength - (TagStart + (FindLength - 1)));
         NewStrBuffer := NewStrBuffer + CutText + ReplaceString;
         end;
   NewStrBuffer := NewStrBuffer + StartString;
   result := NewStrBuffer;
   end
else
   begin
   result := StartString;
   end;
end;