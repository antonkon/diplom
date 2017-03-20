unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Math, StdCtrls, Spin, ExtCtrls;

type
  TFrame1 = class(TFrame)
    Image1: TImage;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TreugSerp(x1,y1,x2,y2,x3,y3,iter:integer);
var x12,y12,x23,y23,x31,y31:integer;
begin

  // точка треугольника

  // рисуем треугольник
  with TFrame1.Image1.Canvas do
  begin
    MoveTo(x1,y1);
    LineTo(x2,y2);
    LineTo(x3,y3);
    LineTo(x1,y1);
  end;

  // находим середины сторон
  x12:=Ceil((x1+x2)/2);
  y12:=Ceil((y1+y2)/2);

  x23:=Ceil((x2+x3)/2);
  y23:=Ceil((y2+y3)/2);

  x31:=Ceil((x3+x1)/2);
  y31:=Ceil((y3+y1)/2);

  with TFrame1.Image1.Canvas do
  begin
    MoveTo(x12,y12);
    LineTo(x23,y23);
    LineTo(x31,y31);
    LineTo(x12,y12);
  end;

  iter:=iter-1;

  if iter > 0 then
  begin
    TreugSerp(x1,y1,x12,y12,x31,y31,iter);
    TreugSerp(x12,y12,x2,y2,x23,y23,iter);
    TreugSerp(x31,y31,x23,y23,x3,y3,iter);
  end;

end;

procedure TFrame1.Button1Click(Sender: TObject);
var x1,y1,x2,y2,x3,y3:integer;      cosa,sina,L,h:real;
begin
 x1:=250;
 y1:=500;
 x3:=650;
 y3:=500;

 L:=sqrt(sqr(x1 - x3) + sqr(y1 - y3));
 sina:=(y3 - y1)/L;
 cosa:=(x3 - x1)/L;
 h:=sqrt(sqr(L)-sqr(L)/4);

 x2:=Ceil((x1+x3)/2+h*sina);
 y2:=Ceil((y1+y3)/2-h*cosa);


 TreugSerp(x1,y1,x2,y2,x3,y3,SpinEdit1.Value);
end;

end.
