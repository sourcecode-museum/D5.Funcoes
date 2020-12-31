procedure ListBoxToClipBoard(ListBox: TListBox; BufferSize : Integer; CopyAll : Boolean);
//
// Envia o conteúdo de um Listbox para a área de transferência
//
// Requer um listbox e a unit ClipBrd na clausula uses
// Use o Buffersize para mais de 30 (Recomendado)
//
var
Buffer : PChar;
Size   : Integer;
Ptr    : PChar;
I      : Integer;
Line   : String[255];
Count  : Integer;
begin
if not Assigned(ListBox) then
   Exit;
GetMem(Buffer, BufferSize);
Ptr   := Buffer;
Count := 0;
for I := 0 to ListBox.Items.Count - 1 do
    begin
    Line := ListBox.Items.Strings[I];
    if not CopyAll and ListBox.MultiSelect and (not ListBox.Selected[I]) then
       Continue;
       Count := Count + Length(Line) + 3;
    if Count >= BufferSize then
       Break;
    Move(Line[1], Ptr^, Length(Line));
    Ptr    := Ptr + Length(Line);
    Ptr[0] := #13;
    Ptr[1] := #10;
    Ptr    := Ptr + 2;
    end;
Ptr[0] := #0;
ClipBoard.SetTextBuf(Buffer);
FreeMem(Buffer, BufferSize);
end;
