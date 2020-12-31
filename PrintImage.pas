function PrintImage(Origem: String):Boolean;
// imprime um bitmap selecionado retornando falso em caso negativo
// requer as units Graphics e printers declaradas na clausula Uses
var
Imagem: TBitmap;
begin
if fileExists(Origem) then
   begin
   Imagem := TBitmap.Create;
   Imagem.LoadFromFile(Origem);
   with Printer do
        begin
        BeginDoc;
        Canvas.Draw((PageWidth - Imagem.Width) div 2,(PageHeight - Imagem.Height) div 2,Imagem);
        EndDoc;
        end;
   Imagem.Free;
   Result := True;
   end
else
   begin
   Result := False;
   end;
end;
