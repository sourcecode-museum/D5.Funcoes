function LoadJPEG(const psFileIN: PChar): TPicture;
//
// Carrega uma imágem Jpg.
//
// Requer Jpeg declarada na clausula uses da unit
//
var
imgJPG : TJPEGImage;
picReturn: TPicture;
begin
imgJPG := TJPEGImage.Create;
picReturn := TPicture.Create;
try
  imgJPG.LoadFromFile(psFileIN);
  picReturn.Bitmap.Assign(imgJPG);
except
  picReturn.Free;
  picReturn := nil;
end;
imgJPG.Free;
LoadJPEG := picReturn;
end;
