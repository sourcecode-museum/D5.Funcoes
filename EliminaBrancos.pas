function EliminaBrancos(sTexto:String):String;
//
// Elimina todos os espaços em branco da string
//(inclusive os espaços entre as palavras)
//
var
nPos : Integer;
begin
nPos := 1;
while Pos(' ',sTexto) > 0 do
      begin
      nPos := Pos(' ',sTexto);
      (*Text[nPos] := ''; *)
      Delete(sTexto,nPos,1);
      end;
Result := sTexto;
end;
