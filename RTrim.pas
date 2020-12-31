function RTrim(Texto:String):String;
{Remove os Espaços em branco à esquerda da string}
var
  I : Integer;
begin
  I := length(Texto)+1;
  while True do
  begin
    Dec(I);
    if I <= 0 then
      break;
    if Texto[I] <> #32 then
      break;
  end;
  Result := Copy(Texto,1,I);
end;
