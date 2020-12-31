function LogUser : String;
{Retorna o nome do usuário logado na rede
 Requer a unit Registry declarada na clausula Uses da Unit}
var
  Registro: TRegistry;
begin
Registro := TRegistry.Create;
Registro.RootKey := HKEY_LOCAL_MACHINE;
if Registro.OpenKey('Network\Logon', false) then
   begin
   result := Registro.ReadString('username');
   end;
Registro.Free;
end;
