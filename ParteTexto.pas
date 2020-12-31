function ParteTexto(Frase: string; Parte: string): string;
//
// Retorna uma parte de um texto antes de um caractere especificado
//
var
i,max: integer;
buff: string;
begin
i := 1;
buff := '';
max := length(parte);
while (i <= length(Frase)) and (buff <> parte) do
       begin
       buff := buff + Frase[i];
       if length(buff) > max then
          begin
          buff := copy(buff,2,max);
          end;
       inc(i);
       end;
if buff = Parte then
   begin
   Result := copy(Frase,1,i - max -1);
   Frase := copy(Frase,i,length(Frase)+1 -i);
   end
else
   begin
   Result := Frase;
   Frase := '';
   end;
end;
