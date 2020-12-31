function StrIsInList(sl: TStrings; s : string): boolean;
//
// Insere um Item em um Listbox ou Combobox, mas somente
// se ele não existir lá
//
// Ex:
// if not StrIsInList(ListBox1.Items,Edit1.Text) then
//   ListBox1.Items.Add(Edit1.Text);
//
var
n : integer;
begin
Result := False;
if false then
   s := LowerCase( s );
   for n := 0 to ( sl.Count - 1 ) do
       begin
       if ((False and (s = LowerCase(sl.Strings[ n ]))) or (s = sl.Strings[n])) then
          begin
          Result := True;
          Exit;
          end;
       end;
end;
