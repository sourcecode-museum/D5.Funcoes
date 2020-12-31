procedure DBasePack(Ntable :TTable);
//
// Efetua um pack em tabelas Dbase
//
var
Error: DbiResult;
ErrorMsg: String;
Special: DBIMSG;
begin
Ntable.Active := False;
try
  Ntable.Exclusive := True;
  Ntable.Active := True;
  Error := DbiPackTable(Ntable.DBHandle, Ntable.Handle, nil, szdBASE, True);
  Ntable.Active := False;
  Ntable.Exclusive := False;
finally
  Ntable.Active := True;
end;
case Error of
     DBIERR_NONE:            ErrorMsg := 'Pack efetuado com Successo';
     DBIERR_INVALIDPARAM:    ErrorMsg := 'A especificação da tabela ou seu ponteiro é nulo ou inválido';
     DBIERR_INVALIDHNDL:     ErrorMsg := 'O Cabeçalho da tabela ou seu cursor é nulo ou inválido';
     DBIERR_NOSUCHTABLE:     ErrorMsg := 'Nome da tabela não encontrado ou inválido';
     DBIERR_UNKNOWNTBLTYPE:  ErrorMsg := 'Tipo de tabela desconhecido';
     DBIERR_NEEDEXCLACCESS:  ErrorMsg := 'A tabela não foi aberta em modo exclusivo';
else
     DbiGetErrorString(Error, Special);
     ErrorMsg := '[' + IntToStr(Error) + ']: ' + Special;
end;
MessageDlg(ErrorMsg, mtWarning, [mbOk], 0);
end;