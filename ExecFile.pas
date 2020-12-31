procedure ExecFile(F: String);
//
// Executa um aplicativo Associado
//
// Esta procedure requer a ShellApi na clausula Uses da unit.
//
// Declare a procedure na clausua private da unit e coloque-a apos a clausula
// implementation assim:  procedure Tform1.ExecFile(F: String);
//
// use a procedure assim:    ExecFile('c:\windows\Ladrilhos.bmp')
//
var
r: String;
begin
case ShellExecute(Handle, nil, PChar(F), nil, nil,SW_SHOWNORMAL) of
     ERROR_FILE_NOT_FOUND: r := 'O arquivo especificado não foi encontrado ou não existe!';
     ERROR_PATH_NOT_FOUND: r := 'O Caminho é inválido ou não existe!';
     ERROR_BAD_FORMAT: r := 'O Aplicativo está corrompido ou não é um Aplicativo Win32 valido!';
     SE_ERR_ACCESSDENIED: r := 'O sistema negou acesso a este arquivo por algum motivo desconhecido!';
     SE_ERR_ASSOCINCOMPLETE: r := 'Este arquivo tem uma associação inválida ou incompleta a ele!';
     SE_ERR_DDEBUSY: r := 'A transação DDE não pode ser efetuada por já haver outra Transação DDE em andamento';
     SE_ERR_DDEFAIL: r := 'Não foi possível efetuar a transação DDE!';
     SE_ERR_DDETIMEOUT: r := 'A transação DDE não pode ser efetuada porque o tempo requerido expirou!';
     SE_ERR_DLLNOTFOUND: r := 'Uma Biblioteca DLL necessária ào aplicativo associado não foi encontrada!';
     SE_ERR_NOASSOC: r := 'Este arquivo não tem nenhum aplicativo associado à ele!';
     SE_ERR_OOM: r := 'memória insuficiente para prosseguir com esta operação!';
     SE_ERR_SHARE: r := 'Ocorreu uma violação de compartilhamento ao efetuar esta operação!';
else
     Exit;
end;
ShowMessage(r);
end;
