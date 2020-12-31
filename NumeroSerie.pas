function NumeroSerie(Unidade:PChar):String;
{Retorna o Número serial da unidade especificada}
var
VolName,SysName : AnsiString;
SerialNo,MaxCLength,FileFlags : DWord;
begin
try
  SetLength(VolName,255);
  SetLength(SysName,255);
  GetVolumeInformation(Unidade,PChar(VolName),255,@SerialNo,
  MaxCLength,FileFlags,PChar(SysName),255);
  result := IntToHex(SerialNo,8);
except
  result := ' ';
end;
