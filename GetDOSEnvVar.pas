Function GetDOSEnvVar(const VarName:String):String;
// Rotina de resgate das variáveis de ambiente DOS
Var
Len:Integer;
pDosEnv:PChar;
Begin
result :='';
Len := Length(VarName);
PDosEnv := GetEnvironmentStrings;
If (StrLIComp(PDosEnv, @VarName[1], Len) = 0) And (PDosEnv[Len] =' ') Then
   Begin
   Result := StrPas(PDosEnv + Len + 1);
   Break;
   End;
Inc(PDosEnv, StrLen(PDosEnv) + 1);
End;     


