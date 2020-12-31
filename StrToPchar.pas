function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
     begin
     Result := @Str[1];
     end
  else
     begin
     Result := StrAlloc(Length(Str)+1);
     RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
     StrPCopy(Result,Str);
     StrDispose(Ring[RingIndex]);
     Ring[RingIndex]:= Result;
     end;
end;
