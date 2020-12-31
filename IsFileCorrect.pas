function IsFileCorrect(fileandpath: string): Boolean;
//
// Testa se o arquivo possui caracteres inválidos em seu nome
//
const
BADCHARS = '/\?"*:<>|';
var
i: integer;
dir,filename: string;
begin
if Length(FileAndPath) > 0 then
   begin
   for i := Length(fileandPath) downto 1 do
       begin
       if fileandPath[i] = '\' then
          begin
          break;
          end;
       end;
   dir := Copy(FileAndPath, 1, i);
   if Length(dir) > 0 then
      begin
      if (DirectoryExists(dir)) then
         begin
         FileName := Copy(FileAndPath, i+1, Length(FileAndPath));
         end
       else
         begin
         Result := False;
         Exit;
         end;
      end
   else
      begin
      FileName := FileAndPath;
      end;
   for i := Length(BADCHARS) downto 1 do
       begin
       if Pos(BADCHARS[i], filename) > 0 then
       begin
         Result := False;
         exit;
       end;
       end;
   if (Length(Filename) = 0) or (Length(FileName) > 256) then
       begin
       Result := False;
       Exit;
       end;
   Result := True;
   end
else
   begin
   Result := False;
   end;
end;
