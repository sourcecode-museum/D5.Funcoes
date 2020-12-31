function ReadDigits(TheNumber:LongInt;NumDigits:byte):longint;
//
// Lê os ultimos digitos especificados em Numdigits
//
var
TempStr : string;
TempInt : longint;
ErrorCode : integer;
begin
TempStr := IntToStr(TheNumber);
val(copy(TempStr,length(TempStr)-(NumDigits-1),length(TempStr)),TempInt,ErrorCode);
if ErrorCode = 0 then
   begin
   ReadDigits := TempInt
   end;
end;