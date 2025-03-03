program V15;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type  ts=^tn; tn=record x:real; p:ts;  end;
var s,b:ts; f:pointer;
    i,n:integer; z:real;
Function Frandom(a,b:integer):integer;// a и b диапазон чисел
begin
if (a<0) and (b<0) then Frandom:=random ((abs(b-a)+1)-abs(a));
if (a<0) and (b>=0) then Frandom:=random ((abs(a-b)+1)-abs(a));
if (a>=0) and (b>0) then Frandom:=random ((abs(b-a)+1)+a);
end;

procedure OutList(p:pointer;n,k:integer); //  с какого -n  и сколько -k
var w:ts; a:integer;
begin
w:=p; a:=0;
while w<>nil do
begin
inc(a);
if (a>=n) and (a<=k) then write(w^.x:5:0);
w:=w^.p;
end;
end;

begin
 n:=10;
         {Сосдание списка}
  new(s); randomize; s^.x:=Frandom(-10,10);
  f:=s; s^.p:=nil;

  for i:=1 to n-1 do begin new(b); z:=Frandom(-10,10);  b^.x:=z;
                         s^.p:=b; s:=b; end;
  s^.p:=nil;

Writeln('Вывод списка: ');
for i:=1 to n do OutList(f,i,i);
writeln;
readln;
end.

