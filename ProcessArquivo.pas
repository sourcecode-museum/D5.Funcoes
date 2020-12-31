function ProcessArquivo(const Origem, Destino : string; Operacao, Modo:Integer) : Boolean;
//
// Copia ou move arquivos usando a API do Windows
//
// Requer a unit ShellApi na clausula uses da unit
//
Const
Aborted : Boolean = False;
var
shfo : TSHFileOpStruct;
begin
FillChar(shfo,SizeOf(shfo),$0);
with shfo do
     begin
     if Operacao > 2 then
        begin
        operacao := 2;
        end;
     if Modo > 5 then
        begin
        modo := 1;
        end;
     case operacao of
          1: wFunc := FO_MOVE;
          2: wFunc := FO_COPY;
     end;
     pFrom := Pchar(Origem);
     pTo   := Pchar(Destino);
     case Modo of
          1: fFlags := FOF_SILENT;
          2: fFlags := FOF_ALLOWUNDO or FOF_FILESONLY;
          3: fFlags := FOF_RENAMEONCOLLISION;
          4: fFlags := FOF_NOCONFIRMATION;
          5: fFlags := FOF_SIMPLEPROGRESS;
     end;
     end;
Result := (SHFileOperation(shfo)= 0) and (not Aborted);
end;
