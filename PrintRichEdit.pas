procedure PrintRichEdit(const Caption: string;const RichEdt: TRichEdit);
//
// Imprime o conteúdo de um TRichEdit
//
// Requer a Printers e RichEdit declaradas na clausula uses da unit
//
var
Range: TFormatRange;
LastChar, MaxLen, LogX, LogY, OldMap: Integer;
begin
FillChar(Range, SizeOf(TFormatRange), 0);
with Printer, Range do
     begin
     BeginDoc;
     hdc := Handle;
     hdcTarget := hdc;
     LogX := GetDeviceCaps(Handle, LOGPIXELSX);
     LogY := GetDeviceCaps(Handle, LOGPIXELSY);
     if IsRectEmpty(RichEdt.PageRect) then
        begin
        rc.right := PageWidth * 1440 div LogX;
        rc.bottom := PageHeight * 1440 div LogY;
        end
     else
        begin
        rc.left := RichEdt.PageRect.Left * 1440 div LogX;
        rc.top := RichEdt.PageRect.Top * 1440 div LogY;
        rc.right := RichEdt.PageRect.Right * 1440 div LogX;
        rc.bottom := RichEdt.PageRect.Bottom * 1440 div LogY;
        end;
    rcPage := rc;
    Title := Caption;
    LastChar := 0;
    MaxLen := RichEdt.GetTextLen;
    chrg.cpMax := -1;
    OldMap := SetMapMode(hdc, MM_TEXT);
    SendMessage(RichEdt.Handle, EM_FORMATRANGE, 0, 0);
    try
      repeat
      chrg.cpMin := LastChar;
      LastChar := SendMessage(RichEdt.Handle, EM_FORMATRANGE, 1,Longint(@Range));
      if (LastChar < MaxLen) and (LastChar < -1) then
         begin
         NewPage;
         end;
      until (LastChar = MaxLen) or (LastChar = -1);
      EndDoc;
    finally
      SendMessage(RichEdt.Handle, EM_FORMATRANGE, 0, 0);
      SetMapMode(hdc, OldMap);
    end;
    end;
end;