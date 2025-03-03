{Сортировка четных строк массива}
program V10;
{$APPTYPE CONSOLE}
uses
  SysUtils;
const N=50;
var m:array  [1..N,1..N] of integer;
i,j,b,d,x,y:integer;


const L = 1;
var dt_start, dt_end: TDatetime;
h1, min1, sec1, ms1: word;
h2, min2, sec2, ms2: word;
loop, diff, diffs: longint;

function fcomp(r:byte;x,y:integer):boolean;
begin
case r of
1: if x>y then fcomp:=true else fcomp:=false;
2: if x<y then fcomp:=true else fcomp:=false;
end;
end;

Begin
randomize;
diffs := 0;

for loop := 1 to L do begin
dt_start := Now;

x:=5;
for i:=1 to N do begin
writeln;
for j:=1 to N do begin
 m[i,j]:=random(10);
 write(m[i,j]:x) end;
end;
writeln; writeln;
for i:=1 to N do
for j:=1 to N do
for d:=1 to N-1 do
 if not odd(i) then
   if fcomp(1,m[i,d],m[i,d+1])then begin  // m[i,d] > m[i,d+1] then begin// 
      b:=m[i,d]; m[i,d]:=m[i,d+1]; m[i,d+1]:=b;
      end;

x:=5;
for i:=1 to N do begin
for j:=1 to N do write(m[i,j]:x);
writeln;
end;

dt_end := Now;

DecodeTime(dt_start, h1, min1, sec1, ms1);
DecodeTime(dt_end, h2, min2, sec2, ms2);
diff := ((((h2-h1) * 60) + (min2 - min1)) * 60 + (sec2-sec1))*1000 + (ms2-ms1);
diffs := diffs + diff;
end;
writeln((diffs / L):0:6, ' ms');
 readln;
       end.













