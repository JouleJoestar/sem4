unit Unit1;
{Построение графика случайных чисел}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const Nm=10;
Type
 Txy=record  x,y:integer; end;
Mas=array [0..Nm] of Txy;
var
  Form1: TForm1;
  m:Mas;
  bol:boolean;
  i,j,Mx,My,Xs,Ys,b:integer;
  implementation
{$R *.dfm}
procedure sort;
begin
For j:=0 to Nm do
For i:=0 to Nm-1 do
if m[i].y>m[i+1].y then begin
 b:=m[i].y; m[i].y:= m[i+1].y; m[i+1].y:=b end;
end;



procedure TForm1.Button1Click(Sender: TObject);
begin
With Image1.Canvas do
   begin    pen.width:=2; Pen.Color:=ClBlue;
            rectangle(1,1,Image1.Width,Image1.height);
   end;
//randomize;
For i:=0 to Nm do
begin m[i].x:=i; m[i].y:=random(11)-5; end;

if bol then sort;

 {масштаб и смещение}
Mx:=80; My:=40; Xs:=10; Ys:=Image1.Height div 2;

  {рисуем}
Image1.Canvas.Pen.Color:=ClRed;
Image1.Canvas.Pen.width:=3;
Image1.Canvas.MoveTo(round(m[0].x*Mx+Xs),
                     round(-m[0].y*My+Image1.Height-Ys) );
for i:=1 to Nm do begin
Image1.Canvas.LineTo(round(m[i].x*Mx+Xs),
                     round(-m[i].y*My+Image1.Height-Ys) );
  end;

  {Оси X и У}
With Image1.Canvas do  begin
Pen.width:=2; Pen.Color:=ClGreen;
MoveTo(Xs,Image1.Height div 2);
LineTo(Image1.Width-xs,Image1.Height div 2);

for i:=0 to Nm do begin
MoveTo(round(i*Mx+Xs),Image1.Height div 2+3);
LineTo(round(i*Mx+Xs),Image1.Height div 2-3);
Image1.Canvas.TextOut(i*Mx+Xs,
Image1.Height div 2+10,inttostr(i));

end;


MoveTo(Xs,Xs);
LineTo(Xs,Image1.Height-Xs);

end;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
if bol then begin
Button2.Caption:='Сортировка отключена'; bol:=false; end
else begin Button2.Caption:='Сортировка включена'; bol:=True; end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 With Image1.Canvas do
   begin    pen.width:=2; Pen.Color:=ClBlue;
            rectangle(1,1,Image1.Width,Image1.height);
   end;
end;

end.

