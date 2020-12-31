procedure TransparentForm;
//
// Gera um form transparente.
// Requer a referencia do form em sua declaração tipo:
//
// procedure TForm1.InvisibleForm;
//              ^
//
var
FullRgn, ClientRgn, ButtonRgn: THandle;
Margin, X, Y: Integer;
begin
Margin := (Width - ClientWidth) div 2;
FullRgn := CreateRectRgn(0, 0, Width, Height);
X := Margin;
Y := Height - ClientHeight - Margin;
ClientRgn := CreateRectRgn(X, Y, X + ClientWidth, Y + ClientHeight);
CombineRgn(FullRgn, FullRgn, ClientRgn, RGN_DIFF);
SetWindowRgn(Handle, FullRgn, True);
end;
