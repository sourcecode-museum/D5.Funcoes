function ValidaCampo(Table: TTable; Text: Array of const;Indice:String):Boolean
//
// Faz validação de campos impedindo a inserção de registros duplicados
//
// Esta função deve ser colocada no Evento on SetText do Campo que você deseja
// fazer a validação
//
var
Tabela : TTable;
begin
Tabela := TTable.Create(Application);
Tabela.DatabaseName := Table.DataBaseName;
Tabela.TableName := Table.TableName;
Tabela.Open;
Tabela.IndexFieldNames := Indice;
if Tabela.FindKey(Text) then
   begin
   Result := False;
   Tabela.Free;
   Abort;
   end
else
   begin
   Result := True;
   Tabela.Free;
   end;
end;
