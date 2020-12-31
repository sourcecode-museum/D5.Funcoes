procedure EscondeIniciar(Visible:Boolean);
//
// Oculta ou exibe o botão "Inciar" da barra de
// tarefas
//
Var
taskbarhandle,
buttonhandle : HWND;
begin
taskbarhandle := FindWindow('Shell_TrayWnd', nil);
buttonhandle := GetWindow(taskbarhandle, GW_CHILD);
If Visible=True Then
   begin
   ShowWindow(buttonhandle, SW_RESTORE); {mostra o botão}
   end
else
   begin
   ShowWindow(buttonhandle, SW_HIDE); {esconde o botão}
   end;
end;
