Function DesconectaRede(Letra:Pchar;Forcada:boolean):String;
//
//  Disconecta uma unidade mapeada via programação
//
//  Letra = Letra atribuida a unidade
//  Forcada =  Força o cancelamento do mapeamento
//
begin
WNetCancelConnection2(Letra,0,Forcada);
Case GetLastError() of
     1205: Result := 'Não foi possível abrir o perfil';
     1206: Result := 'Perfil do usuário não encontrado ou inválido';
     1208: Result := 'Ocorreu um Erro específico na rede';
     2138: Result := 'Rede não encontrada ou fora do ar';
     2250: Result := 'Mapeamento inválido ou não encontrado';
     2401: Result := 'Existem muitos arquivos abertos';
else
     Result := 'Unidade disconectada com sucesso';
end;
end;