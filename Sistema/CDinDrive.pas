function CDinDrive(DriveLetter: Char): Boolean;
//
// Testa se tem CD no CD-Rom.
//
var
Mask: string[6];
SearchRec: TSearchRec;
SaveErrorMode: Cardinal;
begin
SaveErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
Mask:= DriveLetter + ':\*.*';
{$I-}
if FindFirst(Mask, faAnyfile, SearchRec) = 0 then
   begin
   CDinCDROMDrive := True
   end
else
   begin
   CDinCDROMDrive := False; {probably -18}
   end;
FindClose(SearchRec); {for 32-bit compatibility}
{$I+}
SaveErrorMode := SetErrorMode(SaveErrorMode); {Reset it}
end;




