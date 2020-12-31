function GetFileLastAccessTime(sFileName : string ) : TDateTime;
//
// Retorna o último acesso ao arquivo especificado
//
var
 ffd : TWin32FindData;
 dft : DWord;
 lft : TFileTime;
 h   : THandle;
begin
// get file information
h := Windows.FindFirstFile(PChar(sFileName), ffd);
if(INVALID_HANDLE_VALUE <> h)then
   begin
   Windows.FindClose( h );
   FileTimeToLocalFileTime(ffd.ftLastAccessTime, lft );
   FileTimeToDosDateTime(lft,LongRec(dft).Hi, LongRec(dft).Lo);
   Result := FileDateToDateTime(dft);
   end;
end;
