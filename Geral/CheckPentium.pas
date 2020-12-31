function CheckPentium: integer;
//
// Testa se seu processador pentium tem o Bug fatal
/
const
tstBugVal1: single = 4195835.0;
tstBugVal2: single = 3145727.0;
var
  Answer: double;
begin
{$U-}
Answer := tstBugVal1 / tstBugVal2;
{$U+}
if tstBugVal1 - Answer * tstBugVal2 > 1.0 then
   begin
   CheckPentium := 0;
   end
else
   begin
   CheckPentium := 1;
   end;
end;
