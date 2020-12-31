procedure CreateATable(DBName,TblName : String);
//
// Cria uma tablea
//
// Requer as DB e DBTables declaradas na clausula uses da unit
//
var
tbl : TTable;
begin
tbl := TTable.Create(Application);
with tbl do
     begin
     Active := False;
     DatabaseName := DBName;
     TableName := TblName;
     TableType := ttDefault;
     with FieldDefs do
          begin
          Clear;
          Add('LastName', ftString, 30, False);
          Add('FirstName', ftString, 30, False);
          Add('Address1', ftString, 40, False);
          Add('Address2', ftString, 40, False);
          Add('City', ftString, 30, False);
          Add('ST', ftString, 2, False);
          Add('Zip', ftString, 10, False);
          end;
     with IndexDefs do
          begin
          Clear;
          Add('Field1Index', 'LastName;FirstName', [ixPrimary, ixUnique]);
          end;
    try
      CreateTable;
    except
      showmessage('Não foi possível criar a tabela '+TblName+ '! Ocorreu um erro desconhecido!!');
    end;
  end;
end;
