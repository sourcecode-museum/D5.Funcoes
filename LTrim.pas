function LTrim(Texto:String):String;
{Remove os Espaços em branco à direita da string}
var
  I : Integer;
begin
  I := 0;
  while True do
  begin
    inc(I);
    if I > length(Texto) then
      break;
    if Texto[I] <> #32 then
      break;
  end;
  Result := Copy(Texto,I,length(Texto));
end;
