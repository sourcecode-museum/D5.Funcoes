function EliminaFormatacao(sTexto:String):String;
//
// Elimina os caracteres de formatacao da string
// (inclusive os espaços entre as palavras)
//
var
iPos : Integer;
iTamanho : Integer;
sTextoSemFormato : String;
sCaractere : String;
sCaracMascaras : String;
begin
Result := sTexto;
if sTexto = ''  then
   begin
   Exit;
   end;
sTextoSemFormato := '';
sCaracMascaras := './\><_+=[]{}()-$&@*';
iTamanho := Length(sTexto);
for iPos := 1 to iTamanho do
    begin
    sCaractere := Copy(sTexto,iPos,1);
    if Pos(sCaractere,sCaracMascaras) = 0 then
       begin
       sTextoSemFormato := sTextoSemFormato + sCaractere;
       end;
    end;
Result := sTextoSemFormato;
end;
