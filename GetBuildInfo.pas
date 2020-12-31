function GetBuildInfo:string;
//
// Retorna a versão do aplicativo
//
var
VerInfoSize:  DWORD;
VerInfo:      Pointer;
VerValueSize: DWORD;
VerValue:     PVSFixedFileInfo;
Dummy:        DWORD;
V1, V2, V3, V4: Word;
Prog : string;
begin
Prog := Application.Exename;
VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
with VerValue^ do
     begin
     V1 := dwFileVersionMS shr 16;
     V2 := dwFileVersionMS and $FFFF;
     V3 := dwFileVersionLS shr 16;
     V4 := dwFileVersionLS and $FFFF;
     end;
FreeMem(VerInfo, VerInfoSize);
result := Copy (IntToStr (100 + v1), 3, 2) + '.' + Copy (IntToStr (100 + v2), 3, 2) + '.' + Copy (IntToStr (100 + v3), 3, 2) + '.' + Copy (IntToStr (100 + v4), 3, 2);
end;
