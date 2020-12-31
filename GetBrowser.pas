function GetBrowser: String;
//
// Retorna o Path de seu Browser padrão
//
// Requer a Registry declarada na clausual Uses da unit
//
var
Browser: String;
I: Integer;
Reg: TRegistry;
begin
Reg := TRegistry.Create;
with Reg do
     begin
     try
       RootKey := HKEY_CLASSES_ROOT;
       if not OpenKey('http\shell\open\command',False) then
          begin
          Browser := '';
          end
       else
          begin
          Browser := ReadString('');
          end;
       CloseKey;
     finally
       Free;
       Reg := nil;
     end;
     I := Pos('.exe',LowerCase(Browser));
     if I > 0 then
        begin
        Browser := Copy(Browser, 1, (I+3));
        end;
     I := Pos('"',Browser);
     while I > 0 do
           begin
           Delete(Browser,1,I);
           I := Pos('"',Browser);
           end;
     end;
Result := Browser;
end;
