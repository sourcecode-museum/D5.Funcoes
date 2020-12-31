function IsDriveCD(Drive : char) : longbool;
//
// Testa se a unidade especificada é um CD-Rom
//
var
DrivePath : string;
TipDrive : Integer;
begin
DrivePath := Drive + ':\';
TipDrive := GetDriveType(PChar(DrivePath));
if  TipDrive = 5 then
   begin
   Result := True;
   end
else
   begin
   Result := False;
   end;
end;
