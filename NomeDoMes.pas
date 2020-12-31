function NomedoMes(dData:TDatetime):string;
{Retorna o nome do mee, em extenso, de uma determinada data}
var
  nAno,nMes,nDia:word;
  cMes:array[1..12] of string;
begin
cMes[01] := 'Janeiro';
cMes[02] := 'Fevereiro';
cMes[03] := 'Março';
cMes[04] := 'Abril';
cMes[05] := 'Maio';
cMes[06] := 'Junho';
cMes[07] := 'Julho';
cMes[08] := 'Agosto';
cMes[09] := 'Setembro';
cMes[10] := 'Outubro';
cMes[11] := 'Novembro';
cMes[12] := 'Dezembro';
decodedate(dData,nAno,nMes,nDia);
if (nMes>=1) and (nMes<=13)then
    begin
    Result:=cMes[nMes];
    end
else
    begin
    Result:='';
    end;
end;

