program V17;
{$APPTYPE CONSOLE}
uses
  SysUtils;

Const N=5;
Type Tmas1=array [1..N] of real;
     Tmas2=array [1..N] of integer;

Function RealToInt(R:real):integer;
var k,I:integer; S,sp: string;
begin
str(R:3:3,S);
k:=pos('.',S);
if k>0 then begin
             sp:=copy(S,1,k-1);
             val(sp,I,k);
             RealToInt:=I;
            end;
end;

Var i,j,kod:integer; s,s1,s2:string;
    M1:Tmas1; M2:Tmas2;
    x,y:integer; r:real;
begin

randomize; // генерация вещественных чисел
for i:=1 to N do
begin
x:=random(1000); y:=random(1000);
str(x,s1);  str(y,s2);
s:=s1+'.'+s2;
val(s,R,kod);
m1[i]:=R;
write(m1[i]:10:3);
end;
writeln;


for i:=1 to N do
begin
m2[i]:=RealToInt(m1[i]);
write(RealToInt(m1[i]):6);
end;




readln;
end.
