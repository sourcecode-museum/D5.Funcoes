procedure ExportaBMPtoWMF(Imagem:TImage;Dest:Pchar);
//
// Exporta uma imagem de um TImage para um arquivo
// no formato WMF (Metáfile)
//
var
Metafile        : TMetafile;
MetafileCanvas  : TMetafileCanvas;
DC              : HDC;
ScreenLogPixels : Integer;
begin
Metafile := TMetafile.Create;
try
  DC              := GetDC(0);
  ScreenLogPixels := GetDeviceCaps(DC, LOGPIXELSY);
  Metafile.Inch   := ScreenLogPixels;
  Metafile.Width  := Imagem.Picture.Bitmap.Width;
  Metafile.Height := Imagem.Picture.Bitmap.Height;
  MetafileCanvas  := TMetafileCanvas.Create(Metafile, DC);
  ReleaseDC(0, DC);
  try
    MetafileCanvas.Draw(0, 0, Imagem.Picture.Bitmap);
  finally
    MetafileCanvas.Free;
  end;
  Metafile.Enhanced := FALSE;
  Metafile.SaveToFile(Dest);
finally
  Metafile.Destroy;
end;
end;
