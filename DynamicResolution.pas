function DynamicResolution(X, Y: word): Boolean;
//
// Troca a resolução de vídeo
//
var
lpDevMode: TDeviceMode;
begin
if EnumDisplaySettings(nil, 0, lpDevMode) then
   begin
   lpDevMode.dmFields    := DM_PELSWIDTH Or DM_PELSHEIGHT;
   lpDevMode.dmPelsWidth := X;
   lpDevMode.dmPelsHeight:= Y;
   Result := ChangeDisplaySettings(lpDevMode, 0) = DISP_CHANGE_SUCCESSFUL;
   end;
end;
