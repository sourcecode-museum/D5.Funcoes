function IsFloppy(Drive : char) : longbool;
//
// Testa se a unidade especificada é um Floppy
//
var
DrivePath : string;
TipDrive : Integer;
begin
DrivePath := Drive + ':\';
TipDrive := GetDriveType(PChar(DrivePath));
if  TipDrive = 2 then
   begin
   Result := True;
   end
else
   begin
   Result := False;
   end;
end;
