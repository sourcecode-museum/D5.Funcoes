Function FErase(name: String): boolean;
//
// Apaga um arquivo especificado
//
Var
f: File;
Begin
Result := true;
Assign(f, Name);
FileSetAttr(Name, 0);
Try
  Erase(f);
Except
  On EInOutError Do
     Begin
     Result := false;
     End;
  End;
End;
