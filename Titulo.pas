procedure Titulo(Titulo: Pchar;pos,wParam: Integer);
//
// Alinha o título da barra de títulos do form
// a Esquerda (Normal) ou a direita
//
// deve ser usada assim:
// Procedure TForm1.Titulo(Titulo: Pchar;pos,wParam: Integer);
//
// e declarada na clausua private
//
var
DC: THandle;
R1, R2: TRect;
begin
DC := GetWindowDC(Handle);
try
  SetWindowText(Handle, nil);
  GetWindowRect(Handle, R2);
  R1.Left := GetSystemMetrics(SM_CXSIZE) + GetSystemMetrics(SM_CXBORDER) + GetSystemMetrics(SM_CXFRAME);
  R1.Top := GetSystemMetrics(SM_CYFRAME);
  R1.Right := R2.Right - R2.Left - R1.Left  - 2 * GetSystemMetrics(SM_CXSIZE);
  R1.Bottom := R1.Top + GetSystemMetrics(SM_CYSIZE);
  if wParam = 1 then
     begin
     SetBkColor(DC, GetSysColor(COLOR_ACTIVECAPTION));
     end
  else
     begin
     SetBkColor(DC, GetSysColor(COLOR_INACTIVECAPTION));
     end;
  SetTextColor(DC, GetSysColor(COLOR_CAPTIONTEXT));
  if pos = 1 then
     begin
     DrawText(DC, Titulo, -1, R1, DT_LEFT or DT_VCENTER);
     end
  else
     begin
     DrawText(DC, Titulo, -1, R1, DT_RIGHT or DT_VCENTER);
     end;
finally
  ReleaseDC(Handle, DC);
end;
end;
