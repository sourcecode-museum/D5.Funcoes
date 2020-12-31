function CopiaEstruturaTabela(TableEmpty:Boolean;FromDir,SrcTblName,ToDir, DestTblName:String): Boolean;
//
// Copia uma tabela podendo ou não levar seu conteúdo para outro lugar
//
// Requer a BDE declarada na clausula uses da unit
//
var
DBHandle        : HDBIDB;
ResultCode      : DBIResult;
Src, Dest       : Array[0..255] of Char;
SrcTbl, DestTbl : TTable;
begin
if (ToDir <> '') and (FromDir <> '') then
  begin
  if (FromDir[length(FromDir)]= '\') then
     begin
     delete(FromDir,length(FromDir),1);
     end;
  if (ToDir[length(ToDir)] = '\') then
     begin
     delete(ToDir,length(ToDir),1);
     end;
  SrcTbl := TTable.Create(nil);
  DestTbl := TTable.Create(nil);
  try
     SrcTbl.DatabaseName := FromDir;
     SrcTbl.TableName := SrcTblName;
     SrcTbl.Open;
     DBHandle := SrcTbl.DBHandle;
     SrcTbl.Close;
     ResultCode := DbiCopyTable(DBHandle,false,
     StrPCopy(Src,FromDir + '\' + SrcTblName),nil, StrPCopy(Dest,ToDir + '\' + DestTblName));
     if (ResultCode <> DBIERR_NONE) then
         begin
         Result := False;
	 end
     else
         begin
         if TableEmpty then
            begin
            With DestTbl do
                 begin
                 Close;
                 TableName := DestTblName;
                 DataBaseName := ToDir;
                 Exclusive := True;
                 EmptyTable;
                 Exclusive := False;
                 end;
            end;
         Result := True;
         end;
  finally
     SrcTbl.Free;
     DestTbl.Free;
  end;
  end;
end;
