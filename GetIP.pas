function GetIP:string;
//
// Retorna o IP de sua máquina no momento em que
// você está conectado
//
// Declare a Winsock na clausula uses da unit
//
var
WSAData: TWSAData;
HostEnt: PHostEnt;
Name:string;
begin
WSAStartup(2, WSAData);
SetLength(Name, 255);
Gethostname(PChar(Name), 255);
SetLength(Name, StrLen(PChar(Name)));
HostEnt := gethostbyname(PChar(Name));
with HostEnt^  do
     begin
     Result := Format('%d.%d.%d.%d',[Byte(h_addr^[0]),Byte(h_addr^[1]),Byte(h_addr^[2]),Byte(h_addr^[3])]);
     end;
WSACleanup;
end;
