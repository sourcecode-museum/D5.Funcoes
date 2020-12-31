Function wordcount(str : string) : integer;
// Retorna o número de palavras que contem em uma string
var
count : integer;
i : integer;
len : integer;
begin
len := length(str);
count := 0;
i := 1;
while i <= len do
      begin
      while ((i <= len) and ((str[i] = #32) or (str[i] = #9) or (Str[i] = ';'))) do
            inc(i);
            if i <= len then
               inc(count);
             while ((i <= len) and ((str[i] <> #32) and (str[i] <> #9) and (Str[i] <> ';'))) do
                   inc(i);
      end;
      wordcount := count;
end;
