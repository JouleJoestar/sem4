program V23;{$APPTYPE CONSOLE}
uses  SysUtils;

var  i,j,k,b,L,d,n,n1,n2,Nmax :integer;
    Sg,Ss,S,Smax:string;
    Flag:boolean;
begin
  { TODO -oUser -cConsole Main : Insert code here }
n:=5; // кол. слов
n1:=1; n2:=10; // размеры слов
randomize;
sg:='';
L:= random(n2-n1+1)+n1;
k:=0; //счетчик букв в слове
Ss:='';
While k<L do
 begin
 Ss:=Ss+chr(random(26)+65);
 inc(k);
 end;
Sg:=Sg+' '+Ss;// однослово уже есть
i:=1; //счетчик слов
While i<n do
begin
L:= random(n2-n1+1)+n1;
k:=0; //счетчик букв в слове
Ss:='';
 While k<L do
 begin
 Ss:=Ss+chr(random(26)+65);
 inc(k);
 end;
inc(i);
Sg:=Sg+' '+Ss;
end;

while Sg[1]=' ' do delete(Sg,1,1);

S:=Sg+' ';
k:=pos(' ',S);
if k>0 then
begin
Smax:=copy(s,1,k-1); Nmax:=k-1; delete(s,1,k);
end;

for i:=2 to 5 do
begin
k:=pos(' ',S);
if k>0 then
begin
Ss:=copy(s,1,k-1);
if Length(Ss)>Nmax then begin Nmax:=Length(Ss); Smax:=Ss end;
delete(s,1,k);
end;
end;

writeln(Sg);
writeln(Nmax);
writeln(Smax);

readln;
end.

