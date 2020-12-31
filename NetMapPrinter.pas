Function NetMapPrinter(Local,Remoto:String):Boolean;
{redireciona a porta de impressao em tempo de execucao}
var  NRW: TNetResource;
     vLocal : PChar;
begin
  with NRW do begin
     dwType := RESOURCETYPE_PRINT;
     lpLocalName := PChar(Local);
     lpRemoteName := PChar(Remoto);
     lpProvider := '';
  end;
  Result := WNetAddConnection2(NRW,'','',CONNECT_UPDATE_PROFILE)=0;
end;
