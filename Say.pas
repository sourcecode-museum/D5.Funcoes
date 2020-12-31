procedure TPrintx_Form1.Say(Nlin,Ncol: Integer;Var LinhaAtual: Integer; Var Arquivo: Text;Texto: Variant);
{Função para impressão de linhas em um relatorio}
var
  X: Integer;
begin
Write(Arquivo,#13);
If Nlin<>LinhaAtual then
   begin
   for X :=LinhaAtual to (Nlin-1) do
       begin
       WriteLn(Arquivo,'');
       LinhaAtual:=LinhaAtual+1;
       end;
   end;
If Ncol>0 then
   begin
   For X:=0 to Ncol do
       begin
       Write(Arquivo,' ');
       end;
   end;
  If LinhaAtual >=63 then { 63 É O NÚMERO DA ÚLTIMA LINHA ANTES DO RODAPÉ}
     begin
     For X:=63 to 67 do { 67 É A QUANTIDADE DE LINHAS POR PÁGINA }
         begin
         Writeln(Arquivo,'');
         LinhaAtual:=1;
         end;
     end;
Write(Arquivo,Texto);
end;


procedure TSistemaAlmoxarifado.Button1Click(Sender: TObject);
var
  ArqPrn: TextFile;
  LinhaAtual: Integer;
begin
  LinhaAtual:=0;
  AssignFile(ArqPrn,'LPT1');
  ReWrite(ArqPrn);
  Say(00,00,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(01,01,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(02,00,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(03,03,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(04,00,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(05,03,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(06,00,LinhaAtual,ArqPrn,'Teste de Impressao');
  Say(07,04,LinhaAtual,ArqPrn,123456789);
  Say(08,00,LinhaAtual,ArqPrn,123456789);
  Say(09,00,LinhaAtual,ArqPrn,123456789);
  CloseFile(ArqPrn);
end;

