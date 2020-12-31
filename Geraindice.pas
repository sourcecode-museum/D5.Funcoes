procedure Geraindice(Tbl: TTable);
//
// Faz a tabela Paradox ignorar o índice e recriá-lo
//
// Esta procedure requer o componente TTable no Form
//
var
NewIndex: IDXDesc;
begin
if Tbl.Exclusive = False then
    begin
    raise EDatabaseError.Create('Tabela deve estar em modo Exclusivo para ser indexada');
    end;
NewIndex.iIndexId:= 0;
NewIndex.bPrimary:= TRUE;
NewIndex.bUnique:= TRUE;
NewIndex.bDescending:= FALSE;
NewIndex.bMaintained:= TRUE;
NewIndex.bSubset:= FALSE;
NewIndex.bExpIdx:= FALSE;
NewIndex.iFldsInKey:= 1;
NewIndex.aiKeyFld[0]:= 1;
NewIndex.bCaseInsensitive:= FALSE;
Tbl.Open;
Check(DbiAddIndex(Tbl.dbhandle, Tbl.handle, PChar(Tbl.TableName),szParadox, NewIndex, nil));
end;
