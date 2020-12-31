function Geracaracter(const v: variant): string;
//
// Converte qualquer tipo de variavel em String
//
begin
case TVarData(v).vType of
     varEmpty:     result := 'Empty';
     varNull:      result := 'Null';
     varSmallInt:  result := IntToStr(v);
     varInteger:   result := IntToStr(v);
     varSingle:    result := FloatToStr(v);
     varDouble:    result := FloatToStr(v);
     varCurrency:  result := FloatToStr(v);
     varDate:      result := DateToStr(v);
     varVariant:   result := FloatToStr(v);
     varUnknown:   result := '?';
     varByte:      result := IntToStr(v);
     varString:    result := V;
end;
end;
