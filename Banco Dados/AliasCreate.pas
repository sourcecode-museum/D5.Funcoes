function AliasCreate(AliasName:String;Programa:String;DataType:String): Boolean;
{Como criar uma Alias temporário ?
Digamos que você deseja criar um alias para acessar algumas bases de dados que estão no diretório
onde esta o seu executável e este alias não deverá ser gravado no BDE.}
begin
if not Session.IsAlias(AliasName) then
   begin
   {Verifica se já existe o alias na memória }
   Session.AddStandardAlias(AliasName,ExtractFilePath(Programa),Datatype);
   Result := True;
   end
else
   begin
   Result := False;
   end;
end;
 