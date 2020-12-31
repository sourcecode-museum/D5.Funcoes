procedure SetWindowCenterOnWindow(FormCenter, FormReference: TForm);
//
// Esta procedure permite que voce alinhe um form baseado nas posições
// de um outro especificado.
//
// Ex:  SetWindowCenterOnWindow(Form1,Form2)
//
procedure SetStaticWindow(aForm: TForm);
var
r: TRect;
begin
SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);
if aForm.Height > r.Bottom then
   begin
   aForm.Height := r.Bottom;
   end;
if aForm.Top < 0 then
      begin
      aForm.Top := 0;
      end;
if aForm.Top+aForm.Height > r.Bottom then
   begin
   aForm.Top := r.Bottom-aForm.Height;
   end;
if aForm.Left+aForm.Width >  r.Right then
   begin
   aForm.Left := r.Right-aForm.Width;
   end;
   if aForm.Left < 0 then
      begin
      aForm.Left := 0;
      end;
end;

var
r: TRect;
begin
SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);
if (FormReference = nil) then
   begin
   FormCenter.Left := (r.Right div 2) - (FormCenter.Width div 2);
   FormCenter.Top  := (r.Bottom div 2) - (FormCenter.Height div 2);
   Exit;
   end;
if (not FormReference.Visible) then
   begin
   FormCenter.Left := (r.Right div 2) - (FormCenter.Width div 2);
   FormCenter.Top  := (r.Bottom div 2) - (FormCenter.Height div 2);
   Exit;
   end;
FormCenter.Left := ((FormReference.Width div 2) + FormReference.Left) - (FormCenter.Width div 2);
FormCenter.Top := ((FormReference.Height div 2) + FormReference.Top)  - (FormCenter.Height div 2);
SetStaticWindow(FormCenter);
end;
