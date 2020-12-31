procedure SetDelete(oTable:TTable; Value: Boolean);
//
//  Permite que a tabela exiba os registros marcados para deleção
//
//  deve ser incluidos as  DBITYPES, DBIERRS, DBIPROCS na clausula
//  uses da unit
// 
// Chame esta procedure no evento onAfterOpen da tabela
//
var
rslt: DBIResult;
szErrMsg: DBIMSG;
begin
try
  oTable.DisableControls;
  try
    rslt := DbiSetProp(hDBIObj(oTable.Handle), curSOFTDELETEON,
    LongInt(Value));
    if rslt <> DBIERR_NONE then
       begin
       DbiGetErrorString(rslt, szErrMsg);
       raise Exception.Create(StrPas(szErrMsg));
       end;
  except
    on E: EDBEngineError do ShowMessage(E.Message);
       on E: Exception do ShowMessage(E.Message);
          end;
finally
  oTable.Refresh;
  oTable.EnableControls;
end;
end;