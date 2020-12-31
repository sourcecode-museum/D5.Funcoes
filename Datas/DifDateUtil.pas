function DifDateUtil(dataini,datafin:string):integer;
{Retorna a quantidade de dias uteis entre duas datas}
var a,b,c:tdatetime;
    ct,s:integer;
begin
if StrToDate(DataFin) < StrtoDate(DataIni) then
   begin
   Result := 0;
   exit;
   end;
ct := 0;
s := 1;
a := strtodate(dataFin);
b := strtodate(dataIni);
if a > b then
   begin
   c := a;
   a := b;
   b := c;
   s := 1;
   end;
a := a + 1;
while (dayofweek(a)<>2) and (a <= b) do
      begin
      if dayofweek(a) in [2..6] then
         begin
         inc(ct);
         end;
      a := a + 1;
      end;
ct := ct + round((5*int((b-a)/7)));
a := a + (7*int((b-a)/7));
while a <= b do
      begin
      if dayofweek(a) in [2..6] then
         begin
         inc(ct);
         end;
      a := a + 1;
      end;
if ct < 0 then
   begin
   ct := 0;
   end;
result := s*ct;
end;
