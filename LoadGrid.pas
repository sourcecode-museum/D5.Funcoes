Procedure LoadGrid(FilePath: String; grid: TStringGrid);
//
// Carrega os dados, salvos em um arquivo, em um StringGrid
//

var
f: textfile;
temp,x,y:integer;
tempstr: string;
begin
assignfile (f,FilePath + '\'+ Grid.Name + '.inf');
reset (f);
readln (f,temp);
grid.colcount := temp;
readln (f,temp);
grid.rowcount := temp;
For X := 0 to grid.colcount-1 do
    begin
    For y := 0 to grid.rowcount-1 do
        begin
        readln (F, tempstr);
        grid.cells[x,y]:=tempstr;
        end;
    end;
closefile (f);
end;
