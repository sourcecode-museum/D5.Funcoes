function LeMCI(Param:Integer; Form_Handle: Integer): String;
//
// Le o Retorno de um Comando MCI
//
// Esta função faz o mesmo que a MandaMCI, mas gera um retorno. Ela
// deve ser usada, obviamente, em comandos que exigem retorno,
// como por exemplo:  'Status CDAudio Position'.
//
Var
   Comando : Pchar;
   RetornoMci: array[0..150] of char;
   Ponteiro: pointer;
begin
Case param of
     1:  Comando :=  'OPEN CDAUDIO SHAREABLE';           // Abre o dispositivo CdPlayer para ser controlado.
     2:  Comando :=  'CLOSE CDAUDIO';                    // Fecha o dispositivo CdPlayer, que não aceitará mais comandos.
     3:  Comando :=  'STATUS CDAUDIO MODE';              // Operação atual do CdPlayer: 'Playing', 'Stopped', entre outros.
     4:  Comando :=  'PLAY CDAUDIO';                     // Executa um Play.
     5:  Comando :=  'STOP CDAUDIO';                     // Executa um Stop.
     6:  Comando :=  'SEEK CDAUDIO TO START';            // Move o CdPlayer para o início do CD.
     7:  Comando :=  'SET CDAUDIO TIME FORMAT TMSF';     // Deve ser executado sempre antes de um comando que retornará dados.
     8:  Comando :=  'STATUS CDAUDIO NUMBER OF TRACKS';  // Número de trilhas de áudio do CD.
     9:  Comando := 'STATUS CDAUDIO LENGTH';             // Tempo total do CD.
     10: Comando := 'STATUS CDAUDIO CURRENT TRACK';      // Número da trilha em que o CdPlayer se encontra.
     11: Comando := 'STATUS CDAUDIO POSITION';           // Tempo da música atual em que o CDPlayer se encontra.
end;
Ponteiro := addr(RetornoMci);
mciSendString(Comando,ponteiro,150,Form_Handle);
Result := StrPas(retornomci);
end;