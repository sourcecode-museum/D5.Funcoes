function GetNetStation(Tipo:Integer) : string;
//
// Retorna informações sobre o Computador na rede
//
// Requer a Registry declarada na clausula uses da unit
//
// Tipo :  1 - Nome do Computador na rede
//         2 - Nome do Grupo de trabalho
//         3 - Descrição do computador na rede
//
var
Reg : TRegistry;
begin
Reg := TRegistry.create;
Result := '(n/a)';
with Reg do
     try
       RootKey := HKEY_LOCAL_MACHINE;
       if OpenKey('System\CurrentControlSet\Services\VxD\VNETSUP', false) then
          begin
          Case Tipo of
               1: Result := ReadString('ComputerName');
               2: Result := ReadString('Workgroup');
               3: Result := ReadString('Comment');
          end;
          end;
     Finally
        CloseKey;
        free;
     end;
end;
