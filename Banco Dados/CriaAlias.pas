procedure CriaAlias(sAlias,sPath: string; PersistentAlias: Boolean;sDriveType: PChar);
{Cria um Alias do BDE em tempo de execução}

var
ZAlias,zPath: array[0..127] of char;
dbEnv: DBIEnv;
dbRes: DBIResult;
begin
with dbEnv do
    begin
    StrPCopy(szWorkDir,sPath);
    StrPCopy(szIniFile,'');
    bForceLocalInit := True;
    StrPCopy(szLang,'');
    StrPCopy(szClientName,'dbClientName');
  end;
  if DbiInit(@dbEnv) <> DBIERR_NONE then
     begin
     raise Exception.Create('Erro na inicialização Database Engine. Alias não criado.');
           Exit;
     end
  else
     begin
     dbRes := DbiAddAlias(nil,StrPCopy(zAlias,sAlias),sDriveType,StrPCopy(zPath,'PATH:'+sPath),PersistentAlias);
     case dbRes of
          DBIERR_NONE: ShowMessage('Alias: '+sAlias+' adicionado com sucesso.');
          DBIERR_INVALIDPARAM:
          begin
          raise Exception.Create('Um DriverType foi especificado, porém foi passado um alias nulo.');
                exit;
          end;
          DBIERR_NAMENOTUNIQUE:
          begin
          raise Exception.Create(sAlias+' já existe. Use outro nome para o Alias.');
                exit;
          end;
          DBIERR_UNKNOWNDRIVER:
          begin
          raise Exception.Create('Não foi encontrado o nome do driver no arquivo de configuração.');
                exit;
          end;
    end;
    if DbiExit <> DBIERR_NONE then
       begin
       raise Exception.Create('Alias criado, porém houve um erro ao fechar o BDE. Reinicialize.');
             exit;
       end;
    end;
end;
