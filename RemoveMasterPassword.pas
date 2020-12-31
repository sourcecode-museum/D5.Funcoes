procedure RemoveMasterPassword(Table: TTable);
{Remove Senhas de uma tabela paradox}
const
  RESTRUCTURE_FALSE = WordBool(0);
var
  TblDesc: CRTblDesc;
  hDb: hDBIDb;
begin
if  Table.Exclusive = False then
    begin
    Table.Exclusive := True;
    end;
FillChar(TblDesc, SizeOf(CRTblDesc), 0);
with TblDesc do
     begin
     StrPCopy(szTblName, Table.TableName);
     StrCopy(szTblType, szPARADOX);
     bProtected := RESTRUCTURE_FALSE;
     end;
Check(DbiGetObjFromObj(hDBIObj(Table.Handle), objDATABASE, hDBIObj(hDb)));
Table.Close;
Check(DbiDoRestructure(hDb, 1, @TblDesc, nil, nil, nil, FALSE));
Table.Open;
end;
