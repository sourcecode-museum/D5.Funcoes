procedure FormResize(Sender: TObject);
var
  R    : TRect;
  DC   : HDc;
  Canv : TCanvas;
begin
  R    := Rect( 0, 0, Screen.Width, Screen.Height );
  DC   := GetWindowDC( GetDeskTopWindow );
  Canv := TCanvas.Create;
  Canv.Handle := DC;
  Canvas.CopyRect(R,Canv,R);
  ReleaseDC( GetDeskTopWindow, DC );
end;
