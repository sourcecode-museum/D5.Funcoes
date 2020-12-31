function AppIsRunning(ActivateIt: boolean) : Boolean;
//
// Testa se a sua aplicacao já esta sendo executada
//
var
hSem : THandle;
hWndMe : HWnd;
AppTitle: string;
begin
Result := False;
AppTitle := Application.Title;
hSem := CreateSemaphore(nil, 0, 1, pChar(AppTitle));
if ((hSem <> 0) AND (GetLastError() = ERROR_ALREADY_EXISTS)) then
   begin
   CloseHandle(hSem);
   Result := True;
   end;
if Result and ActivateIt then
   begin
   Application.Title :=  'zzzzzzz';
   hWndMe := FindWindow(nil, pChar(AppTitle));
   if (hWndMe <> 0) then
      begin
      if IsIconic(hWndMe) then
         begin
         ShowWindow(hWndMe, SW_SHOWNORMAL);
         end
      else
         begin
         SetForegroundWindow(hWndMe);
         end;
      end;
   end;
end;
