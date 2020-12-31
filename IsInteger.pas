function IsInteger(TestaString: String) : boolean;
begin
try
  StrToInt(TestaString);
except
  On EConvertError do
     result := False;
  else
     result := True;
  end;
end; 
