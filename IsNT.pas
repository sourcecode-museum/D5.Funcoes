function IsNT: boolean;
//
// Testa se o sistema operacional é o Windows NT
//
var
osi: TOSVersionInfo;
begin
osi.dwOSVersionInfoSize := sizeof(osi);
if GetVersionEx(osi) then
  begin
  Result := (osi.dwPlatformId = VER_PLATFORM_WIN32_NT);
  end;
end;
