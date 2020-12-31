procedure TableAddMasterPassword(Table: TTable; pswd: string);
{Inclui uma senha em uma tabela paradox}
const
 RESTRUCTURE_TRUE = WordBool(1);
var
  TblDesc: CRTblDesc;
  hDb: hDBIDb;
begin
if Table.Exclusive = False then
   begin
   Table.Exclusive := True;
   end;
Table.Open;
FillChar(TblDesc,SizeOf(CRTblDesc),0);
with TblDesc do
     begin
     StrPCopy(szTblName, Table.TableName);
     StrCopy(szTblType, szPARADOX);
     StrPCopy(szPassword, pswd);
     bProtected := RESTRUCTURE_TRUE;
     end;
Check(DbiGetObjFromObj(hDBIObj(Table.Handle), objDATABASE, hDBIObj(hDb)));
Table.Close;
Check(DbiDoRestructure(hDb, 1, @TblDesc, nil, nil, nil, FALSE));
Session.AddPassword(pswd);
Table.Exclusive := False;
Table.Open;
end;
