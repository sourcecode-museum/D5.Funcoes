Procedure SetShare(Modify:String);
//
// Altera o Local Share Via programação ou
// para True ou False
//
// Requer:
// DB, DBTables,DBIprocs,DBITypes 
// declarados na clausua uses da unit
//
var
hcursor : HDBICur;
ConfigDesc: CFGDesc;
begin
Check(DbiOpenCfgInfoList(nil,dbiREADWRITE,cfgPERSISTENT,'\SYSTEM\INIT',hCursor));
try
  While DbiGetNextRecord(hCrusros,dbiNOLOCK,@ConfigDesc,nil)=0 do
        begin
        With ConfigDesc do
             begin
             if StrComp(szNodeName,'LOCAL SHARE' entry)=0 then
                begin
                StrPLCopy(szValue,Modify, sizeof(szValue));
                AnsiToOem(szValue,szValue);
                Check(DbiModifyRecord(hcursor,@ConfigDesc,True));
                break;
                end;
             end;
        end;
finally
  DbiCloseCursor(hCursor);
end;
end;   