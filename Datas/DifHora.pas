{Retorna a diferença entre duas horas}
function DifHora(psInicial,psFinal : String): String;
var
  HIni,HFim : TDateTime;
  sTime: string;
begin
  Hini := StrTotime(psInicial);
  HFim := StrToTime(psFinal);

  If (psInicial > psFinal) then begin
    sTime := TimeToStr( StrToTime('23:59:59') - HIni);
    sTime := TimeToStr( StrToTime(sTime) + StrToTime('00:00:01') );

    Result := TimeToStr( StrToTime(sTime) + HFim);

  end else
    Result := TimeToStr(HFim - HIni);

end;
