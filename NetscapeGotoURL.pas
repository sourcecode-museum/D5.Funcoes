procedure NetscapeGotoURL( sURL : string );
//
// Executa uma Url a partir do Netscape mesmo que ele não seje o Browser
// padrão
//
// ex: NetscapeGotoURL('http://www.ChamisPlace.com/' );
//
// requer a unit DDEman na clausula Uses
//
var
dde : TDDEClientConv;
begin
dde   := TDDEClientConv.Create( nil );
with dde do
     begin
     ServiceApplication :='C:\Arquivos de Programas\Netscape\Communicator\Program\netscape.exe';
     SetLink( 'Netscape', 'WWW_Activate' );
     RequestData('0xFFFFFFFF');
     SetLink( 'Netscape', 'WWW_OpenURL' );
     RequestData(sURL+',,0xFFFFFFFF,0x3,,,' );
     CloseLink;
     end;
dde.Free;
end;
