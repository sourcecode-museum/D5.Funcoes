procedure TableCopiReg(Origem, Destino: Ttable);
//
// Copia todos os registros de uma tabela para outra
//
var
i:integer;
begin
with Origem do
     begin
     for i := 0 to FieldCount -1 do
         begin
         if not Fields[i].IsNull then
            begin
            With Destino do
                 begin
                 Edit;
                 Fields[i].Assign(Fields[i]);
                 Post;
                 end;
            end;
         end;
     end;
end;
