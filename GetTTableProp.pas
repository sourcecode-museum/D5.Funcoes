Procedure GetTTableProp(hTmpCur: hDbiCur; CurList: TStrings);
//
// Retorna um Stringlist com todas as informações da tabela
//
// Coloque um Componente TTable no form e defina a propriedade
// Active para True
//
var
Prop : CURProps;
begin
Check(DbiGetCursorProps(hTmpCur, Prop));
with CurList do
     begin
     Add('Table Name: ' + Prop.szName);
     Add('Table Type: ' + Prop.szTableType);
     Add('Fields: ' + IntToStr(Prop.iFields));
     Add('Record Buffer Size: ' + IntToStr(Prop.iRecBufSize));
     Add('Indexes: ' + IntToStr(Prop.iIndexes));
     Add('Validity Checks: ' + IntToStr(Prop.iValChecks));
     Add('Referential Integ Checks: ' +IntToStr(Prop.iRefIntChecks));
     Add('Table Level: ' + IntToStr(Prop.iTblLevel));
     Add('Language Driver: ' + Prop.szLangDriver);
     end;
end;