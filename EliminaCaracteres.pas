function EliminaCaracteres (sTexto: String; sCaracteres:Set of Char):String;
{Elimina de sTexto todos os caracteres passados como parametro}
var
nPos, nTam: Integer;
begin
Result := '';
nPos := 1;
nTam := Lenght(sTexto);
while nPos <= nTam do
      begin
      if not (sTexto[nPos] in sCaracteres) then Result := Result +sTexto[nPos]
      end;
end;