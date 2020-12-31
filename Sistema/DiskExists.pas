function DiskExists(Drive: Char): Boolean;
//
// Testa se existe um disco no Drive especificado
//
var
ErrorMode: Word;
begin
Drive := UpCase(Drive);
if not (Drive in ['A'..'Z']) then
   raise EConvertError.Create('Not a valid drive letter');
ErrorMode := SetErrorMode(SEM_FailCriticalErrors);
try
  Application.ProcessMessages;
  Result := (DiskSize(Ord(Drive) - Ord('A') + 1) <> -1);
finally
  SetErrorMode(ErrorMode);
  Application.ProcessMessages;
end;
end;
