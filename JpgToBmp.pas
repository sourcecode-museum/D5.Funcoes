function JpgToBmp(cImage: String): Boolean;
//
// Converte um arquivo JPEG em BMP
//
// Requer a Jpeg declarada na clausua uses
// da unit
//
var
MyJPEG : TJPEGImage;
MyBMP  : TBitmap;
begin
Result := False;
if fileExists(cImage+'.Jpeg') then
   begin
   MyJPEG := TJPEGImage.Create;
   with MyJPEG do
        begin
        try
          LoadFromFile(cImage+'.Jpeg');
          MyBMP := TBitmap.Create;
          with MyBMP do
               begin
               Width := MyJPEG.Width;
               Height := MyJPEG.Height;
               Canvas.Draw(0,0,MyJPEG);
               SaveToFile(cImage+'.Bmp');
               Free;
               Result := True;
               end;
        finally
           Free;
        end;
        end;
   end;
end;
