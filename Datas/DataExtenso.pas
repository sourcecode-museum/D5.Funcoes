function DataExtenso(Data:TDateTime): String;
{Para exibir uma data por extenso no Delphi, coloque a seguinte rotina}
var
  NoDia : Integer;
  Now: TdateTime;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
DiaDasemana [1]:= 'Domingo';
DiaDasemana [2]:= 'Segunda-feira';
DiaDasemana [3]:= 'Terça-feira';
DiaDasemana [4]:= 'Quarta-feira';
DiaDasemana [5]:= 'Quinta-feira';
DiaDasemana [6]:= 'Sexta-feira';
DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
Meses [1]:= 'Janeiro';
Meses [2]:= 'Fevereiro';
Meses [3]:= 'Março';
Meses [4]:= 'Abril';
Meses [5]:= 'Maio';
Meses [6]:= 'Junho';
Meses [7]:= 'Julho';
Meses [8]:= 'Agosto';
Meses [9]:= 'Setembro';
Meses [10]:= 'Outubro';
Meses [11]:= 'Novembro';
Meses [12]:= 'Dezembro';
DecodeDate (Data, Ano, Mes, Dia);
NoDia := DayOfWeek (Data);
Result := DiaDaSemana [NoDia] + ', ' + inttostr (Dia) + ' de ' + Meses [Mes]+ ' de ' + inttostr (Ano);
end;
