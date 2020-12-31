function GetPathDoAlias(const Alias: string ): string;
//
// Retorna o Path do Alias
//
// Requer a DBTables declarada na clausula uses da unit
//
var
Parametros : TStringList;
begin
Parametros := TStringList.Create;
try
   Session.GetAliasParams( Alias, Parametros );
   Result := Parametros.Values[ 'PATH' ];
finally
   Parametros.Free;
end;
end;
