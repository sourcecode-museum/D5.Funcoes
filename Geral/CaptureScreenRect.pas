function CaptureScreenRect( ARect: TRect ): TBitmap;
//
// Captura a tela e salva-a em um Bitmap
//
// Use-a assim:
//
// Image1.picture.Assign(CaptureScreenRect(Rect(0,0,Width,Height)));
//
var
ScreenDC: HDC;
begin
Result := TBitmap.Create;
with Result, ARect do
     begin
     Width := Right - Left;
     Height := Bottom - Top;
     ScreenDC := GetDC( 0 );
     try
       BitBlt( Canvas.Handle, 0, 0, Width, Height, ScreenDC, Left, Top, SRCCOPY );
     finally
       ReleaseDC( 0, ScreenDC );
     end;
//    Palette := GetSystemPalette;
     end;
end;

