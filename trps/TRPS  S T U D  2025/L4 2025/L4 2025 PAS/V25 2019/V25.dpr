program V25;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const N=7;

Type
Tzap=record
y,m,d:word;
e:string[20];
end;
Ts=array [1..N] of Tzap;

Function Diap(n,k:word):word;
begin
Diap:=random(k-n)+n;
end;

Function st(n:byte):string;
var i,k:integer;s:string;
begin
s:='';
k:=random(n)+1;
for i:=1 to k do s:=s+chr(random(25)+65);
st:=s;
end;

Var i,j:integer; z:Tzap; M:Ts;
begin
randomize;
for i:=1 to N do
begin
M[i].y:=diap(2000,2019);
M[i].m:=diap(1,12);
M[i].d:=diap(1,31);
M[i].e:=st(20);
end;

for i:=1 to N do
writeln(i,'. ',M[i].y:6,M[i].m:5,M[i].d:5,'    ',M[i].e);
writeln;


for i:=1 to N do
for j:=1 to N-1 do
if M[j].y< M[j+1].y then
begin
z:=M[j];M[j]:=M[j+1]; M[j+1]:=z;
end;

for i:=1 to N do
writeln(i,'. ',M[i].y:6,M[i].m:5,M[i].d:5,'    ',M[i].e);


readln;
end.
