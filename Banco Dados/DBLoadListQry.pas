procedure DBLoadListQry(tbPath,tblSource,fldName: String;const List : TStrings);
//
// Carrega em um ListBox, todos os registros de um determinado campo da
// tabela
//
//  tbPath  path da tabela
//  tblSource Nome da Tabela
//  fldName   Nome do campo que se deseja carregar os registros
//  List ListBox que serão carregados os campos. (Sintaxe: ListBox1.Items
//

var
  qry : TQuery;
begin
  qry := TQuery.Create(nil);
  with qry do begin
    Active := False;
    DatabaseName := tbPath;
    SQL.Add('SELECT DISTINCT d."' + fldName + '" ');
    SQL.Add('FROM "' + tblSource + '" d');
    try
      Open;
      while NOT EOF do begin
        List.Add(FieldByName(fldName).AsString);
        Next;
      end;
    finally
      Free;
    end;
  end;
end;
