Function HoraValida(strh:string): Boolean;
//
// Testa se uma string no formato Hora é
// valida ou não
//
var
hh   : Integer;
mm   : Integer;
code : Integer;
begin
Result := True;
If (Length(Strh) = 0) or (Strh[1] = ' ') or (Strh[2] = ' ') or (Strh[4] = ' ') or (Strh[5] = ' ') then
   begin
   Result := False;
   end
else
   begin
   Val(Copy(Strh, 1, 2), hh, Code);
   Val(Copy(Strh, 4, 2), mm, Code);
   If (hh >= 24) or (mm >= 60) then
      begin
      Result := False;
      end;
   end;
end;
