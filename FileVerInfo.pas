function FileVerInfo(const FileName: string;var FileInfo: TStringList): Boolean;
//
// Obtem diversas informações de um arquivo executável
//
//  Requer um StringList criado antes de executar a função
//  deve ser declarado na clausula Var no inicio da Unit
//  StrLst := TStringList.Create;
//
//
const

Key: array[1..9] of string =('CompanyName',
                             'FileDescription',
                             'FileVersion',
                             'InternalName',
                             'LegalCopyright',
                             'OriginalFilename',
                             'ProductName',
                             'ProductVersion',
                             'Comments');

KeyBr: array [1..9] of string = ('Empresa..........................',
                                 'Descricao........................',
                                 'Versao do Arquivo...........',
                                 'Nome Interno...................',
                                 'Copyright..........................',
                                 'Nome Original do Arquivo.',
                                 'Produto.............................',
                                 'Versao do Produto............',
                                 'Comentarios...............:');
var
  Dummy : THandle;
  BufferSize, Len : Integer;
  Buffer : PChar;
  LoCharSet, HiCharSet : Word;
  Translate, Return : Pointer;
  StrFileInfo, Flags : string;
  TargetOS, TypeArq : string;
  FixedFileInfo : Pointer;
  i : Byte;
begin
Result := False;
If not FileExists(FileName) then
   begin
   showmessage('Arquivo não encontrado');
   Result := False;
   exit;
   end;
BufferSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
if BufferSize <> 0 then
   begin
   GetMem(Buffer, Succ(BufferSize));
   try
     if GetFileVersionInfo(PChar(FileName), 0, BufferSize,Buffer) then
        begin
        if VerQueryValue(Buffer, '\VarFileInfo\Translation', Translate, UINT(Len)) then
           begin
           LoCharSet := LoWord(Longint(Translate^));
           HiCharSet := HiWord(Longint(Translate^));
           for i := 1 to 9 do
               begin
               StrFileInfo := Format('\StringFileInfo\0%x0%x\%s',[LoCharSet, HiCharSet, Key[i]]);
               if VerQueryValue(Buffer,PChar(StrFileInfo), Return,UINT(Len)) then
                  begin
                  FileInfo.Add(KeyBr[i] + ': ' + PChar(Return));
                  end;
               end;
           if VerQueryValue(Buffer,'\',FixedFileInfo, UINT(Len)) then
              with TVSFixedFileInfo(FixedFileInfo^) do
                   begin
                   Flags := '';
                   if (dwFileFlags and VS_FF_DEBUG) = VS_FF_DEBUG then
                      begin
                      Flags := Concat(Flags,'*Debug* ');
                      end;
                   if (dwFileFlags and VS_FF_SPECIALBUILD) = VS_FF_SPECIALBUILD then
                      begin
                      Flags := Concat(Flags, '*Special Build* ');
                      end;
                   if (dwFileFlags and VS_FF_PRIVATEBUILD) = VS_FF_PRIVATEBUILD then
                      begin
                      Flags := Concat(Flags, '*Private Build* ');
                      end;
                   if (dwFileFlags and VS_FF_PRERELEASE) =  VS_FF_PRERELEASE then
                      begin
                      Flags := Concat(Flags, '*Pre-Release Build* ');
                      end;
                   if (dwFileFlags and VS_FF_PATCHED) = VS_FF_PATCHED then
                      begin
                      Flags := Concat(Flags, '*Patched* ');
                      end;
                   if Flags <> '' then
                      begin
                      FileInfo.Add('Atributos: ' + Flags);
                      end;
                   TargetOS := 'Plataforma (OS): ';
                   case dwFileOS of
                        VOS_UNKNOWN : TargetOS := Concat(TargetOS, 'Desconhecido');
                        VOS_DOS :     TargetOS := Concat(TargetOS, 'MS-DOS');
                        VOS_OS216 :   TargetOS := Concat(TargetOS, '16-bit OS/2');
                        VOS_OS232 :   TargetOS := Concat(TargetOS, '32-bit OS/2');
                        VOS_NT    :   TargetOS := Concat(TargetOS, 'Windows NT');
                        VOS_NT_WINDOWS32, 4:   TargetOS := Concat(TargetOS, 'Win32 API');
                        VOS_DOS_WINDOWS16:     TargetOS := Concat(TargetOS, '16-bit Windows ','sob MS-DOS');
                   else
                      TargetOS := Concat(TargetOS, 'Fora do Padrão. Código: ', IntToStr(dwFileOS));
                   end;
        FileInfo.Add(TargetOS);
        TypeArq := 'Tipo de Arquivo: ';
        case dwFileType of
             VFT_UNKNOWN : TypeArq := Concat(TypeArq,'Desconhecido');
             VFT_APP : TypeArq := Concat(TypeArq,'Aplicacao');
             VFT_DLL : TypeArq := Concat(TypeArq,'Dynamic-Link Lib.');
             VFT_DRV : begin
                       TypeArq := Concat(TypeArq,'Device driver - Driver ');
                       case dwFileSubtype of
                            VFT2_UNKNOWN : TypeArq := Concat(TypeArq,'Desconhecido');
                            VFT2_DRV_PRINTER : TypeArq := Concat(TypeArq,'de Impressao');
                            VFT2_DRV_KEYBOARD  : TypeArq := Concat(TypeArq,'de Teclado');
                            VFT2_DRV_LANGUAGE  : TypeArq := Concat(TypeArq,'de Idioma');
                            VFT2_DRV_DISPLAY   : TypeArq := Concat(TypeArq,'de Vídeo');
                            VFT2_DRV_MOUSE     : TypeArq := Concat(TypeArq,'de Mouse');
                            VFT2_DRV_NETWORK   : TypeArq := Concat(TypeArq,'de Rede');
                            VFT2_DRV_SYSTEM    : TypeArq := Concat(TypeArq,'de Sistema');
                            VFT2_DRV_INSTALLABLE : TypeArq := Concat(TypeArq,'Instalavel');
                            VFT2_DRV_SOUND       : TypeArq := Concat(TypeArq,'Multimida');
                       end;
                       end;
             VFT_FONT : begin
                        TypeArq := Concat(TypeArq,'Fonte - Fonte ');
                        case dwFileSubtype of
                             VFT2_UNKNOWN : TypeArq := Concat(TypeArq, 'Desconhecida');
                             VFT2_FONT_RASTER   : TypeArq := Concat(TypeArq,'Raster');
                             VFT2_FONT_VECTOR   : TypeArq := Concat(TypeArq,'Vetorial');
                             VFT2_FONT_TRUETYPE : TypeArq := Concat(TypeArq,'TrueType');
                         end;
                         end;
             VFT_VXD : TypeArq := Concat(TypeArq,'Virtual Device');
             VFT_STATIC_LIB: TypeArq := Concat(TypeArq,'Static-Link Lib.');
             end;
        FileInfo.Add(TypeArq);
        end;
      end;
    end;
   finally
      FreeMem(Buffer, Succ(BufferSize));
      Result := FileInfo.Text <> '';
   end;
   end;
end;
