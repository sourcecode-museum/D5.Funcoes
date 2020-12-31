function ExecuteFile(const FileName, Params, DefaultDir: string;ShowCmd: Integer): THandle;
//
// Executa um aplicativo, já abrindo um arquivo anexo
// DefautDir: Diretorio onde ele irá trabalhar
// ShowCmd:  1 = Normal
//           2 = Minimizado
//           3 = Tela Cheia
//
var
zFileName, zParams, zDir: array[0..79] of Char;
begin
Result := ShellExecute(Application.MainForm.Handle, nil,StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),StrPCopy(zDir, DefaultDir), ShowCmd);
end;
