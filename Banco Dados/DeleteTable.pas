function DeleteTable(Dir,TblName: String): Boolean;
//
// Apaga uma tabela c/seus anexos do sistema, sem
// precisar de usar um componente TTAble
//
// Requer a BDE e DBTables declarados na clausua
// Uses da Unit.
//
var
DBHandle   : HDBIDB;
ResultCode : DBIResult;
tbl, Err   : Array[0..255] of Char;
SrcTbl     : TTable;
Begin
Result := True;
if DirectoryExists(Dir) then
   begin
   if FileExists(Dir+'\'+TblName) then
      begin
      SrcTbl := TTable.Create(nil);
      try
        if(Dir[length(Dir)]='\') then
           begin
           delete(Dir,length(Dir),1);
           end;
        SrcTbl.DatabaseName := Dir;
        SrcTbl.TableName := TblName;
        SrcTbl.Open;
        DBHandle := SrcTbl.DBHandle;
        SrcTbl.Close;
        ResultCode := DbiDeleteTable(DBHandle,
        StrPCopy(Tbl,Dir + '\' + TblName),nil);
        if (ResultCode <> DBIERR_NONE) then
           begin
           Result := False;
           end;
      finally
        SrcTbl.Free;
      end;
      end
   else
      begin
      Result := False;
      end;
   end;
end;
