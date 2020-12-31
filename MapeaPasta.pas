function MapeaPasta(Server,Alias,senha:Pchar): String;
//
// mapea uma pasta via programação
//
// usea-a assim:
// MapeaPasta('\\ALPHAMG01\Extra','E:',' ')
// 
var
err : DWord;
PServer, PSenha, PLetra : PChar;
Begin
PServer := Server;
PLetra := Alias;
PSenha := senha;
ERR := WNetAddConnection ( PServer , PSenha , PLetra );
case ERR of
     ERROR_ACCESS_DENIED :             result := 'Acesso negado.';
     ERROR_ALREADY_ASSIGNED :          result := 'A letra do drive especificada já está conectada.';
     ERROR_BAD_DEV_TYPE :              result := 'O tipo de dispositivo e o tipo de recurso não são compatíveis.';
     ERROR_BAD_DEVICE :                result := 'Letra inválida.';
     ERROR_BAD_NET_NAME :              result := 'Nome do servidor não é válido ou não pode ser localizado.';
     ERROR_BAD_PROFILE :               result := 'Formato incorreto de parâmetros.';
     ERROR_CANNOT_OPEN_PROFILE :       result := 'Conexão permanente não disponível.';
     ERROR_DEVICE_ALREADY_REMEMBERED : result := 'Uma entrada para o dispositivo especificado já está no perfil do usuário.';
     ERROR_EXTENDED_ERROR :            result := 'Erro de rede.';
     ERROR_INVALID_PASSWORD :          result := 'Senha especificada inválida.';
     ERROR_NO_NET_OR_BAD_PATH :        result := 'A operação não foi concluída porque a rede não foi inicializada ou caminho é inválido.';
     ERROR_NO_NETWORK :                result := 'A rede não está presente.';
else
   result := 'A Conexão '+ server+ ' na unidade '+ Alias+' Foi efetuada corretamente';
end;
end;
