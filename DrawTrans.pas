procedure DrawTrans(DestCanvas: TCanvas; X,Y: smallint; SrcBitmap: TBitmap; AColor, BackColor: TColor);
//
// Redesenha um bitmap trocando a cor da linha
// do desenho
//
// use-a assim:
//
// DrawTrans(Image2.Canvas, 0,0, Image1.Picture.Bitmap, clBlack, clSilver);
//
var
ANDBitmap, ORBitmap: TBitmap;
CM: TCopyMode;
Src: TRect;
begin
ANDBitmap:= NIL;
ORBitmap:=  NIL;
try
  ANDBitmap:= TBitmap.Create;
  ORBitmap:= TBitmap.Create;
  Src  := Bounds(0,0, SrcBitmap.Width, SrcBitmap.Height);
  with ORBitmap do
       begin
       Width := SrcBitmap.Width;
       Height:= SrcBitmap.Height;
       Canvas.Brush.Color := clBlack;
       Canvas.CopyMode := cmSrcCopy;
       Canvas.BrushCopy(Src, SrcBitmap, Src, AColor);
       end;
  with ANDBitmap do
       begin
       Width := SrcBitmap.Width;
       Height := SrcBitmap.Height;
       Canvas.Brush.Color := BackColor;
       Canvas.CopyMode := cmSrcInvert;
       Canvas.BrushCopy(Src, SrcBitmap, Src, AColor);
       end;
  with DestCanvas do
       begin
       CM := CopyMode;
       CopyMode := cmSrcAnd;
       Draw(X,Y, ANDBitmap);
       CopyMode := cmSrcPaint;
       Draw(X,Y, ORBitmap);
       CopyMode := CM;
       end;
finally
  ANDBitmap.Free;
  ORBitmap.Free;
end;
end;

