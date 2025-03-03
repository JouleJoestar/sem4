program V22;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const Nm=10000;
Type Ts=array [1..Nm] of integer;

Function Max(var M:Ts; N:integer):integer;
var i,j,mx:integer;
begin
mx:= M[1];
for i:=1 to N do
for j:=1 to N do
    if (M[j]>=mx) then  mx:=M[j];
    Max:=mx;
end;

Var S:real;   mx,i,j,n:integer;
    M:Ts;

begin
n:=10;
randomize;
for i:=1 to N do M[i]:=random(61)-30;

for i:=1 to N do begin
if M[i]=Max(M,mx) then writeln(M[i],'-max');
if M[i]<>Max(M,mx) then writeln(M[i]);

end;

readln;
end.
