Function GetExetype( Const fname: String ): TExetype;
//
// Retorna o tipo de executável que é o arquivo
// Ideal para testar se o executável está corrompido
// ou imcompativel
//
// Exemplo:
//
// procedure TForm1.Button1Click(Sender: TObject);
// type
// TExeStrings = Array [TExetype] of String[30];
// const
// ExeStrings : TExeStrings = ('Unknown file type', 'Dos executable', 'Windows 16 bit executable','Windows 32 bit executable');
// begin
// With OpenDialog1 Do
//      If Execute Then
//         begin
//         Showmessage(ExeStrings[ GetExetype( filename )]);
//         end;
// end;
//
//
Var
signature: Word;
WinHdrOffset: Word;
fexe:  TFileStream;
Begin
result := etUnknown;
try
  fexe := TFileStream.Create( fname, fmOpenRead or fmShareDenyNone);
  try
    fexe.ReadBuffer( signature, Sizeof(signature));
    If signature = $5A4D { 'MZ' } Then
       Begin
       result := etDOS;
       fexe.Seek( $18, soFromBeginning );
       fexe.ReadBuffer( WinHdrOffset, Sizeof(WinHdrOffset));
       If WinHdrOffset >= $40 Then
          Begin
          fexe.Seek( $3C, soFromBeginning );
          fexe.ReadBuffer( WinHdrOffset, Sizeof(WinHdrOffset));
          fexe.Seek( WinHdrOffset, soFrombeginning );
          fexe.ReadBuffer( signature, Sizeof(signature));
          If signature = $454E { 'NE' } Then
             begin
             result := etWinNE;
             end
          else
             begin
             If signature = $4550 { 'PE' } Then
             end;
          result := etWinPE;
          end; { If }
       end; { If }
    finally
       fexe.Free;
    end
    except
    end;
end;
