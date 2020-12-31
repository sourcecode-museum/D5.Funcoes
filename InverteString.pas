Function InverteString(Texto:String):String;
// Inverte uma String
Var
X: Integer;
S: String;
Begin
S:='';
For X := Length(Texto) DownTo 1 do
    begin
    S := S + Copy(Texto,X,1);
    end;
Result := S
End;
