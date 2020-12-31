Function LockTable(Tb: TTable; Vezes: Integer): Boolean;
//
// Testa se a tabela esta bloqueada ou nao
//
// Requer DBIprocs, DB, DBTables]
// declarados na clausula Uses da unit
//
var
FlagLock  : Boolean;
Abandonou : Boolean;
Sempre    : Boolean;
Ind       : Integer;
Quant     : Integer;
Temp      : String;
NomeArq   : String;
Mensagem  : String;
begin
Sempre    := (Vezes = 0);
FlagLock  := True;
Abandonou := False;
Quant     := 0;
NomeArq   := '';
Temp      := Tb.TableName;
Ind       := 1;
while Ind <= Length(Temp) do
      begin
      if Copy(Temp,Ind,1) = '.' then
         begin
         Ind := Length(Temp);
         end
       else
         begin
         NomeArq := NomeArq + Copy(Temp,Ind,1);
         end;
       Ind := Ind + 1;
      end;
NomeArq  := UpperCase(NomeArq);
Mensagem := 'O arquivo "'+NomeArq+'" está sendo usado por outro usuário da rede.'+#13;
Mensagem := Mensagem + 'Deseja continuar tentando acessar este arquivo ?';
while FlagLock do
      begin
      try
        Tb.LockTable(ltWriteLock);
        FlagLock := False;
      except
        if (Quant > Vezes) and not Sempre then
            begin
            if MessageBox(GetActiveWindow, Pchar(Mensagem),'Confirmação', MB_ICONQUESTION+MB_YESNO+MB_HELP) = idYes then
               begin
               Quant := 0;
               end
            else
               begin
               FlagLock  := False;
               Abandonou := True;
               end;
            end;
       end;
      Quant := Quant + 1;
      end;
Result := not Abandonou;
end;