program V24;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const Nm=7;
Type Ts=array [1..Nm,1..Nm] of integer;

Function Diag(i,j:integer):boolean;
begin
Diag:=false;
if i=j  then Diag:=true ;
end;

Var Sum:real; i,j:integer;
    M:Ts;
begin
randomize;
for i:=1 to Nm do
for j:=1 to Nm do M[i,j]:=random(90)+10;

for i:=1 to Nm do begin
for j:=1 to Nm do write(M[i,j]:5);
writeln;
end;

Sum:=0;
for i:=1 to Nm do
for j:=1 to Nm do
if Diag(i,j) then Sum:=Sum+M[i,j];

writeln('Sum = ',Sum:6:0);

readln;
end.
