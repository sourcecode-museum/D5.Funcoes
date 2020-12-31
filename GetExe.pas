function GetExe(Ext : string) : string;
//
// Retorna o path completo do aplicativo que está associado
// ao arquivo cuja extensão você colocou em Ext
//
// Exemplo:
//
// Showmessage(GetExe('txt'));
// Vai retornar: C:\Windows\Notepad.exe
//
var
reg: TRegistry;  s : string;
I: integer;
begin
s := '';
reg := TRegistry.Create;
reg.RootKey := HKEY_CLASSES_ROOT;
if reg.OpenKey('.' + ext + '\shell\open\command',false) <> false then
   begin
   s := reg.ReadString('');
   reg.CloseKey;
   end
else
   begin
   if reg.OpenKey('.' + ext, false) <> false then
      begin
      s := reg.ReadString('');
      reg.CloseKey;
      if s <> '' then
         begin
         if reg.OpenKey(s + '\shell\open\command',false) <> false then
            begin
            s := reg.ReadString('');
            end;
         reg.CloseKey;
         end;
      end;
   end;
if ((length(s) > 0) and (s[1] = '"')) then
   Delete(s, 1, 1);
i := pos('.EXE',uppercase(S));
if I = 0 then
   begin
   Result := ''
   end
else
   begin
   Result := copy(S, 1, i +3);
   end;
end;
