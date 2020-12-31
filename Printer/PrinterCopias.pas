Procedure PrinterCopias(Copias:Integer);
//
// Determina um certo número de cópias para
// a impressão
//
var
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port   : array[0..255] of char;
  hDMode : THandle;
  PDMode : PDEVMODE;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode <> 0 then begin
    pDMode := GlobalLock(hDMode);
    if pDMode <> nil then begin
      pDMode^.dmFields := pDMode^.dmFields or DM_COPIES;
      pDMode^.dmCopies := Copias;
      GlobalUnlock(hDMode);
    end;
    GlobalFree(hDMode);
  end;
  Printer.PrinterIndex := Printer.PrinterIndex;
end;
