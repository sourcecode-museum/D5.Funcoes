procedure PrinterAngleTextOut(CV: TCanvas; const sText: String; x, y, angle,size:integer);
//
// Imprime um texto em outro angulo diferente de 90º
//
// Requer a Printers declarada na clausula uses da unit
//
// Ex:
// Printer.BeginDoc;
// AngleTextOut(Printer.Canvas,'Teste',180,100,0,11);
// Printer.EndDoc;
//
var
LogFont: TLogFont;
SaveFont: TFont;
begin
SaveFont := TFont.Create;
SaveFont.Assign(CV.Font);
GetObject(SaveFont.Handle, sizeof(TLogFont), @LogFont);
with LogFont do
     begin
     lfHeight := Size * 5;
     lfEscapement := angle *10;
     lfQuality := PROOF_QUALITY;
     lfPitchAndFamily := DEFAULT_PITCH or FF_DONTCARE;
     end;
CV.Font.Handle := CreateFontIndirect(LogFont);
SetBkMode(CV.Handle, TRANSPARENT);
CV.TextOut(x, y, sText);
CV.Font.Assign(SaveFont);
SaveFont.Free;
end;
