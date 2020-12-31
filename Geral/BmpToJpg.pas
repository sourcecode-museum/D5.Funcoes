Function BmpToJpg(cImage: String):Boolean;
//
// Converte um arquivo BMP em JPEG
//
// Requer a Jpeg declarada na clausua uses
// da unit
//
var
  MyJPEG : TJPEGImage;
  MyBMP  : TBitmap;
begin
Result := False;
if fileExists(cImage+'.bmp') then
   begin
   MyBMP := TBitmap.Create;
   with MyBMP do
        begin
        try
           LoadFromFile(cImage+'.bmp');
           MyJPEG := TJPEGImage.Create;
           with MyJPEG do
                begin
                Assign(MyBMP);
                SaveToFile(cImage+'.jpeg');
                Free;
                Result := True;
                end;
        finally
           Free;
        end;
        end;
   end;
end;
