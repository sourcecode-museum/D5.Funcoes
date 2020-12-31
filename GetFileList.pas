function GetFileList(FDirectory, Filter: TFileName; ShowFolder:Boolean): TStringList;
//
// Cria um stringList com todos os arquivos de um diretório
// Aceita mascaras
//
var
ARec: TSearchRec;
Res: Integer;
begin
if FDirectory[Length(FDirectory)] <> '\'
   then
   begin
   FDirectory := FDirectory + '\';
   end;
Result := TStringList.Create;
try
  Res := FindFirst(FDirectory + Filter, faAnyFile or faArchive, ARec);
  while Res = 0 do
        begin
        if ((ARec.Attr and faArchive) = faAnyFile) or ((ARec.Attr and faArchive) = faArchive) then
           begin
           if ShowFolder then
              begin
              Result.Add(FDirectory + ARec.Name);
              end
           else
              begin
              Result.Add(ARec.Name);
              end
           end;
        Res := FindNext(ARec);
        end;
  FindClose(ARec);
except
  Result.Free;
end;
end;
