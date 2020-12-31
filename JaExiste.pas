function JaExiste(PForm: TForm): Boolean;
//
// Verifica a existencia de um form
//
var
i : Integer;
begin
Result := False;
for i:= 0 to Screen.FormCount - 1 do
    begin
    if Screen.Forms[i] = PForm then
       begin
       Result := True;
       Break;
       end;
    end;
end;
