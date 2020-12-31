function SizeDirectory(Dir:string):integer;
{Retorna o tamanho de um diretório}
var
  SearchRec : TSearchRec;
  Separator : string;
  DirBytes : integer;
begin
  if Copy(Dir,Length(Dir),1)='\' then
     begin
     Separator := '';
     end
  else
     begin
     Separator := '\';
     end;
  if FindFirst(Dir+Separator+'*.*',faAnyFile,SearchRec) = 0 then
     begin
     if FileExists(Dir+Separator+SearchRec.Name) then
        begin
        DirBytes := DirBytes + SearchRec.Size;
       {Memo1.Lines.Add(Dir+Separator+SearchRec.Name);}
        end
     else if DirectoryExists(Dir+Separator+SearchRec.Name) then
             begin
             if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') then
                 begin
                 DirSize(Dir+Separator+SearchRec.Name);
                 end;
             end;
     while FindNext(SearchRec) = 0 do
           begin
           if FileExists(Dir+Separator+SearchRec.Name) then
              begin
              DirBytes := DirBytes + SearchRec.Size;
              {Memo1.Lines.Add(Dir+Separator+SearchRec.Name);}
              end
           else if DirectoryExists(Dir+Separator+SearchRec.Name) then
                   begin
                   if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') then
                      begin
                      DirSize(Dir+Separator+SearchRec.Name);
                      end;
                   end;
           end;
     end;
     FindClose(SearchRec);
end;
