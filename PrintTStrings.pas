procedure PrintTStrings(Lst : TStrings);
//
// Imprime um Stringlist
//
// Lst é o nome do objeto Stringlist criado.
//
var
I,
Line : Integer;
begin
I := 0;
Line := 0 ;
Printer.BeginDoc ;
for I := 0 to Lst.Count - 1 do
    begin
    Printer.Canvas.TextOut(0, Line, Lst[I]);
    Line := Line + Abs(Printer.Canvas.Font.Height);
    if (Line >= Printer.PageHeight) then
       begin
       Printer.NewPage;
       end;
    end;
Printer.EndDoc;
end;
