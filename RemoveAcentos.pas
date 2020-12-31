function RemoveAcentos(Str:String): String;
{Remove caracteres acentuados de uma string}
Const ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
      SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
x : Integer;
Begin
For x := 1 to Length(Str) do
    Begin
    if Pos(Str[x],ComAcento)<>0 Then
       begin
       Str[x] := SemAcento[Pos(Str[x],ComAcento)];
       end;
    end;
Result := Str;
end;
