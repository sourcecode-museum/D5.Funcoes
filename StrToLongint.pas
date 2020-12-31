Function StrToLongint(InStr: String): LongInt;
//
// Converte uma String em um LongInt
//
Var
Temp,Code : integer;
Begin
result := 0;
Val(InStr,Temp,Code);
   if Code = 0 then
   result := Temp;
End;
