Function MapeaRede(Letra,Path,provedor:Pchar):String;
//
//  mapea um Drive via programação
//
//  Local = Letra atribuida a unidade
//  Path =  Caminho do mapeamento
//  Provedor = Provedor da rede
//
var
NRW: TNetResource;
begin
with NRW do
     begin
     dwType := RESOURCETYPE_ANY;
     lpLocalName := Letra;
     lpRemoteName := Path;
     lpProvider := provedor;
     end;
WNetAddConnection2(NRW, ' ', ' ', CONNECT_UPDATE_PROFILE);
Case GetLastError() of
     5:    Result := 'Acesso Negado';
     66:   Result := 'Tipo de dispositivo local ou recurso inválido';
     67:   Result := 'Caminho não encontrado ou inválido';
     85:   Result := 'Este mapeamento já existe';
     86:   Result := 'Senha não encontrada ou inválida';
     1200: Result := 'Letra atribuída a unidade já é reservada ou inválida';
     1202: Result := 'Um mapeamento com esta letra já existe';
     1203: Result := 'Rede ou caminho não encontrado ou inválido';
     1204: Result := 'Provedor não encontrado ou inválido';
     1205: Result := 'Não foi possível abrir o perfil';
     1206: Result := 'Perfil do usuário não encontrado ou inválido';
     1208: Result := 'Ocorreu um Erro específico na rede';
     170:  Result := 'Rede congestionada';
     2138: Result := 'Rede não encontrada ou fora do ar'
else
     Result := 'Unidade mapeada com sucesso';
end;
end;