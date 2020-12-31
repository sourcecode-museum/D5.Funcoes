function IsWindowInMemory (WndTitle : String) : Boolean;
//
//  Testa se a janela jã foi criada
//
//Coloque no evento OnCreate do form:
//
//  if IsWindowInMemory (Self.Caption) then
//     Halt;
//
var
hSem : THandle;
hWndMe : HWnd;
begin
Result := False;
hSem := CreateSemaphore (nil, 0, 1, 'NomeDoSemaforo');
if (hSem <> 0) and (GetLastError() = ERROR_ALREADY_EXISTS) then
    begin
    CloseHandle (hSem);
    hWndMe := FindWindow (nil, PChar (WndTitle));
    SetWindowText (hWndMe, 'olzfgowtjoyug');
    hWndMe := FindWindow (nil, PChar (WndTitle));
    if hWndMe <> 0 then
       begin
       if IsIconic (hWndMe) then
          begin
          ShowWindow (hWndMe, SW_SHOWNORMAL);
          end
       else
          begin
          SetForegroundWindow (hWndMe);
          end;
       end;
    Result := True;
    end;
end;
