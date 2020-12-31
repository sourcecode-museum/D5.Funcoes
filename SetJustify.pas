procedure SetJustify(Menu: TMenu; MenuItem: TMenuItem; Justify: Boolean);
//
// Alinha o Menu para a direita do form
//
{$IFDEF WIN32}
var
ItemInfo: TMenuItemInfo;
Buffer: array[0..80] of Char;
{$ENDIF}
begin
{$IFDEF VER80}
MenuItem.Caption := Chr(8) + MenuItem.Caption;
{$ELSE}
ItemInfo.cbSize := SizeOf(TMenuItemInfo);
ItemInfo.fMask := MIIM_TYPE;
ItemInfo.dwTypeData := Buffer;
ItemInfo.cch := SizeOf(Buffer);
GetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
if Justify  then
   begin
   ItemInfo.fType := ItemInfo.fType or MFT_RIGHTJUSTIFY;
   SetMenuItemInfo(Menu.Handle, MenuItem.Command, False, ItemInfo);
   end;
{$ENDIF}
end;
