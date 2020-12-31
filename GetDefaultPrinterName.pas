function GetDefaultPrinterName : string;
//
// Retorna o nome da impressora padrão do Windows
//
begin
if(Printer.PrinterIndex > 0)then
  begin
  Result := Printer.Printers[Printer.PrinterIndex];
  end
else
  begin
  Result := 'Nenhuma impressora Padrão foi detectada';
  end;
end;
