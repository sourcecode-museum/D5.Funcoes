Procedure FindReplace (const Enc, subs: String; Var Texto:TMemo);
//
// Substitui uma string em um campo memo
//
// use-a assim: FindReplace(Edit1.Text,Edit2.Text, Memo1);
//
Var
i, Posicao: Integer;
Linha: string;
Begin
For i:= 0 to Texto.Lines.count - 1 do
    begin
    Linha := Texto. Lines[i];
    Repeat
    Posicao:=Pos(Enc,Linha);
    If Posicao > 0 then
       Begin
       Delete(Linha,Posicao,Length(Enc));
       Insert(Subs,Linha,Posicao);
       Texto.Lines[i]:=Linha;
       end;
    until Posicao = 0;
    end;
end;
