function GetNetworkDriveMappings(sl : TStrings ) : integer;
//
// Retorna as unidades mapeadas na Estação com seus
// Respectivos paths
//
// Ex:
// procedure TForm1.Button1Click(Sender: TObject);
// var
// sl : TStrings;
// nMappingsCount,
// i  : integer;
// begin
// sl := TStringList.Create;
// nMappingsCount :=  GetNetworkDriveMappings( sl );
// for i := 0 to nMappingsCount-1 do
//     begin
//     Listbox1.items.Add(PChar(sl.Strings[ i ] )+ ' Network drive mappings');
//     end;
// sl.Free;
// end;
//
var
i               : integer;
sNetPath        : string;
dwMaxNetPathLen : DWord;
begin
sl.Clear;
dwMaxNetPathLen := MAX_PATH;
SetLength( sNetPath,dwMaxNetPathLen );
for i := 0 to 25 do
    begin
    if (NO_ERROR = Windows.WNetGetConnection(PChar('' + Chr(65 + i) + ':'),PChar(sNetPath),dwMaxNetPathLen ) )then
       begin
       sl.Add( Chr( 65 + i ) + ': ' + sNetPath );
       end;
    end;
Result := sl.Count;
end;
