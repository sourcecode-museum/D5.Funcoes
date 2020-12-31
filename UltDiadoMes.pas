function UltDiaDoMes(Data: TDateTime): Word;
// Retorna o Ultimo dia do mes de uma determinada
// data
var
d,m,a: Word;
dt: TDateTime;
begin
DecodeDate(Data, a,m,d);
Inc(m);
if m = 13 then
   begin
   m := 1;
   end;
dt := EncodeDate(a,m,1);
dt := dt - 1;
DecodeDate(dt, a,m,d);
Result := d;
end;
