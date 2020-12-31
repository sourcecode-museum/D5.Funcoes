procedure InfoSys;
//
// Retorna diversas informações do sistema
//
// Requer a Registry declarada na clausula uses da unit
//
var
CurVerKey,
WinVersion,
PlatForm,
CPUType,
CPUNum,
UserName,
CompanyName,
WinSerialNum  : String;
Reg           : TRegistry;  SystemInfo    : TSystemInfo;
OSVersionInfo : TOSVersionInfo;
begin
OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
GetVersionEx(OSVersionInfo);
case OSVersionInfo.dwPlatformID of
     VER_PLATFORM_WIN32_WINDOWS :   begin
                                    PlatForm  := 'WinPlatForm: Windows 95';
                                    CurVerKey := '\SOFTWARE\Microsoft\Windows\CurrentVersion';
                                    end;
     VER_PLATFORM_WIN32_NT :        begin
                                    PlatForm  := 'WinPlatForm: Windows NT';
                                    CurVerKey := '\SOFTWARE\Microsoft\Windows NT\CurrentVersion';
                                    end;
else
   begin
   PlatForm  := 'WinPlatForm: UNKNOWN';
   CurVerKey := '';
   end;
end;
WinVersion := 'WinVersion: ' + Format('Version %d.%.2d',[OSVersionInfo.dwMajorVersion,OSVersionInfo.dwMinorVersion]);
case SystemInfo.dwProcessorType OF
     386 : CPUType := 'CPUType: 80386';
     486 : CPUType := 'CPUType: 80486';
     586 : CPUType := 'CPUType: Pentium';
else
   CPUType := 'CPUType: ' + Format('Unknown %d',[SystemInfo.dwProcessorType]);
end;
IntToStr(SystemInfo.dwNumberOfProcessors);
Reg := TRegistry.Create;
try
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  if Reg.OpenKey(CurVerKey, False) then
     begin
     UserName    := 'UserName: ' +Reg.ReadString('RegisteredOwner');
     CompanyName := 'CompanyName: ' + Reg.ReadString('RegisteredOrganization');
     if OSVersionInfo.dwPlatformID =  VER_PLATFORM_WIN32_WINDOWS then
        begin
        WinSerialNum := 'WinSerialNum: ' + Reg.ReadString('ProductID');
        end;
     end;
finally
     Reg.Free;
     end;
ShowMessage(WinVersion  + #13 +
            PlatForm    + #13 +              CPUType     + #13 +
            CPUNum      + #13 +              UserName    + #13 +
            CompanyName + #13 +              WinSerialNum);
end;
