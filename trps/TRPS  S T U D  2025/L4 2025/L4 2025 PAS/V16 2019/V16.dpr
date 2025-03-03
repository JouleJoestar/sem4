program V16;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const N=2;
Type Tmas=array [1..N,1..N,1..N] of integer;

Procedure MinMax(var M:Tmas; N:integer; var min,max:integer);
var i,j,k:integer;
begin
max:=0;
for i:=1 to N do for j:=1 to N do for k:=1 to N do
if M[i,j,k]>max then max:= M[i,j,k];
min:=20;
for i:=1 to N do for j:=1 to N do for k:=1 to N do
if M[i,j,k]<min then min:= M[i,j,k];

end;

Var      i,j,k,min,max:integer;
    M:Tmas;     x,y:integer; b:boolean;
begin
randomize;
for i:=1 to N do for j:=1 to N do for k:=1 to N do  M[i,j,k]:=random(20);
MinMax(M,N,min,max);

for i:=1 to N do for j:=1 to N do for k:=1 to N do
if (M[i,j,k]=min) and (M[i,j,k]<>max)
    then writeln(i,j,k,' - ',M[i,j,j],' - min')
    else
    if (M[i,j,k]=max) and (M[i,j,k]<>min)then
    writeln(i,j,k,' - ',M[i,j,j],' - max')
    else writeln(i,j,k,' - ',M[i,j,j]);
readln;
end.
