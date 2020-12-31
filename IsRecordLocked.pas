function IsRecordLocked(Table: TTable; ByAnyone: Boolean): Boolean;
//
// Testa se o registro da tabela está travado ou não
//
//  Requer a DBIprocs declarada na clausula uses da unit
//
var
Locked: BOOL;
hCur: hDBICur;
rslt: DBIResult;
begin
Table.UpdateCursorPos;
Check(DbiIsRecordLocked(Table.Handle, Locked));
Result := Locked;
if (not Result) and (ByAnyone) then
    begin
    Check(DbiCloneCursor(Table.Handle, False, False, hCur));
    try
      rslt := DbiGetRecord(hCur, dbiWRITELOCK, nil, nil);
      if (rslt <> DBIERR_NONE) then
         begin
         if (HiByte(rslt) = ERRCAT_LOCKCONFLICT) then
            begin
            Result := True;
            end
         else
            begin
            Check(rslt);
            end;
         end
      else
         begin
         Check(DbiRelRecordLock(hCur, False));
         end;
    finally
      Check(DbiCloseCursor(hCur));
    end;
    end;
end;
