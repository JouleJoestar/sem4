{Вычисление суммы ряда}
program V11;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var s,a,m,eps,x:real;
    ms,mss:array [1..1000] of real;
    n,i:integer;
begin
eps:=0.01;
ms[1]:=1/4; n:=1; s:=1/4; mss[1]:=s;
While abs(ms[n-1]-ms[n])>= eps  do
begin
inc(n);
m:=-1/(4*n);
ms[n]:=ms[n-1]*m;
s:=s+ms[n];
mss[n]:=s;
end;
writeln('s = ',s:10:5,'  n = ',n);
readln;
end.

