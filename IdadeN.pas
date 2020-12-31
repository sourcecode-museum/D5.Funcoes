function IdadeN(Nascimento:TDateTime) : String;
//
// Retorna a idade de uma pessoa a partir da data de nascimento
//
Type
Data = Record
       Ano : Word;
       Mes : Word;
       Dia : Word;
       End;
Const
Qdm:String = '312831303130313130313031';          // Qtde dia no mes
Var
Dth : Data;                                  // Data de hoje
Dtn : Data;                                  // Data de nascimento
anos, meses, dias, nrd : Shortint;           // Usadas para calculo da idade
begin
DecodeDate(Date,Dth.Ano,Dth.Mes,Dth.Dia);
DecodeDate(Nascimento,Dtn.Ano,Dtn.Mes,Dtn.Dia);
anos := Dth.Ano - Dtn.Ano;
meses := Dth.Mes - Dtn.Mes;
if meses < 0 then
   begin
   Dec(anos);
   meses := meses+12;
   end;
dias := Dth.Dia - Dtn.Dia;
if dias < 0 then
   begin
   nrd := StrToInt(Copy(Qdm,(Dth.Mes-1)*2-1,2));
   if ((Dth.Mes-1)=2) and ((Dth.Ano Div 4)=0) then
      begin
      Inc(nrd);
      end;
   dias := dias+nrd;
   meses := meses-1;
   end;
Result := IntToStr(anos)+' Anos '+IntToStr(meses)+' Meses '+IntToStr(dias)+' Dias';
end;
