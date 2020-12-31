function isStrDateTime(dateStr:string ): boolean;
//
// Testa se uma String tem um valor de Data válido
// ou não
//
begin
try
  strToDateTime(dateStr);
  result := true;
except
 result := false;
end;
end;
