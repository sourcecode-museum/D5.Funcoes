procedure DeleteDir(hHandle: THandle; Const sPath : String; Confirm: boolean);
//
// Apaga um diretório com todos os seus arquivos.
//
// Esta função requer a ShellApi declarada na clausula Uses.
//
// use a funcão assim:  DeleteDir(Self.Handle,'C:\TESTE',True);
var
OpStruc: TSHFileOpStruct;
FromBuffer, ToBuffer: Array[0..128] of Char;
begin
fillChar( OpStruc, Sizeof(OpStruc), 0 );
FillChar( FromBuffer, Sizeof(FromBuffer), 0 );
FillChar( ToBuffer, Sizeof(ToBuffer), 0 );
StrPCopy( FromBuffer, sPath);
With OpStruc Do
     Begin
     Wnd:= hHandle;
     wFunc:=FO_DELETE;
     pFrom:= @FromBuffer;
     pTo:= @ToBuffer;
     if not confirm then
        begin
        fFlags:= FOF_NOCONFIRMATION;
        end;
     fAnyOperationsAborted:=False;
     hNameMappings:=nil;
     //lpszProgressTitle:=nil;
     End;
ShFileOperation(OpStruc);
end;
