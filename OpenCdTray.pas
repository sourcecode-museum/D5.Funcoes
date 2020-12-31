procedure OpenCdTray(AOpen:Boolean);
//
// Abre a bandeja do CD-Rom
// 
// Coloque na clausua uses da unit a MMSystem.
//
// Declare na clausua private da unit:
//
// private
//    { Private declarations }
//  procedure OpenCdTray(AOpen:Boolean);
//
var
MyDeviceID    : MCIDEVICEID;
MyOpenParams  : TMCI_OPEN_PARMS;
MyError       : LongInt;
MyErrorString : array[0..MAXERRORLENGTH - 1] of Char;
begin
MyOpenParams.lpstrDeviceType := 'cdaudio';
MyError := mciSendCommand(0, MCI_OPEN,MCI_OPEN_TYPE,longint(@MyOpenParams));
if MyError <> 0 then
   begin
   MciGetErrorString(MyError,MyErrorString,MAXERRORLENGTH - 1);
   Showmessage(MyErrorString);
   Exit;
   end;
MyDeviceID := mciGetDeviceID('cdaudio');
if AOpen then
   begin
   MyError := mciSendCommand(MyDeviceID, MCI_SET, MCI_SET_DOOR_OPEN, 0)
   end
else
   begin
   mciSendCommand(MyDeviceID, MCI_SET, MCI_SET_DOOR_CLOSED, 0);
   end;
if MyError <> 0 then
   begin
   MciGetErrorString(MyError,MyErrorString,MAXERRORLENGTH - 1);
   Showmessage(MyErrorString);
   end;
MyError := mciSendCommand(MyDeviceID, MCI_CLOSE, 0, 0);
if MyError <> 0 then
   begin
   MciGetErrorString(MyError,MyErrorString,MAXERRORLENGTH - 1);
   Showmessage(MyErrorString);
   end;
end;
