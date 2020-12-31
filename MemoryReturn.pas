Function MemoryReturn(Categoria: integer): integer;
//
// Retorna a memoria do sistema
// voce pode usar a tabela abaixo para fazer as devidas modificações
//
var
MemoryStatus: TMemoryStatus;
Retval : Integer;
begin
MemoryStatus.dwLength:= sizeof(MemoryStatus);
GlobalMemoryStatus(MemoryStatus);
if categoria > 8 then
   begin
   Retval := 0;
   end;
case categoria of
     1: Retval := MemoryStatus.dwTotalPhys;     // bytes de memória física
     2: Retval := MemoryStatus.dwLength;        // sizeof(MEMORYSTATUS)
     3: Retval := MemoryStatus.dwMemoryLoad;    // percentual de memória em uso
     4: Retval := MemoryStatus.dwAvailPhys;     // bytes livres de memória física
     5: Retval := MemoryStatus.dwTotalPageFile; // bytes de paginação de arquivo
     6: Retval := MemoryStatus.dwAvailPageFile; // bytes livres de paginação de arquivo
     7: Retval := MemoryStatus.dwTotalVirtual;  // bytes em uso de espaço de endereço
     8: Retval := MemoryStatus.dwAvailVirtual;  // bytes livres
     end;
result := Retval;
end;
