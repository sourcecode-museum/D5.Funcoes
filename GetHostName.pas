Function GetHostName(strIPAddress : String) : String;
//
// Retorna o Host onde seu TCP/IP está conectado
//
// Requer a Winsock declarada na clausula uses da unit
//
Var
strHost          : String   ;
pszIPAddress     : PChar    ;
pReturnedHostEnt : PHostEnt ;
InternetAddr     : u_long   ;
GInitData        : TWSADATA ;
Begin
strHost := '';
If WSAStartup($101, GInitData) = 0 then
   Begin
   pszIPAddress := StrAlloc( Length( strIPAddress ) + 1 ) ;
   StrPCopy( pszIPAddress, strIPAddress ) ;
   InternetAddr := Inet_Addr(pszIPAddress) ;
   StrDispose( pszIPAddress ) ;
   pReturnedHostEnt := GetHostByAddr( PChar(@InternetAddr),4, PF_INET );
   try
     strHost := pReturnedHostEnt^.h_name;
     WSACleanup;
     Result := strHost ;
   except
     Result := 'Host inválido ou não encontrado';
   end;
   end;
end;
