program V19;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const N=10;
Type Tmas=array [1..N,1..N] of real;
     Tmasd=array [1..N*N] of real;
Var
   i,j:integer;
   b:real;
   M:Tmas;
   Md:Tmasd absolute M;
begin
randomize;
for i:=1 to N do for j:=1 to N do M[i,j]:=random(30)-20;

for i:=1 to N*N do
for j:=1 to N*N do
if Md[j]>Md[j+1] then
begin b:=Md[j]; Md[j]:=Md[j+1]; Md[j+1]:=b  end;


for i:=1 to N do begin
for j:=1 to N do write(M[i,j]:5:0);
writeln;
end;
    readln;
end.

