function API_GetEnvironmentVariables : String;
//
// Retorna todas as informaçòes do ambiente
//
// Exemplo de como usá-la:
//
// procedure TForm1.Button1Click(Sender: TObject);
// var
//   string1,string2:string;
//   i:integer;
// begin
// string1:=API_GetEnvironmentVariables;
// i:=1;
// string2:='';
// if length(string1)>0 then
//    begin
//    repeat
//          while string1[i] <> #255 do
//                begin
//                string2:=string2+string1[i];
//                inc(i);
//                end;
//          memo1.Lines.Add(string2);
//          string2:='';
//          inc(i);
//    until string1[i]=#255;
//    end;
// end;
//
var
pEnvStrings : pointer;
i : integer;
begin
pEnvStrings := GetEnvironmentStrings;
try
  i := 1;
  repeat
        while string(pEnvStrings)[i] <> #0 do
              begin
              result:=result+string(pEnvStrings)[i];
              inc(i);
              end;
        result:=result+#255;
        inc(i)
  until string(pEnvStrings)[i]=#0;
finally
  result:=result+#255;
  FreeEnvironmentStrings(pEnvStrings);
end;
end;
