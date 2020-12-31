Function RetornaBit(Byteval: Byte; NByte: Byte): Byte;
//
// Retorna o valor de cada bit de um determinado byte
//
// Ryteval : o Byte que voce deseja obter o valor
// NByte: o Bit desejado
//
Var
RetVal, n : Byte;
begin
Retval := (Byteval shr NByte) and 1;
Result := Retval;
end;
