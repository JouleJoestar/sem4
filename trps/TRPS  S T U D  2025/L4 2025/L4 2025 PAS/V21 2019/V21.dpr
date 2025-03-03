{ Вычислить значение интеграла }
program V21;
{$APPTYPE CONSOLE}
uses
  SysUtils;
Type Tf=function(x:real):real;
function f(x:real):real; begin  f:=x+4 end;

Function Integ(a,b:real;F:Tf):real;
var h,x,Sum:real; i:word;
begin
   h:=(b-a)/9;
   x:=a; Sum:=0;
   While x<b do
   begin Sum:=Sum+(f(x)*h); x:=x+h; end;
   Integ:=Sum;
   end;
Var S:real;
begin
Integ(0,1,f,);
writeln('S3= ',Integ(0,1,f):6:1);
writeln;
readLn;
end.

