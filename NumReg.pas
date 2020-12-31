Function NumReg(Tabela: TTable): String;
//
// Retorna o o número do registro atual em tabelas Paradox ou Dbase
//
// Esta funcao requer declarada a BDE na clausua uses da unit.
// Esta funcao deve ser usada no Evento OnDataChange do DataSource
//
var
CP: CurProps;
RP: RecProps;
RecID: Longint;
begin
with Tabela do
     begin
     UpdateCursorPos;
     Check(DbiGetCursorProps(Handle, CP));
     Check(DbiGetRecord(Handle, dbiNOLOCK, nil, @RP));
     if StrComp(CP.szTableType, szDBASE) = 0 then
        begin
        RecID := RP.iPhyRecNum;
        end
      else if StrComp(CP.szTableType, szPARADOX) = 0 then
              begin
              RecID := RP.iSeqNum;
              end
      else
         begin
         raise EDatabaseError.Create('ERRO! Não é uma tabela Paradox ou dBASE.');
         end;
     end;
result := IntToStr(RecID) +' de '+ IntToStr(Tabela.recordcount);
end;
