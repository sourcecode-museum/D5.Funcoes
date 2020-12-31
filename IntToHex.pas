function IntToHex(Num: Word): String;
//Converte um numero em Hexadecimal
Var
L : string[16];
BHi,BLo : byte;
Begin
L := '0123456789ABCDEF';
BHi := Hi(n);
BLo := Lo(n);
result := copy(L,succ(BHi shr 4),1) +
          copy(L,succ(BHi and 15),1) +
          copy(L,succ(BLo shr 4),1) +
          copy(L,succ(BLo and 15),1);
end;
