Procedure TableUnlock(Tb: TTable);
//
// Desbloqueia uma tabela
//
// Requer DBIprocs, DB, DBTables
// declarados na clausula uses da unit
//
Var
i, ilocks: word;
begin
dbiIsTableLocked( Tb.Handle, dbiWRITELOCK, iLocks ) ;
For i :=1 to ilocks do       // Remove todos os locks
    begin
    Tb.UnlockTable(ltWriteLock);
    end
end;
