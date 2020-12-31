function DifDias(DataVenc:TDateTime; DataAtual:TDateTime): String;
{Retorna a diferenca de dias entre duas datas}
Var Data: TDateTime;
    dia, mes, ano: Word;
begin
if DataAtual < DataVenc then
   begin
   Result := 'A data data atual não pode ser menor que a data inicial';
   end
else
   begin
   Data := DataAtual - DataVenc;
   DecodeDate( Data, ano, mes, dia);
   Result := FloatToStr(Data)+' Dias';
   end;
end;
