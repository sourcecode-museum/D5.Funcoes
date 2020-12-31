{*******************************************************}
{                                                       }
{      Delphi Runtime Library                           }
{      Windows Messages and Types                       }
{                                                       }
{      Copyright (c) 1991,96 Walter Alves Chagas Junior }
{                                                       }
{*******************************************************}

unit Inifile;

interface
uses
Windows, Dialogs, Messages, SysUtils, Classes, Controls, StdCtrls, Graphics,
Inifiles;

function LeIni(Inifile:String;Secao:String;Chave:String):String;
procedure CriaIni(Inifile:String);
procedure GravaIni(Inifile:String;Secao:String;Chave:String;valor:String);

implementation


procedure CriaIni(Inifile:String);
var
Ini: TIniFile;
begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
    Ini.WriteString('Section','Path',GetCurrentDir);
    Ini.WriteString('Section','Data',GetCurrentDir +'\Data');
    Ini.WriteString('Section','Sounds',GetCurrentDir+'\Sons');
  finally
    Ini.Free;
  end;
end;


procedure GravaIni(Inifile:String;Secao:String;Chave:String;valor:String);
var
Ini: TIniFile;
begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
    Ini.WriteString(Secao,chave,valor);
  finally
    Ini.Free;
  end;
end;


Function LeIni(Inifile:String;Secao:String;Chave:String):String;
var
Ini: TIniFile;
Begin
  Ini := TInifile.Create(GetCurrentDir+'\'+Inifile+'.ini');
  try
    Result := Ini.ReadString(Secao,chave,'');
  finally
    Ini.Free
  end;
end;

end.
 