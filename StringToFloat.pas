function StringToFloat(s : string) : Extended;
{ Filtra uma string qualquer, convertendo as suas partes
  numéricas para sua representação decimal, por exemplo:
  'R$ 1.200,00' para 1200,00 '1AB34TZ' para 134}
var
  i           :Integer;
  t           : string;
  SeenDecimal,SeenSgn  : Boolean;
begin
  t := '';
  SeenDecimal := False;
  SeenSgn       := False;
  {Percorre os caracteres da string:}
  for i := Length(s) downto 0 do
      {Filtra a string, aceitando somente números e separador decimal:}
      if (s[i] in ['0'..'9', '-','+',DecimalSeparator]) then
          begin
          if (s[i] = DecimalSeparator) and (not SeenDecimal)  then
              begin
              t := s[i] + t;
              SeenDecimal := True;
              end
          else if (s[i] in ['+','-']) and (not SeenSgn) and (i = 1) then
                  begin
                  t := s[i] + t;
                  SeenSgn := True;
                  end
          else if s[i] in ['0'..'9'] then
                  begin
                  t := s[i] + t;
                  end;
          end;
          Result := StrToFloat(t);
      end;
