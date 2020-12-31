function RegeneraIndex(ActiveTable : TTable):WordBool;
//
// Regenera o indice de uma tabela
//
// Requer a BDE declarada na clausula Uses da Unit
//
begin
Try
   with ActiveTable Do
        Begin
        Close;
        Exclusive := True;
        Open;
        Check(DbiRegenIndexes(ActiveTable.Handle));
        Close;
        Exclusive := True;
        Active := True;
        Check(DbiSaveChanges(ActiveTable.Handle));
        Result := True;
        end;
except
   on E: EDatabaseError do
      begin
      result := false;
      end;
   end;
end;
