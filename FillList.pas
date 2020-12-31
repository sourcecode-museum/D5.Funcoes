function FillList(sentnc: String; var sList : TStringList; clearList : Boolean): Boolean;
//
// Função que Incrementa uma StringList
//
var
str,wrd : String;
I : Word;
begin
Result := True;
str := sentnc;
wrd := '';
if (Length(sentnc) = 0) then
    begin
    MessageDlg('Foi Passada uma strign vazia', mtError, [mbOk], 0);
    Result := False;
    Exit;
    end;
if clearList AND (sList.Count > 0) then
   begin
   repeat
   sList.Delete(0);
   until
   sList.Count = 0;
   end;
while (Pos(' ', str) > 0) do
      begin
      wrd := Copy(str, 1, Pos(' ', str) - 1);
      sList.Add(wrd);
      str := Copy(str, Pos(' ', str) + 1, Length(str) - Length(wrd) + 1);
      end;
if (Length(str) > 0) then
    begin
    sList.Add(str);
    end;
end;


