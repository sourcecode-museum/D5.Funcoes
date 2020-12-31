procedure RemoveChave(Chave:Hkey; Nomedachave:String;Valordachave:String;Descricao:String;ExcluirValorChave:Bool);
//
// Remove um valor do registro do Windows
//
// Requer a Registry declarada na clausua uses da unit
//
// ex:
// RegWindowsChave(HKEY_LOCAL_MACHINE,'\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','Calculadora','c:\windows\calc.exe',true);
// remove um valor da chave Run do Registro
//
var
Reg: TRegistry;
begin
Reg := TRegistry.Create;
Reg.RootKey := Chave;
Reg.LazyWrite := False;
Reg.OpenKey(NomedaChave, True);
if ExcluirValorChave then
   begin
   Reg.DeleteValue(ValordaChave)
   end
else
   begin
   Reg.WriteString(ValorDaChave, Descricao);
   end;
Reg.CloseKey;
Reg.Free;
end;
