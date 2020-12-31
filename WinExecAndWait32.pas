function WinExecAndWait32(FileName:String; Visibility : integer):integer;
{ Tenta executar o aplicativo finalizando-o corretamente apos o uso. Retorna -1 em caso de falha}
var
zAppName:array[0..512] of char;
zCurDir:array[0..255] of char;
WorkDir:String;
StartupInfo:TStartupInfo;
ProcessInfo:TProcessInformation;
begin
StrPCopy(zAppName,FileName);
GetDir(0,WorkDir);
StrPCopy(zCurDir,WorkDir);
FillChar(StartupInfo,Sizeof(StartupInfo),#0);
StartupInfo.cb := Sizeof(StartupInfo);
StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
StartupInfo.wShowWindow := Visibility;
if not CreateProcess(nil,zAppName,nil,nil,false,CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS,nil, nil,StartupInfo,ProcessInfo) then
   begin
   Result := -1;
   end
else
   begin
   WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
   GetExitCodeProcess(ProcessInfo.hProcess,Result);
   end;
end;
