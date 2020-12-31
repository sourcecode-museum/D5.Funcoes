function DeleteGridRow(AGrid: TStringGrid; ARow: Integer): boolean;
//
// Remove a linha selecionada de uma StringGrid
//
var
i: Integer;
j: Integer;
begin
if (ARow < AGrid.FixedRows) or (ARow >= AGrid.RowCount) then
    begin
    raise Exception.Create('Tentativa de deletar uma linha acima do intervalo ');
    end;
if (ARow < AGrid.RowCount - 1) then
    begin
    for i := ARow + 1 to AGrid.RowCount - 1 do
        begin
        for j := 0 to AGrid.ColCount - 1 do
            begin
            AGrid.Cells[i - 1, j] := AGrid.Cells[i, j];
            end;
        end;
    end;
AGrid.RowCount := AGrid.RowCount - 1;
end;
