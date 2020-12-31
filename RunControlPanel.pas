function RunControlPanel(sAppletFileName : string) : integer;
//
// Executa um módulo do painel de controle
//
// Ex: RunControlPanelApplet('Access.cpl');
//
begin
Result := WinExec(PChar('rundll32.exe shell32.dll,'+ 'Control_RunDLL '+sAppletFileName),SW_SHOWNORMAL);
end;
