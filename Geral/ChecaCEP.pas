function ChecaCEP(cCep:String ; cEstado:String): Boolean;
//
// Verifica se um CEP é valido ou não
//
var
cCEP1 : Integer;
begin
cCep := copy(cCep,1,5) + copy(cCep,7,3);
cCEP1 := StrToInt(copy(cCep,1,3));
if Length(trim(cCep)) > 0 then
   begin
   if (StrToInt(cCep) <= 1000000.0) then
       begin
       MessageDlg('CEP tem que ser maior que [01000-000]',mtError,[mbOk],0);
       Result := False
       end
   else
       begin
       if Length(trim(copy(cCep,6,3))) < 3 then Result := False else
       if (cEstado = 'SP') and (cCEP1 >= 10 ) and (cCEP1 <= 199) then Result := True else
       if (cEstado = 'RJ') and (cCEP1 >= 200) and (cCEP1 <= 289) then Result := True else
       if (cEstado = 'ES') and (cCEP1 >= 290) and (cCEP1 <= 299) then Result := True else
       if (cEstado = 'MG') and (cCEP1 >= 300) and (cCEP1 <= 399) then Result := True else
       if (cEstado = 'BA') and (cCEP1 >= 400) and (cCEP1 <= 489) then Result := True else
       if (cEstado = 'SE') and (cCEP1 >= 490) and (cCEP1 <= 499) then Result := True else
       if (cEstado = 'PE') and (cCEP1 >= 500) and (cCEP1 <= 569) then Result := True else
       if (cEstado = 'AL') and (cCEP1 >= 570) and (cCEP1 <= 579) then Result := True else
       if (cEstado = 'PB') and (cCEP1 >= 580) and (cCEP1 <= 589) then Result := True else
       if (cEstado = 'RN') and (cCEP1 >= 590) and (cCEP1 <= 599) then Result := True else
       if (cEstado = 'CE') and (cCEP1 >= 600) and (cCEP1 <= 639) then Result := True else
       if (cEstado = 'PI') and (cCEP1 >= 640) and (cCEP1 <= 649) then Result := True else
       if (cEstado = 'MA') and (cCEP1 >= 650) and (cCEP1 <= 659) then Result := True else
       if (cEstado = 'PA') and (cCEP1 >= 660) and (cCEP1 <= 688) then Result := True else
       if (cEstado = 'AM') and ((cCEP1 >= 690) and (cCEP1 <= 692) or (cCEP1 >= 694) and (cCEP1 <= 698)) then Result := True else
       if (cEstado = 'AP') and (cCEP1 = 689) then Result := True else
       if (cEstado = 'RR') and (cCEP1 = 693) then Result := True else
       if (cEstado = 'AC') and (cCEP1 = 699) then Result := True else
       if ((cEstado = 'DF') or (cEstado = 'GO')) and (cCEP1 >= 700) and (cCEP1 <= 769) then Result := True else
       if (cEstado = 'TO') and (cCEP1 >= 770) and (cCEP1 <= 779) then Result := True else
       if (cEstado = 'MT') and (cCEP1 >= 780) and (cCEP1 <= 788) then Result := True else
       if (cEstado = 'MS') and (cCEP1 >= 790) and (cCEP1 <= 799) then Result := True else
       if (cEstado = 'RO') and (cCEP1 = 789) then Result := True else
       if (cEstado = 'PR') and (cCEP1 >= 800) and (cCEP1 <= 879) then Result := True else
       if (cEstado = 'SC') and (cCEP1 >= 880) and (cCEP1 <= 899) then Result := True else
       if (cEstado = 'RS') and (cCEP1 >= 900) and (cCEP1 <= 999) then Result := True else Result := False
       end;
   end
else
   begin
   Result := True;
   end
end;
