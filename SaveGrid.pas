Procedure SaveGrid(FilePath: String; grid: TStringGrid);
//
// Salva os dados de um StringGrid em um arquivo
//
var f:textfile;
x,y:integer;
begin
assignfile (f,FilePath + '\'+ Grid.Name +'.inf');
rewrite (f);
writeln (f,grid.colcount);
writeln (f,grid.rowcount);
For X :=0 to grid.colcount-1 do
    begin
    For y:=0 to grid.rowcount-1 do
        begin
        writeln (F, grid.cells[x,y]);
        end;
    end;
closefile (f);
end;

