function RegisterLink(Ext, FType, FriendlyName, Cmd: PChar): Boolean;
//
// Tenta associar um tipo de arquivo a um aplicativo
//
// Ext: Extensão a ser registrada.
// FType: Categoria do arquivo
// FriendlyName: Tipo de arquivo
// Cmd: linha de comando para abrí-lo
//
// Ex:
//
// RegisterLink('.Bsd','ArqInutil','Arquivo inútil','C:\Windows\Notepad.exe "%1"')
//
var
Key: HKey;
SZEntry: Array[0..255] of Char;
SZSize: LongInt;
begin
Result := True;
if RegOpenKey(HKEY_CLASSES_ROOT,Ext,Key) = ERROR_SUCCESS then
   begin
   SZSize := SizeOf(SZEntry);
   RegQueryValue(Key,'',SZEntry,SZSize);
   StrCat(SZEntry,'\Shell\Open\Command');
   if RegOpenKey(HKEY_CLASSES_ROOT,SZEntry,Key) = ERROR_SUCCESS then
      begin
      SZSize := SizeOf(SZEntry);
      RegQueryValue(Key,'',SZEntry,SZSize);
      if (StrIComp(SZEntry,Cmd) = 0) and (MessageDlg('A extensão "'+StrPas(Ext)+ '" já está associada para '+copy(StrPas(SZEntry),1,22)+#13+'Você deseja substituir a associação atual por esta?', mtConfirmation, [mbYes,mbNo],0) <> IDYES)  then
         begin
         Result := False;
         Exit;
         end;
      end;
   end;
RegCreateKey(HKEY_CLASSES_ROOT,Ext,Key);
RegSetValue(Key,'',REG_SZ,FType,StrLen(FType));
RegCreateKey(HKEY_CLASSES_ROOT,FType,Key);
RegSetValue(Key,'',REG_SZ,FriendlyName,StrLen(FriendlyName));
StrCat(StrCopy(SZEntry,FType),'\Shell\Open\Command');
RegCreateKey(HKEY_CLASSES_ROOT,SZEntry,Key);
RegSetValue(Key,'',REG_SZ,Cmd,StrLen(Cmd));
end;
