function isdigit(c:char):boolean;
//
// Testa se o dado é um digito (numero) ou
// um caractere qualquer
//
begin
  result := c in ['0'..'9']
end;
