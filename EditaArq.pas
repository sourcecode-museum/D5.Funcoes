function EditaArq(filename,Text:String): Boolean;
//
// Abre um arquivo já existente e insere
// um texto nele.
//
var
arquivo : TStringList;
begin
result := False;
try
  arquivo := TStringList.Create;
  if fileexists(filename) then
     begin
     arquivo.LoadFromFile(filename);
     end;
  if arquivo.Count >= 100 then
     begin
     result := False;
     end
  else
     begin
     arquivo.Add(Text);
     arquivo.SaveToFile(filename);
     result := True;
     end;
Except
  Result := False;
end;
arquivo.free;
end;
