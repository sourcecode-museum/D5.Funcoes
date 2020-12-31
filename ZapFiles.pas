Procedure ZapFiles(vMasc:String);
{Apaga arquivos usando mascaras tipo: c:\Temp\*.zip, c:\Temp\*.* 
 Obs: Requer o Path dos arquivos a serem deletados}
Var Dir : TsearchRec;
    Erro: Integer;
Begin
   Erro := FindFirst(vMasc,faArchive,Dir);
   While Erro = 0 do Begin
      DeleteFile( ExtractFilePAth(vMasc)+Dir.Name );
      Erro := FindNext(Dir);
   End;
   FindClose(Dir);
End;
