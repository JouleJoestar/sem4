program V20;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const N=10;
Type
     Td=array [1..N] of char;
     Tm=array [1..N] of byte;
Var
   i,j:integer;
   b:char;
   bb:byte;
   M:Tm;
   Md:Td;
   S:set of byte;
begin
s:=[65..90];
randomize;
for i:=1 to N do
begin Md[i]:=chr(random(24)+65); write(Md[i]:4);end;
writeln;

for i:=1 to N do M[i]:=ord(Md[i]);

for i:=1 to N do
for j:=1 to N do
if (M[j]>M[j+1]) and (M[j] in s)  then
begin bb:=M[j]; M[j]:=M[j+1]; M[j+1]:=bb  end;


for i:=1 to N do Md[i]:=chr(M[i]);

 //вывод отсортированного массива символов
for i:=1 to N do write(Md[i]:4);
writeln;


readln;
end.

