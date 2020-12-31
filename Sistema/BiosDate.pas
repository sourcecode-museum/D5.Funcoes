function BiosDate: String;
// Retorna a data da fabricação do Chip da Bios do sistema
begin
   result := string(pchar(ptr($FFFF5)));
end;
