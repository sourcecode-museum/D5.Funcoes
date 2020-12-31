function validapis(Dado : String) : boolean;
{Testa se o número do pis é válido ou não}
var
i, wsoma, Wm11, Wdv,wdigito : Integer;
begin
if AllTrim(Dado) <> '' Then
   begin
   wdv := strtoint(copy(Dado, 11, 1));
   wsoma := 0;
   wm11 := 2;
   for i := 1 to 10 do
       begin
       wsoma := wsoma + (wm11 *strtoint(copy(Dado,11 - I, 1)));
       if wm11 < 9 then
          begin
          wm11 := wm11+1
          end
       else
          begin
          wm11 := 2;
          end;
       end;
   wdigito := 11 - (wsoma MOD 11);
   if wdigito > 9 then
      begin
      wdigito := 0;
      end;
   if wdv = wdigito then
      begin
      validapis := true;
      end
   else
      begin
      validapis := false;
      end;
   end;
end;
