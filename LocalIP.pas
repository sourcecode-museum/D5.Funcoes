function LocalIP : string;
//
// Retorna o IP de sua máquina no momento em que
// você está conectado
//
// Declare a Winsock na clausula uses da unit
//
type
TaPInAddr = array [0..10] of PInAddr;
PaPInAddr = ^TaPInAddr;
var
phe  : PHostEnt;
pptr : PaPInAddr;
Buffer : array [0..63] of char;
I    : Integer;
GInitData      : TWSADATA;
begin
WSAStartup($101, GInitData);
Result := '';
GetHostName(Buffer, SizeOf(Buffer));
phe :=GetHostByName(buffer);
if phe = nil then
   begin
   Exit;
   end;
pptr := PaPInAddr(Phe^.h_addr_list);
I := 0;
while pptr^[I] <> nil do
      begin
      result:=StrPas(inet_ntoa(pptr^[I]^));
      Inc(I);
      end;
WSACleanup;
end;
