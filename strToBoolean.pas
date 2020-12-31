function strToBoolean(s: string): boolean;
//
// Converte um valor String em Booleano
//
begin
result := ((uppercase(s) = 'TRUE') or
           (uppercase(s) = 'T')    or
           (uppercase(s) = 'YES')  or
           (uppercase(s) = 'Y')    or
           (uppercase(s) = 'ON')   or
           (uppercase(s) = 'O')    or
           (uppercase(s) = '1'));
end;
