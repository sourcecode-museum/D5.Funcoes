function fnTitleCase(sInputString: string):string;
//
// Converte uma string de caixa alta e baixa misturada
// para todas minusculas e a primeira maiuscula
//
var
sTemp1, sTemp2 : string;
bChangeToUpper : Boolean;
iX : integer;
begin
try
  sTemp1 := LowerCase(sInputString);
  bChangeToUpper := True;
  for iX := 1 to length(sTemp1) do
      begin
      if bChangeToUpper then
         begin
         sTemp2 := sTemp2 + UpperCase(sTemp1[iX])
         end;
      else
         begin
         sTemp2 := sTemp2 + sTemp1[iX];
         end;
      bChangeToUpper := (sTemp1[iX] = ' ');
      end;
  Result := sTemp2;
except
  Result := '';
end;
end;
