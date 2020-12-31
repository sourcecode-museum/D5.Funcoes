function EsvaziaTabela(Tabela : TTable): Boolean;
// Esvazia a tabela passada como parametro

var
lExclusivo : boolean;
begin
Tabela.Active := False;  
repeat
try
  Tabela.Exclusive := True;
  Tabela.Active := True;
  Tabela.EmptyTable;
  lExclusivo := True;
  Break;
except
    on EDatabaseError do
      if MessageDlg('A tabela está sendo usada por outro usuário. Tenta novamente ?', mtError,[mbOK, mbCancel], 0) <> mrOK then
         begin
         lExclusivo := False;
         raise;
         end;
     end;
until False;
Result := lExclusivo;
end;

