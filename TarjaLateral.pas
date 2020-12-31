Procedure TarjaLateral(Texto:String; Size:integer);
//
// Gera uma tarja lateral com um texto. Semelhante ao Menu
// iniciar do Windows onde aparece o Texto: Windows95 de lado
//
// Declare a funcao na section Private da unit e declare-a assim:
//
// Procedure Tform1.TarjaLateral(Texto:String; Size:integer);
//
var
LogFont   : TLogFont;
tmpCanvas : TCanvas;
tmpRect   : TRect;
x1,x2,
y1,y2     : Integer;
begin
tmpCanvas        := TCanvas.Create;
tmpCanvas.Handle := GetWindowDc(Handle);
try
  GetObject(Canvas.Font.Handle,SizeOf(LogFont),@LogFont);
  LogFont.lfEscapement   := 90 * 10;
  LogFont.lfOrientation  := 90 * 10;
  LogFont.lfOutPrecision := OUT_TT_ONLY_PRECIS;
  LogFont.lfFaceName     := 'Arial';
  LogFont.lfHeight       := Size;
  LogFont.lfWeight       := FW_BOLD;
  LogFont.lfQuality      := PROOF_QUALITY;
  tmpCanvas.Font.Handle  := CreateFontIndirect(LogFont);
  tmpCanvas.Font.Color   := clWhite;
  tmpCanvas.Brush.Color  := clNavy;
  x1 := GetSystemMetrics(SM_CXEDGE)+GetSystemMetrics(SM_CXBORDER);
  x2 := 20;
  y1 := GetSystemMetrics(SM_CYCAPTION)+ GetSystemMetrics(SM_CYEDGE)+
GetSystemMetrics(SM_CYBORDER)+1;
  y2 := Height - GetSystemMetrics(SM_CYEDGE)-
GetSystemMetrics(SM_CYBORDER);
  tmpRect := Rect(x1,y1,x2,y2);
  tmpCanvas.FillRect(tmpRect);
  DrawText(tmpCanvas.Handle,PChar(Texto),-1,tmpRect,DT_BOTTOM or
DT_SINGLELINE);
finally
  tmpCanvas.Free;
end;
end;