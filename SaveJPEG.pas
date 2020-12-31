function SaveJPEG(picToSave: TPicture; const psFileOUT: PChar):boolean;
//
// Salva uma imágem Jpg em um arquivo.
//
// Requer Jpeg declarada na clausula uses da unit
//
var
bReturn :    boolean;
imgJPG :     TJPEGImage;
begin
bReturn := False;
imgJPG := TJPEGImage.Create;
try
  imgJPG.Assign(picToSave.Bitmap);
  imgJPG.SaveToFile(psFileOUT);
  bReturn := True;
finally
  imgJPG.Free;
end;
SaveJPEG := bReturn;
end;
