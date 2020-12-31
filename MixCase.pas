Function  MixCase(InString: String): String;
{ Corrige a string que contenha caracteres maiusculos
  inseridos no meio dela para tudo minusculo e com a 
  primeira letra maiuscula}
  
Var I: Integer;
Begin
  Result := LowerCase(InString);
  Result[1] := UpCase(Result[1]);
  For I := 1 To Length(InString) - 1 Do Begin
    If (Result[I] = ' ') Or (Result[I] = '''') Or (Result[I] = '"')
    Or (Result[I] = '-') Or (Result[I] = '.')  Or (Result[I] = '(') Then
      Result[I + 1] := UpCase(Result[I + 1]);
  End;
End;