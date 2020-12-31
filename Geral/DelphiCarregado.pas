{ Estas funções servem para verificar
 se o delphi está carregado ou não}
Function JanelaExiste(Classe,Janela:String) :Boolean;
var
  PClasse,PJanela : array[0..79] of char;
begin
  if Classe = '' then
    PClasse[0] := #0
  else
    StrPCopy(PClasse,Classe);
  if Janela = '' then
    PJanela[0] := #0
  else
    StrPCopy(PJanela,Janela);
  if FindWindow(PClasse,PJAnela) <> 0 then
    result := true
  else
    Result := false;
end;


Function DelphiCarregado : Boolean;
begin
Result :=  False;
if JanelaExiste('TPropertyInspector','Object Inspector') then
   begin
   result := True;
   end
else
   begin
   result := False;
   end;
end;


{ No evento OnCreate do form coloque:}

if not DelphiCarregado then
    showmessage('Delphi está ativo, bom menino!')
  else
    begin
      Showmessage('Vc não poderá utilizar esta aplicação! Mau garoto!');
      application.terminate;
    end;
