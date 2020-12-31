function PathAlias(sAlias : String) : String;
{Retorna o Path do Alias em uso}
var
AliasNameList : TStringList;
sDir : String;
begin
  //Obter o nome dos aliases
  try
     AliasNameList := TStringList.Create;
     Session.GetAliasParams(sAlias, AliasNameList);
     sDir := AliasNameList.Strings[0];
     //Se não for achado a palavra PATH então não é do tipo Paradox ou Dbase
     //fica seu critério como você quer todo o tipo é só tirar este [ if pos()]}
     if pos('PATH',sdir) <> 0 then
        begin
        System.Delete(sdir,1,5)
        end
     else
       begin
       sdir := '\';
       end;
  finally
    begin
    AliasNameList.Free;
    end;
  end;
  Result := sDir;
end;
