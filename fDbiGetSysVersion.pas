function fDbiGetSysVersion(SysVerList: TStringList): SYSVersion;
//
// Retorna informações sobre a versão usada do BDE
//
// Requer as DB,DbiTypes, DbiProcs, DbiErrs declaradas na clausula
// uses da unit
//
var
Month, Day, iHour, iMin, iSec: Word;
Year: SmallInt;
begin
Check(DbiGetSysVersion(Result));
if (SysVerList <> nil) then
   begin
   with SysVerList do
        begin
        Clear;
        Add(Format('ENGINE VERSION = %d', [Result.iVersion]));
        Add(Format('INTERFACE LEVEL = %d', [Result.iIntfLevel]));
        Check(DbiDateDecode(Result.dateVer, Month, Day, Year));
        Add(Format('VERSION DATE = %s', [DateToStr(EncodeDate(Year, Month,Day))]));
        Check(DbiTimeDecode(Result.timeVer, iHour, iMin, iSec));
        Add(Format('VERSION TIME = %s', [TimeToStr(EncodeTime(iHour, iMin,iSec div 1000, iSec div 100))]));
        end;
   end;
end;