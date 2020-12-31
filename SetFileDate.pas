Procedure SetFileDate (TheFileName: string; aDate: string);
//
// Altera a data e a hora de um arquivo especificado
//
Var
f : integer;
Begin
f := FileOpen (TheFileName, fmOpenReadWrite);
Try
   FileSetDate (f, DateTimeToFileDate ((StrToDateTime (aDate))));
Finally
   FileClose(f)
End;
End;
