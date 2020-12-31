Procedure CriaTab (const DstAliasOrDir: string);
var Table: tTable; 
begin 
  Table := tTable.Create(nil);
  With Table do
  Try{Finally}
    DatabaseName := DstAliasOrDir;
    IndexDefs.Clear;
    FieldDefs.Clear;
    TableType := ttDefault;
    TableName := 'PRODUTO.DB';
    With FieldDefs do
    begin
      Add('Produto_ID',ftAutoInc,0,false);
      Add('Nome',ftString,40,false);
      Add('CodigoBarra',ftString,13,false);
    end{with FieldDefs};
    With IndexDefs do 
    begin
      Add('','Produto_ID',[ixPrimary,ixUnique]);
      Add('IDX_Nome','Nome',[ixCaseInsensitive]);
      Add('IDX_CodBar','CodigoBarra',[ixCaseInsensitive]);
    end
    CreateTable;
  Finally
    Table.Free;
  End
end
