Function RetornaMes(DataIn: TDateTime):String;
//
// Retorna o Extenso do mes da data especificada
//
Var
dia, mes, ano: Word;
begin
DecodeDate( DataIn, dia, mes, ano);
Case mes of
     1:RetornaMes :='Janeiro';
     2:RetornaMes :='Fevereiro';
     3:RetornaMes :='Março';
     4:RetornaMes :='Abril';
     5:RetornaMes :='Maio';
     6:RetornaMes :='Junho';
     7:RetornaMes :='Julho';
     8:RetornaMes :='Agosto';
     9:RetornaMes :='Setembro';
     10:RetornaMes :='Outubro';
     11:RetornaMes :='Novembro';
     12:RetornaMes :='Dezembro';
     end;
end;
