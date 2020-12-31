procedure RemoveLinha(StGrid: TStringGrid;linha:integer);
//
// Remove a linha selecionada de uma StringGrid
//
// Use: procedure TForm1.RemoveLinha(linha:integer);
//
var
    i,x : integer;
begin
for i := linha to StGrid.rowcount do
    begin
    for x := 0 to StGrid.colcount do
        begin
        StGrid.cells[i,x] := StGrid.cells[i+1,x];
        end;
    end;
    StGrid.rowcount := StGrid.rowcount - 1;
end;
