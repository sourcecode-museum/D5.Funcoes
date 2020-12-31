function strByteSize(Value: Longint): String;
{Retorna uma conversão de Bytes para integer}
Const
KBYTE           = Sizeof(Byte) shl 10;
MBYTE           = KBYTE        shl 10;
GBYTE           = MBYTE        shl 10;
begin
  if Value > GBYTE then
     begin
     Result := FloatToStrF(Round(Value / GBYTE),ffNumber,6,0)+' GB';
     end
  else if Value > MBYTE then
          begin
          Result := FloatToStrF(Round(Value / MBYTE),ffNumber,6,0)+' MB';
          end
  else if Value > KBYTE then
          begin
          Result := FloatToStrF(Round(Value / KBYTE),ffNumber,6,0)+' KB';
          end
  else
     begin
     Result := FloatToStrF(Round(Value),ffNumber,6,0)+' Byte';
     end;
end;

