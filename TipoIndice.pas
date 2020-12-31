Function TipoIndice(Tabela:TTable):String;
//
// Retorna o tipo do índice da tabela
//
Var I : integer;
Aux : string;
begin
Tabela.IndexDefs.Update;
For I := 0 to (Tabela.IndexDefs.Count - 1) do
    Begin
    if (ixPrimary) in Tabela.IndexDefs.Items[I].Options then
       Aux := Aux + ' ixPrimary ';
    if (ixUnique) in Tabela.IndexDefs.Items[I].Options then
       Aux := Aux + ' ixUnique ';
    if (ixDescending) in Tabela.IndexDefs.Items[I].Options then
       Aux := Aux + ' ixDescending ';
    if (ixExpression) in Tabela.IndexDefs.Items[I].Options then
       Aux := Aux + ' ixExpression ';
    if (ixCaseInsensitive) in Tabela.IndexDefs.Items[I].Options then
       Aux := Aux + ' ixCaseInsensitive ';
    End;
    Result := Aux;
end;
