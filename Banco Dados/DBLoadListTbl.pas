procedure DBLoadListTbl(dbSource,tblSource,fldName: String; const LBox: TStrings);
//
// Carrega em um ListBox, todos os registros de um determinado campo da
// tabela
//
//  dbSource  Nome do Alias da tabela
//  tblSource Nome da Tabela
//  fldName   Nome do campo que se deseja carregar os registros
//  LBox ListBox que serão carregados os campos. (Sintaxe: ListBox1.Items
//

var
SourceTbl : TTable;
begin
SourceTbl := TTable.Create(Application); {Create an instance of sourceTbl}
with SourceTbl do
     begin
     Active       := False;
     DatabaseName := dbSource;
     TableName    := tblSource;
     try
       Open;
       First;
       while NOT EOF do
             begin
             LBox.Add(SourceTbl.FieldByName(fldName).AsString);
             Next;
             end;
     finally
       Free;
     end;
     end;
end;
