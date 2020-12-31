procedure TablePack( oTable : TTable );
//
// Dá um pack em uma Tabela
//
var
iResult: DBIResult;
szErrMsg: DBIMSG;
pTblDesc: pCRTblDesc;
bExclusive: Boolean;
bActive: Boolean;
begin
with oTable do
     begin
     bExclusive := Exclusive;
     bActive := Active;
     DisableControls;
     Close;
     Exclusive := True;
     end;
case oTable.TableType of
     ttdBASE: begin
              oTable.Open;
              iResult := DbiPackTable( oTable.DBHandle, oTable.Handle, nil,nil, True );
              if iResult <> DBIERR_NONE then
                 begin
                 DbiGetErrorString( iResult, szErrMsg );
                 MessageDlg( szErrMsg, mtError, [mbOk], 0 );
                 end;
              end;
     ttParadox: begin
                GetMem( pTblDesc, SizeOf( CRTblDesc ));
                FillChar( pTblDesc^, SizeOf( CRTblDesc ), 0 );
                with pTblDesc^ do
                     begin
                     StrPCopy( szTblName, oTable.TableName );
                     StrPCopy( szTblType, szParadox );
                     bPack := True;
                     end;
                iResult := DbiDoRestructure( oTable.DBHandle, 1, pTblDesc,nil, nil, nil, False );
                if iResult <> DBIERR_NONE then
                   begin
                   DbiGetErrorString( iResult, szErrMsg );
                   ShowMessage( szErrMsg, mtError, [mbOk], 0 );
                   end;
                FreeMem( pTblDesc, SizeOf( CRTblDesc ));
                end;
     else
        ShowMessage( 'Impossível compactar uma tabela deste tipoe!');
     end;
     with oTable do
          begin
          Close;
          Exclusive := bExclusive;
          Active := bActive;
          EnableControls;
          end;
end;