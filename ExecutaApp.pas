procedure ExecutaApp(Nome,State,NomeExec,Path:Pchar;Estado:Integer);
//
// Executa um aplicativo somente se ele não estiver aberto, caso
// contrário apenas chama-o
//
// Valores para Estdo: SW_SHOWNORMAL   Janela em modo normal
//                     SW_MAXIMIZE     Janela maximizada
//                     SW_MINIMIZE     Janela minimizada
//                     SW_HIDE         Janela Escondida
//
// Veja um exemplo de como chamar a calculadora do Windows
//
// ExecutaApp('CALCULADORA','OPEN','CALC.EXE','C:\WINDOWS',8);
//
// Onde 'CALCULADORA' é o nome da janela do aplicativo
//
var
TheWindows: HWND;
begin
theWindows := FindWindow(NIL,Nome);
if TheWindows <> 0 then
   begin
   SetForegroundWindow(TheWindows)
   end
else
   begin
   if (Estado > 3) or (Estado < 1) then
      begin
      Estado := 1;
      end;
   ShellExecute(Application.Handle,State,NomeExec,NIL,Path,Estado);
   end;
end;
