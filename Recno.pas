Function Recno(Dataset: TTable): Longint;
//
// Retorna o registro corrente da tabela
//
// Requer a BDE declarada na clausula uses da unit
//
var
CursorProps: CurProps;
RecordProps: RECProps;
begin
with Dataset do
     begin
     Check(DbiGetCursorProps(Handle, CursorProps));
     UpdateCursorPos;
     try
       Check(DbiGetRecord(Handle, dbiNOLOCK, nil, @RecordProps));
       case CursorProps.iSeqNums of
            0: Result := RecordProps.iPhyRecNum; { dBASE }
            1: Result := RecordProps.iSeqNum; { Paradox }
            end;
     except
        on EDBEngineError do
           Result := 0;
     end;
end;
end;

