function NumLinhasArq(Arqtexto:String): integer;
// Retorna o número de linhas que um arquivo possui
Var
   f: Textfile;
   linha, cont:integer;
Begin
linha := 0;
cont := 0;
AssignFile(f,Arqtexto);
Reset(f);
While not eof(f) Do
      begin
      ReadLn(f);
      Cont := Cont + 1;
      end;
Closefile(f);
result := cont;
end;
