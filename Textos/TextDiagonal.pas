Procedure Diagonal(FName: String;Fsize:Integer;Fcor:TColor;Pos: integer;Land:Integer;Texto: String);
var
lf : TLogFont;
tf : TFont;
begin
with Form1.Canvas do
     begin
     Brush.Style := bsClear;
     Font.Name := FName;
     Font.Size := Fsize;
     Font.Color := Fcor;
     tf := TFont.Create;
     tf.Assign(Font);
     GetObject(tf.Handle, sizeof(lf), @lf);
     lf.lfEscapement := Pos;
     lf.lfOrientation := Land;
     lf.lfQuality := 1;
     tf.Handle := CreateFontIndirect(lf);
     Font.Assign(tf);
     TextOut(Width div 2,(Height div 2), Texto);
     tf.Free;
     end;
end;
