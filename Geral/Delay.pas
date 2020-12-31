procedure Delay(iMSecs: Integer);
//
// Promove um estado de espera no
// aplicativo
//
//
var
lnTickCount: LongInt;
begin
lnTickCount := GetTickCount;
repeat
    Application.ProcessMessages;
until ((GetTickCount - lnTickCount) >= LongInt(iMSecs));
end;
