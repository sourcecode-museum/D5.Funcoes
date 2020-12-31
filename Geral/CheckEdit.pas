function CheckEdit : Boolean ;
//
// Avisa se algum Edit no formulário não foi
// preenchido
//
// deve ser usada assim:
// function TForm1.CheckForBlankText : Boolean;
//
// Declare-a na clausula Private do form
//
var
n : LongInt ;
begin
Result := false ;
for n := 0 to ( ComponentCount - 1 ) do
    begin
    if ( components[n].ClassType = TEdit ) then
       begin
       if TEdit (components[n]).text = '' then
          begin
          Result := true ;
          Exit;
          end;
       end ;
    end ;
End;
