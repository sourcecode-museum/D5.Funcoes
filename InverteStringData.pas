function InverteStringData(sData:String; sFormatoOrigem : String; sFormatoDestino: String):String;
//
// Recebe uma string de data, convertendo-a do formato ORIGEM para o formato
// DESTINO
//
// Ex:
// InverteStringData(DateToStr(Date),'DD/MM/AAAA','AAAA/MM/DD')
//
var
sDia : String;
sMes : String;
sAno : String;
begin
if sFormatoOrigem = 'DD/MM/AAAA' then
   begin
   sDia := Copy(sData,1,2);
   sMes := Copy(sData,4,2);
   sAno := Copy(sData,7,4);
   end
else
   if sFormatoOrigem = 'MM/DD/AAAA' then
      begin
      sMes := Copy(sData,1,2);
      sDia := Copy(sData,4,2);
      sAno := Copy(sData,7,4);
      end
   else
      if sFormatoOrigem = 'AAAA/MM/DD' then
         begin
         sAno := Copy(sData,1,4);
         sMes := Copy(sData,6,2);
         sDia := Copy(sData,9,2);
         end
       else
         begin
         MessageDlg('Formato original da data errado (Função InverteStringData) - A própria data do sistema foi retornada.',mtError,[mbOk],0);
         Result := DateToStr(Date);
         Exit;
         end;
if sFormatoDestino = 'DD/MM/AAAA' then
   begin
   Result := sDia + '/' + sMes + '/' + sAno;
   end
else
   if sFormatoDestino = 'MM/DD/AAAA' then
      begin
      Result := sMes + '/' + sDia + '/' + sAno;
      end
   else
      if sFormatoDestino = 'AAAA/MM/DD' then
         begin
         Result := sAno + '/' + sMes + '/' + sDia
         end
      else
         begin
         MessageDlg('Formato destino da data errado (Função InverteStringData) - A própria data do sistema foi retornada.', mtError,[mbOk],0);
         Result := DateToStr(Date);
         Exit;
         end;
end;
