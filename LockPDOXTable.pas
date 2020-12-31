procedure LockPDOXTable(TableName,Password : String);
//
// Bloqueia uma Tabela paradox.
//
// Requer a DBIProcs na clausula uses da unit
//
var
  TblDesc: CRTblDesc;
  LocDB : TDatabase;
begin
  Check(DBIInit(nil));
  Randomize;
  LocDB := TDatabase.Create(nil);
  with LocDB do begin
    Params.Add('path=' + ExtractFilePath(TableName));
    DatabaseName := 'PDOXEncryptDB' + IntToStr(Random(50));
    DriverName := 'STANDARD';
    Connected := True;
  end;
  FillChar(TblDesc, SizeOf(CRTblDesc), 0);
  StrPCopy(TblDesc.szTblName, ExtractFileName(TableName));
  with TblDesc do begin
    bProtected := True;
    StrPCopy(TblDesc.szPassword, Password);
  end;
  try
    Check(DbiDoRestructure(LocDB.Handle, 1, @TblDesc,nil, nil, nil, False));
  finally
    LocDB.Free;
    DBIExit;
  end;
end;
