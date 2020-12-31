function IsUrl(S: string): Boolean;
//
// Testa se a String é uma url ou não
//
const
BADCHARS = ';*<>{}[]|\()^!';
var
p, x, c, count, i: Integer;
begin
Result := False;
if (Length(S) > 5) and (S[Length(S)] <> '.') and (Pos(S, '..') = 0) then
   begin
   for i := Length(BADCHARS) downto 1 do
       begin
       if Pos(BADCHARS[i], S) > 0 then
          begin
          exit;
          end;
       end;
   for i := 1 to Length(S) do
       begin
       if (Ord(S[i]) < 33) or (Ord(S[i]) > 126) then
          begin
          exit;
          end;
       end;
   if ((Pos('www.',LowerCase(S)) = 1) and (Pos('.', Copy(S, 5, Length(s))) > 0) and (Length(S) > 7)) or ((Pos('news:', LowerCase(S)) = 1) and (Length(S) > 7) and (Pos('.', Copy(S, 5, Length(S))) > 0)) then
       begin
       end
   else if ((Pos('mailto:', LowerCase(S)) = 1) and (Length(S) > 12) and (Pos('@', S) > 8) and (Pos('.', S) > 10) and (Pos('.', S) > (Pos('@', S) +1))) or ((Length(S) > 6) and (Pos('@', S) > 1) and (Pos('.', S) > 4) and (Pos('.', S) > (Pos('@', S) +1))) then
            begin
            Result := True;
            Exit;
            end
   else if ((Pos('http://', LowerCase(S)) = 1) and (Length(S) > 10) and (Pos('.', S) > 8)) or ((Pos('ftp://', LowerCase(S)) = 1) and (Length(S) > 9) and (Pos('.', S) > 7)) then
           begin
           Result := True;
           Exit;
           end
        else
           begin
           Result := True;
           end;
   for Count := 1 to 4 do
       begin
       p := Pos('.',S) - 1;
       if p < 0 then
          begin
          p := Length(S);
          end;
        Val(Copy(S, 1, p), x, c);
        if ((c <> 0) or (x < 0) or (x > 255) or (p>3)) then
           begin
           Result := False;
           Break;
           end;
        Delete(S, 1, p + 1);
        end;
   if (S <> '') then
       begin
       Result := False;
       end;
   end;
 end;
