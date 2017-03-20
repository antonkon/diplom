unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, ComCtrls, Spin, Math, Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    ListBox1: TListBox;
    Button1: TButton;
    TabSheet2: TTabSheet;
    Image3: TImage;
    Panel2: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Button2: TButton;
    SpinEdit1: TSpinEdit;
    Button11: TButton;
    ColorBox1: TColorBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet3: TTabSheet;
    Image4: TImage;
    Panel4: TPanel;
    Panel3: TPanel;
    Label4: TLabel;
    Button5: TButton;
    SpinEdit4: TSpinEdit;
    Button3: TButton;
    TabSheet4: TTabSheet;
    Image5: TImage;
    Panel5: TPanel;
    Label5: TLabel;
    Button4: TButton;
    Button6: TButton;
    Panel6: TPanel;
    Label6: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Timer1: TTimer;
    ColorBox2: TColorBox;
    Label7: TLabel;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Image7: TImage;
    Panel9: TPanel;
    Panel10: TPanel;
    Label11: TLabel;
    Button9: TButton;
    Panel7: TPanel;
    Label8: TLabel;
    Button7: TButton;
    Panel8: TPanel;
    Image6: TImage;
    SpinEdit6: TSpinEdit;
    SpinEdit5: TSpinEdit;
    TabSheet7: TTabSheet;
    Panel11: TPanel;
    Button8: TButton;
    Image8: TImage;
    Panel12: TPanel;
    Button10: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    TabSheet8: TTabSheet;
    Panel13: TPanel;
    Label9: TLabel;
    Button17: TButton;
    SpinEdit7: TSpinEdit;
    Image9: TImage;
    Panel14: TPanel;
    TabSheet9: TTabSheet;
    Image10: TImage;
    Panel15: TPanel;
    Button18: TButton;
    Panel16: TPanel;
    Button19: TButton;
    TabSheet10: TTabSheet;
    Image11: TImage;
    Panel17: TPanel;
    Label12: TLabel;
    Button20: TButton;
    Panel18: TPanel;
    SpinEdit8: TSpinEdit;
    Button21: TButton;
    Button22: TButton;
    procedure OnTabSheet1(Sender: TObject);
    procedure OnTabSheet2(Sender: TObject);
    procedure OnTabSheet3(Sender: TObject);
    procedure OnTabSheet4(Sender: TObject);
    procedure OnTabSheet5(Sender: TObject);
    procedure OnTabSheet6(Sender: TObject);
    procedure OnTabSheet7(Sender: TObject);
    procedure OnTabSheet8(Sender: TObject);
    procedure OnTabSheet9(Sender: TObject);
    procedure StartPage(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Podrobnee(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TTreePif = record
  Lef,Rit:real;
end;

var
  Form1: TForm1;
  TabSheetKohColor:array [1..3] of TColor = (clBlack,clWhite,clWhite);
  r:integer = -1;
  Image:array [1..10] of TImage;
  Im:Integer = -1;
  zalivka:Boolean = false;
  it:Integer;
  ServiceMas:array [1..7] of integer = (1,1,1,-1,1,250,500);
  MandelBrotMasKord: array [1..5] of real = (-3,2,-1.5,1.5,1);
  ATreePif:TTreePif;
  Time:integer=0;

implementation

uses Unit2;

{$R *.dfm}

Procedure TreePif(x,y,iter:Integer; l,u:real);
begin

  with Image[Im].Canvas do
  begin

  if iter<=0 then
    exit;

	if l>3 then
	begin

		l:=l*0.75;
    MoveTo(x,y);
    LineTo(Round(x + l * cos(u)), Round(y - l * sin(u)));

    dec(iter);

    if iter>0 then
    begin
	  	x:=Round(x+l*cos(u));
	  	y:=Round(y-l*sin(u));

  		TreePif(x,y,iter,l,u+pi/ATreePif.Lef); {Угол поворота 1}
  		TreePif(x,y,iter,l,u-pi/ATreePif.Rit); {Угол поворота 2}
    end;
	end;
  end;
end;

procedure Tree(x,y:Integer;a:Real;l:Integer);
var	x1,y1,p,s,i:Integer; a1:Real;
begin

	if l<8 then
		exit;

  // координаты начала ветки или листа
	x1:=Round(x+l*cos(a));
	y1:=Round(y+l*sin(a));

	if l>100 then
		p:=100
	else p:=l;

	if p<40 then
	begin
	//Генерация листьев
		if Random > 0.5 then
      if im=1 then
        Image[Im].Canvas.Pen.Color:=clBlack
      else Image[Im].Canvas.Pen.Color:=clgreen
		else
      if im=1 then
        Image[Im].Canvas.Pen.Color:=clBlack
      else Image[Im].Canvas.Pen.Color:=rgb(90,139,5);

    for i:=0 to 3 do
     begin
       Image[Im].Canvas.MoveTo(x+i,y);
       Image[Im].Canvas.LineTo(x1,y1);
     end;
  end
	else
	begin
		// Генерация веток
    if im=1 then
      Image[Im].Canvas.Pen.Color:=clBlack
    else Image[Im].Canvas.Pen.Color:=rgb(100,3,4);
		for i:=0 to (p div 6) do
    begin
       Image[Im].Canvas.MoveTo(x + i - (p div 12),y);
       Image[Im].Canvas.LineTo(x1,y1);
    end;
	end;
	// Следующие ветки
 	for i := 0 to 9 - Random(9) do
	begin
		s:= Random(l - l div 6) + (l div 6);
		a1:=a + 1.6 * (0.5 - Random); // Угол наклона веток
		x1:=Round(x+s*cos(a));
		y1:=Round(y+s*sin(a));
		Tree(x1,y1,a1,p-5-Random(30)); // Чем меньше вычетаем, тем пышнее дерево
	end;

end;

Procedure DragonLoman(x1,y1,x2,y2,iter:integer;n:real);
var AC,cx,cy,ug:real;    dx,dy:integer;
begin


  if iter=0 then
  begin
    // рисование отрезка
    Image[Im].Canvas.MoveTo(x1,y1);
    Image[Im].Canvas.LineTo(x2,y2);
  end
  else
  begin
    // координаты середины отрезка
    cx:=(x2+x1)/2;
    cy:=(y2+y1)/2;
    // длинна половины отрезка
    AC:=sqrt(sqr(cx-x1)+sqr(cy-y1));
    // новые координаты
    dx:=round(cx + AC * (cos(n+pi/2)));
    dy:=round(cy + AC * (sin(n+pi/2)));

    ug:=pi/180;

    dec(iter);
      // рекурсия
      DragonLoman(x1,y1,dx,dy,iter,n+45*ug);
      DragonLoman(x2,y2,dx,dy,iter,n+90*ug+45*ug);

  end;
end;

function MandelBrot(a,b:real): TColor;
var x,y,r,t:real;       iter:integer;
begin

{ ****************************************************************
  ServiceMas[7] - кол-во итераций
**************************************************************** }

  x:=0; y:=0; r:=0; iter:=ServiceMas[7];

  while (iter>1)and(r<4) do
  begin
    t:=x;
    x:=x*x-y*y+a;
    y:=2*t*y+b;
    r:=x*x+y*y;
    dec(iter);
  end;

  if r<4 then
  MandelBrot:=clBlack
  else
  if im=1 then
  MandelBrot:=clWhite
  else
  MandelBrot:=rgb(Round(7.843137*iter),Round(7.843137*iter),Round(7.843137*iter));


end;

procedure KohKvdr(x01,y01,x02,y02,iter,i,tip:integer);
var x1,y1,x2,y2,x3,y3,x34,y34,x4,y4,x5,y5,x6,y6:integer;   L,h,sina,cosa:real;
begin
{  Описание переменных :
[х1,y2;x4,y4] - крайние точки основы
i=(-1 или 1) - флаг направления треугольника
iter - порядок кривезны (кол-во итераций)
[x2,y2;x3,y3] - точки 1/3 и 2/3
[x3,y3] - вершина треугольника
L - длинна основания треугольника
h - высота треугольника
sina,cosa - sin и cos угла между основой и левой стороной
tip - тип (1-ый или 2-ой)
}


// рисуем основу
  with Image[Im].Canvas do
  begin
    MoveTo(x01,y01);
    LineTo(x02,y02);
  end;

  if iter<=0 then
  exit;

  if tip=1 then
  begin
    // точка на 1/3 длины
    x1:=Round(x01+(x02-x01)/3);
    y1:=Round(y01+(y02-y01)/3);
    // точка на 2/3 длины
    x4:=Round(x01+2*(x02-x01)/3);
    y4:=Round(y01+2*(y02-y01)/3);
  end
  else
  begin
    // точка на 1/4 длины
    x1:=Round(x01+(x02-x01)/4);
    y1:=Round(y01+(y02-y01)/4);
    // точка на 3/4 длины
    x6:=Round(x01+3*(x02-x01)/4);
    y6:=Round(y01+3*(y02-y01)/4);
  end;

// длина основания
  L:=sqrt(sqr(x1 - x01) + sqr(y1 - y01));

  if L=0 then
    exit;

// углы между основанием и осью ОХ
  sina:=(y1 - y01)/L;
  cosa:=(x1 - x01)/L;

  h:=L;

// вершина
  if tip=1 then
  begin
    x2:=ceil(x1+h*i*sina);
    y2:=ceil(y1-h*i*cosa);

    x3:=ceil(x4+h*i*sina);
    y3:=ceil(y4-h*i*cosa);
  end
  else
  begin
    x2:=Ceil(x1+h*i*sina);
    y2:=Ceil(y1-h*i*cosa);

    x3:=Ceil((x1+x6)/2+h*i*sina);
    y3:=Ceil((y1+y6)/2-h*i*cosa);

    x34:=Ceil((x1+x6)/2);
    y34:=Ceil((y1+y6)/2);

    x4:=Ceil((x1+x6)/2-h*i*sina);
    y4:=Ceil((y1+y6)/2+h*i*cosa);

    x5:=Ceil(x6-h*i*sina);
    y5:=Ceil(y6+h*i*cosa);
  end;

// отрисовка треугольника
  with Image[Im].Canvas do
  begin
    // закрашиваем среднюю треть основы
    Pen.Color:=clWhite;
    Pen.Width:=1;

    if tip=1 then
    begin
      MoveTo(x1,y1);
      LineTo(x4,y4);
      // рисуем стороны треугольника
      Pen.Color:=clBlack;
      Pen.Width:=1;
      MoveTo(x1,y1);
      LineTo(x2,y2);
      LineTo(x3,y3);
      LineTo(x4,y4);
    end
    else
    begin
      MoveTo(x1,y1);
      LineTo(x6,y6);
      // рисуем стороны треугольника
      Pen.Color:=clBlack;
      Pen.Width:=1;
      MoveTo(x1,y1);
      LineTo(x2,y2);
      LineTo(x3,y3);
      LineTo(x4,y4);
      LineTo(x5,y5);
      LineTo(x6,y6);
    end;
  end;

  // рекурсия

// текущий порядок кривй Коха

  dec(iter);

  if iter>0 then
    if tip=1 then
    begin
      KohKvdr(x01,y01,x1,y1,iter,i,tip);
      KohKvdr(x1,y1,x2,y2,iter,i,tip);
      KohKvdr(x2,y2,x3,y3,iter,i,tip);
      KohKvdr(x3,y3,x4,y4,iter,i,tip);
      KohKvdr(x4,y4,x02,y02,iter,i,tip);
    end
    else
    begin
      KohKvdr(x01,y01,x1,y1,iter,i,tip);
      KohKvdr(x1,y1,x2,y2,iter,i,tip);
      KohKvdr(x2,y2,x3,y3,iter,i,tip);
      KohKvdr(x3,y3,x34,y34,iter,i,tip);
      KohKvdr(x34,y34,x4,y4,iter,i,tip);
      KohKvdr(x4,y4,x5,y5,iter,i,tip);
      KohKvdr(x5,y5,x6,y6,iter,i,tip);
      KohKvdr(x6,y6,x02,y02,iter,i,tip);
    end;

end;

procedure Koh(x01,y01,x02,y02,iter,i,pero:integer);
var x1,y1,x2,y2,x3,y3:integer;   L,h,sina,cosa:real;
begin
{  Описание переменных :
[х01,y02;x02,y02] - крайние точки основы
i=(-1 или 1) - флаг направления треугольника
iter - кол-во итераций
pero - толщена пера
[x1,y1;x2,y2] - точки 1/3 и 2/3
[x3,y3] - вершина треугольника
L - длинна основания треугольника
h - высота треугольника
sina,cosa - sin и cos угла между основой и левой стороной
}



// рисуем основу
  with Image[Im].Canvas do
  begin
    Pen.Color:=TabSheetKohColor[1];
    Pen.Width:=pero;
    MoveTo(x01,y01);
    LineTo(x02,y02);
  end;

  if iter<=0 then
  exit;
// точка на 1/3 длины
  x1:=Round(x01+(x02-x01)/3);
  y1:=Round(y01+(y02-y01)/3);
// точка на 2/3 длины
  x2:=Round(x01+2*(x02-x01)/3);
  y2:=Round(y01+2*(y02-y01)/3);
// длина основания
  L:=sqrt(sqr(x1 - x2) + sqr(y1 - y2));

  if L=0 then
    exit;

// углы между основанием и осью ОХ
  sina:=(y2 - y1)/L;
  cosa:=(x2 - x1)/L;

// высота треугольника sqr(b)/4
  h:=sqrt(sqr(L)-sqr(L)/4);

// вершина
  x3:=Round((x1+x2)/2+h*i*sina);
  y3:=Round((y1+y2)/2-h*i*cosa);

// отрисовка треугольника
  with Image[Im].Canvas do
  begin
    // закрашиваем среднюю треть основы
    Pen.Color:=TabSheetKohColor[2];
    Pen.Width:=pero+1;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    // рисуем стороны треугольника
    Pen.Color:=TabSheetKohColor[2];
    Pen.Width:=pero;
    Brush.Color:=TabSheetKohColor[2];
    MoveTo(x1,y1);
    Polygon([Point(x3,y3),Point(x2,y2),Point(x1,y1)]);

    Pen.Width:=pero;
    Pen.Color:=TabSheetKohColor[1];
    MoveTo(x1,y1);
    LineTo(x3,y3);
    LineTo(x2,y2);
  end;

  // рекурсия

// текущий порядок кривй Коха
  dec(iter);

  if iter>0 then
  begin
    Koh(x01,y01,x1,y1,iter,i,pero);
    Koh(x1,y1,x3,y3,iter,i,pero);
    Koh(x3,y3,x2,y2,iter,i,pero);
    Koh(x2,y2,x02,y02,iter,i,pero);
  end;

end;

procedure ServiceTreugSerp(x1,y1,x2,y2,x3,y3,iter,i:integer);
var x12,y12,x23,y23,x31,y31:integer;
begin

  // рисуем основу (треугольник)
  if it=iter then
  begin
    with Image[Im].Canvas do
    begin
      Pen.Color:=Form1.ColorBox1.Selected;
      if zalivka then
        Brush.Color:=Form1.ColorBox1.Selected
      else  Brush.Color:=clWhite;

      if Form1.PageControl1.ActivePageIndex=0 then
      begin
        Pen.Color:=clBlack;
        Brush.Color:=clWhite;
      end;

      MoveTo(x1,y1);
      Polygon([Point(x2,y2),Point(x3,y3),Point(x1,y1)]);
      Brush.Color:=clWhite;
    end;
  end;



  // находим середины сторон
  x12:=Ceil((x1+x2)/2);
  y12:=Ceil((y1+y2)/2);

  x23:=Ceil((x2+x3)/2);
  y23:=Ceil((y2+y3)/2);

  x31:=Ceil((x3+x1)/2);
  y31:=Ceil((y3+y1)/2);

  // рисуем треугольник
  if (iter<=it)and(it<>0) then
  begin
    Image[Im].Canvas.MoveTo(x12,y12);
    Image[Im].Canvas.Polygon([Point(x23,y23),Point(x31,y31),Point(x12,y12)]);
  end;

  dec(iter);

  if iter > 0 then
  begin
    ServiceTreugSerp(x1,y1,x12,y12,x31,y31,iter,i);
    ServiceTreugSerp(x12,y12,x2,y2,x23,y23,iter,i);
    ServiceTreugSerp(x31,y31,x23,y23,x3,y3,iter,i);
  end;

end;

procedure TreugSerp(x1,y1,x3,y3,iter,i:integer);
var x2,y2:integer; cosa,sina,L,h:real;
begin

  // вершина треугольника
  L:=sqrt(sqr(x1 - x3) + sqr(y1 - y3));
  sina:=(y3 - y1)/L;
  cosa:=(x3 - x1)/L;
  h:=sqrt(sqr(L)-sqr(L)/4);

  x2:=Ceil((x1+x3)/2+h*sina*i);
  y2:=Ceil((y1+y3)/2-h*cosa*i);

  it:=iter;

  ServiceTreugSerp(x1,y1,x2,y2,x3,y3,iter,i);

end;

procedure TForm1.OnTabSheet1(Sender: TObject);
begin

{ ****************************************************************
  ServiceMas[1] показывает нажата ли кнопка "перевернуть"
  ServiceMas[5] возврат кнопок заливки в начальное положение
**************************************************************** }

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=1;
    Im:=2;

    BitBtn1.Glyph.Height:=40;
    BitBtn1.Glyph.Width:=40;
    with BitBtn1.Glyph.Canvas do
    begin
      MoveTo(7,29);
      Brush.Color:=clWhite;
      Polygon([Point(19,8),Point(31,29),Point(7,29)]);
    end;

    BitBtn2.Glyph.Height:=40;
    BitBtn2.Glyph.Width:=40;
    with BitBtn2.Glyph.Canvas do
    begin
      Brush.Color:=clGray;
      MoveTo(7,29);
      Polygon([Point(19,8),Point(31,29),Point(7,29)]);
    end;
  end;

  if Sender=BitBtn2 then
  begin
    BitBtn1.Enabled:=true;
    BitBtn2.Enabled:=false;
    zalivka:=true;
  end;
  if (Sender=BitBtn1)or(ServiceMas[5]=1) then
  begin
    BitBtn2.Enabled:=true;
    BitBtn1.Enabled:=false;
    zalivka:=false;
    ServiceMas[5]:=-1;
  end;

  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  if Sender=Button11 then
  begin
    if ServiceMas[1]=1 then
    begin
      ServiceMas[1]:=2;
      TreugSerp(150,20,750,20,Form1.SpinEdit1.Value,-1);
      exit;
    end
    else ServiceMas[1]:=1;
  end;

  if ServiceMas[1]=2 then
    TreugSerp(150,20,750,20,Form1.SpinEdit1.Value,-1)
  else
  TreugSerp(150,530,750,530,Form1.SpinEdit1.Value,1);

end;

procedure TForm1.OnTabSheet2(Sender: TObject);
begin

{ ****************************************************************
  ServiceMas[2] - показывает нажата ли кнопка "цвет"  (1-нет; -1-да)
  ServiceMas[3] - толщена пера
  TabSheetKohColor[1] - цвет пера
  TabSheetKohColor[2] - цвет фона
  TabSheetKohColor[3] - цвет основания треугольника
**************************************************************** }

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=2;
    Im:=3;
  end;

  if Sender=Button3 then
  begin
    if ServiceMas[2]=1 then
    begin
      TabSheetKohColor[1]:=clLime;
      TabSheetKohColor[2]:=clBlack;
      ServiceMas[3]:=2;

      Image[Im].Canvas.Brush.Color:=TabSheetKohColor[2];
      Image[Im].Canvas.FillRect(ClientRect);

      Koh(20,390,880,390,SpinEdit4.Value,1,ServiceMas[3]);
      ServiceMas[2]:=-1;

      exit;
    end
    else
    begin
      TabSheetKohColor[1]:=clBlack;
      TabSheetKohColor[2]:=clWhite;
      ServiceMas[3]:=1;

      Image[Im].Canvas.Brush.Color:=TabSheetKohColor[2];
      Image[Im].Canvas.FillRect(ClientRect);

      Koh(20,390,880,390,SpinEdit4.Value,1,ServiceMas[3]);
      ServiceMas[2]:=1;

      exit;
    end;
  end;

  Image[Im].Canvas.Brush.Color:=TabSheetKohColor[2];
  Image[Im].Canvas.FillRect(ClientRect);

  Koh(20,390,880,390,SpinEdit4.Value,1,ServiceMas[3]);

end;

procedure TForm1.OnTabSheet3(Sender: TObject);
var x0,y0,x1,y1,r,i,x0p,y0p,x1p,y1p,x2p,y2p:integer;     ugol,ug:real;
begin

{ ****************************************************************
  ServiceMas[4] - показывает нажата ли кнопка "инвертировать" (-1-нет; 1-да)
  ServiceMas[6] - радиус окр
**************************************************************** }

  if (ServiceMas[6]=150)and(SpinEdit3.Value<3) then
  exit;

  // занесение нужного TabSheet-та и Image-а
  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=3;
    Im:=4;
  end;

  if Sender=ColorBox2 then
    TabSheetKohColor[2]:=ColorBox2.Selected;


  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  // реализация многогранников
  // выполница при кол-во углов больше 2,
  // или кол-во углов больше 2 и по нажатию кнопки "инвертировать"
  if (SpinEdit3.Value>2)or((SpinEdit3.Value>2)and(Sender=Button6)) then
  begin

    // обработка кнопки инверсии
    if Sender=Button6 then
      if ServiceMas[4]=-1 then
        ServiceMas[4]:=1
      else ServiceMas[4]:=-1;

    // угол(точка) начала отчёта
    ugol:=-pi/2;

    // центр Image-а (круга)
    x0:=Round(Image[Im].Width/2+ServiceMas[6]*cos(ugol));
    y0:=Round(Image[Im].Height/2+ServiceMas[6]*sin(ugol));

    // нулевые точки полигонов
    x0p:=x0;
    y0p:=y0;

    // угол - определяется кол-во углов многоугольника
    ug:=2*pi/SpinEdit3.Value;

    // закрашивание всей области многоугольника треугольниками
    for i:=1 to SpinEdit3.Value do
    begin
       {O(450;275) R=250}
      ugol:=ugol-ug;

      // точка на окр.
      x1:=Round(Image[Im].Width/2+ServiceMas[6]*cos(ugol));
      y1:=Round(Image[Im].Height/2+ServiceMas[6]*sin(ugol));

      // закрашивание треугольника
      if i>1 then
      begin
        x1p:=x0;
        y1p:=y0;
        x2p:=x1;
        y2p:=y1;
        Image[Im].Canvas.Brush.Color:=TabSheetKohColor[2];
        Image[Im].Canvas.Pen.Color:=TabSheetKohColor[2];
        Image[Im].Canvas.Polygon([Point(x0p+1,y0p+1),Point(x1p,y1p),Point(x2p,y2p)]);
      end;

      x0:=x1;
      y0:=y1;
    end;

    ug:=2*pi/SpinEdit3.Value;
    x0:=Round(Image[Im].Width/2+ServiceMas[6]*cos(ugol));
    y0:=Round(Image[Im].Height/2+ServiceMas[6]*sin(ugol));
    ugol:=-pi/2;

    // расчёт точек на окружности и рисование
    for i:=1 to SpinEdit3.Value do
    begin
       {O(450;275) R=250}
      ugol:=ugol-ug;

      // точка на окр.
      x1:=Round(Image[Im].Width/2+ServiceMas[6]*cos(ugol));
      y1:=Round(Image[Im].Height/2+ServiceMas[6]*sin(ugol));

      // рисование на сторонах кривой Коха
      Image[Im].Canvas.Pen.Color:=clBlack;
      if ServiceMas[4]=1 then
      begin
        TabSheetKohColor[2]:=clWhite;
        Koh(x0,y0,x1,y1,SpinEdit2.Value,ServiceMas[4],1);
        TabSheetKohColor[2]:=ColorBox2.Selected;
      end
      else
        Koh(x0,y0,x1,y1,SpinEdit2.Value,ServiceMas[4],1);

      x0:=x1;
      y0:=y1;

    end;
    exit;
  end;

  // кривая Кох в оба направления
  if SpinEdit3.Value<3 then
  begin
    Koh(50,275,850,275,SpinEdit2.Value,1,1);
    Koh(50,275,850,275,SpinEdit2.Value,-1,1);
  end;

end;

procedure TForm1.OnTabSheet4(Sender: TObject);
begin

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=4;
    Im:=5;
  end;

  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  KohKvdr(20,500,880,500,SpinEdit5.Value,1,1);
end;

procedure TForm1.OnTabSheet5(Sender: TObject);
begin

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=5;
    Im:=6;
  end;

  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  KohKvdr(50,275,850,275,SpinEdit6.Value,1,2);
end;

procedure TForm1.OnTabSheet6(Sender: TObject);
const k=1.5;
var i,j:integer;  xmin,xmax,ymin,ymax,x,y,dX,dY:real;
begin

{ ****************************************************************
  MandelBrotMasKord - координаты в которых расположено множество (окно) (xmin,xmax,ymin,ymax,ksdvig)(-3,2,-1.5,1.5,1)
**************************************************************** }

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=6;
    Im:=7;
  end;

  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  if Sender=Button10 then
  begin

    for i:=1 to 4 do
      MandelBrotMasKord[i]:=MandelBrotMasKord[i]/k;
      MandelBrotMasKord[5]:=MandelBrotMasKord[5]/k
  end;

  if Sender=Button12 then
  begin

    for i:=1 to 4 do
      MandelBrotMasKord[i]:=MandelBrotMasKord[i]*k;
      MandelBrotMasKord[5]:=MandelBrotMasKord[5]*k
  end;

  if Sender=Button13 then
  begin
    MandelBrotMasKord[4]:=MandelBrotMasKord[4]-0.5*MandelBrotMasKord[5];
    MandelBrotMasKord[3]:=MandelBrotMasKord[3]-0.5*MandelBrotMasKord[5];
  end;
  if Sender=Button14 then
  begin
    MandelBrotMasKord[4]:=MandelBrotMasKord[4]+0.5*MandelBrotMasKord[5];
    MandelBrotMasKord[3]:=MandelBrotMasKord[3]+0.5*MandelBrotMasKord[5];
  end;
  if Sender=Button15 then
  begin
    MandelBrotMasKord[2]:=MandelBrotMasKord[2]-0.5*MandelBrotMasKord[5];
    MandelBrotMasKord[1]:=MandelBrotMasKord[1]-0.5*MandelBrotMasKord[5];
  end;
  if Sender=Button16 then
  begin
    MandelBrotMasKord[2]:=MandelBrotMasKord[2]+0.5*MandelBrotMasKord[5];
    MandelBrotMasKord[1]:=MandelBrotMasKord[1]+0.5*MandelBrotMasKord[5];
  end;


  dx:=(MandelBrotMasKord[2]-MandelBrotMasKord[1])/Image[im].Width;
  dy:=(MandelBrotMasKord[4]-MandelBrotMasKord[3])/Image[im].Height;

  y:=MandelBrotMasKord[3];

  for j:=0 to Image[im].Height do
  begin
    x:=MandelBrotMasKord[1];

    for i:=0 to Image[im].Width do
    begin
      Image[im].Canvas.Pixels[i,j]:=MandelBrot(x,y);
      x:=x+dx;
    end;
    y:=y+dy;
  end;

end;

procedure TForm1.OnTabSheet7(Sender: TObject);
begin

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=7;
    Im:=8;
  end;

  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  DragonLoman(200,200,700,200,SpinEdit7.Value,0);
end;

procedure TForm1.OnTabSheet8(Sender: TObject);
begin

  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=8;
    Im:=9;
  end;

  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  Tree(450,540,3*pi/2,250);
end;

procedure TForm1.OnTabSheet9(Sender: TObject);
begin
  if Sender=Button1 then
  begin
    Form1.PageControl1.ActivePageIndex:=9;
    Im:=10;
  end;

  // очистка Image-а
  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  if Sender=Button22 then
  begin
    ATreePif.Lef:=ATreePif.Lef+0.3;
    ATreePif.Rit:=ATreePif.Rit-0.3;
  end;

  if Sender=Button21 then
  begin
    ATreePif.Rit:=ATreePif.Rit+0.3;
    ATreePif.Lef:=ATreePif.Lef-0.3;
  end;


  TreePif(450,540,SpinEdit8.Value,190,pi/2);
end;

procedure TForm1.StartPage(Sender: TObject);
begin

  Im:=1;

  Height:=496;
  Width:=713;
  PageControl1.Height:=478;
  PageControl1.Width:=721;

  Image[Im].Canvas.Brush.Color:=clWhite;
  Image[Im].Canvas.FillRect(ClientRect);

  Form1.PageControl1.ActivePageIndex:=0;

  if ListBox1.ItemIndex>-1 then
    begin
      r:=-1;
      ListBox1Click(Sender);
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 inc(Time);
 Form2.ProgressBar1.Position:=Time;

 if Time = 300 then
 begin
   Form2.Close;
   Timer1.Enabled :=False;
 end;
end;

procedure TForm1.Podrobnee(Sender: TObject);
begin

  if ListBox1.ItemIndex>-1 then
  begin
    Height:=616;
    Width:=1038;
    PageControl1.Height:=598;
    PageControl1.Width:=1040;

    case ListBox1.ItemIndex of
      0:begin
          ServiceMas[1]:=1;
          ServiceMas[5]:=1;
          ColorBox1.Selected:=clBlue;
          SpinEdit1.Value:=0;
          OnTabSheet1(Sender);
        end;
      1:begin
          ServiceMas[2]:=1;
          SpinEdit4.Value:=0;
          OnTabSheet2(Sender);
        end;
      2:begin
          SpinEdit2.Value:=0;
          SpinEdit3.Value:=2;
          ServiceMas[4]:=-1;
          ColorBox2.Selected:=clAqua;
          TabSheetKohColor[2]:=ColorBox2.Selected;
          SpinEdit2.Value:=0;
          OnTabSheet3(Sender);
        end;
      3:begin
          SpinEdit5.Value:=0;
          OnTabSheet4(Sender);
        end;
      4:begin
          SpinEdit6.Value:=0;
          OnTabSheet5(Sender);
        end;
      5:begin
          SpinEdit7.Value:=0;
          OnTabSheet7(Sender);
        end;
      6:begin
          MandelBrotMasKord[1]:=-3;
          MandelBrotMasKord[2]:=2;
          MandelBrotMasKord[3]:=-1.5;
          MandelBrotMasKord[4]:=1.5;
          MandelBrotMasKord[5]:=1;
          OnTabSheet6(Sender);
        end;
      7:begin
           SpinEdit8.Value:=0;
           ATreePif.Rit:=4;
           ATreePif.Lef:=4;
           OnTabSheet9(Sender);
        end;
      8:OnTabSheet8(Sender);


    end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Image[1]:=Image1;
  Image[2]:=Image3;
  Image[3]:=Image4;
  Image[4]:=Image5;
  Image[5]:=Image6;
  Image[6]:=Image7;
  Image[7]:=Image8;
  Image[8]:=Image9;
  Image[9]:=Image10;
  Image[10]:=Image11;

  ATreePif.Lef:=4;
  ATreePif.Rit:=4;

  StartPage(Sender);

  Form1.left:=-1000;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var i:integer;
begin
i:=ListBox1.ItemIndex;

if r<>i then
begin

  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(ClientRect);

  case i of
    0:TreugSerp(45,190,255,190,3,1);
    1:begin
        TabSheetKohColor[1]:=clBlack;
        TabSheetKohColor[2]:=clWhite;
        ServiceMas[3]:=1;
        Koh(20,140,280,140,3,1,1);
      end;
    2:begin
        ServiceMas[4]:=-1;
        TabSheetKohColor[2]:=clWhite;
        ServiceMas[6]:=90;
        SpinEdit2.Value:=3;
        SpinEdit3.Value:=3;
        OnTabSheet3(Sender);
        ServiceMas[6]:=250;
      end;
    3:KohKvdr(20,170,280,170,4,1,1);
    4:KohKvdr(20,100,280,100,3,1,2);
    5:DragonLoman(90,70,230,70,10,0);
    6:begin
        MandelBrotMasKord[1]:=-3;
        MandelBrotMasKord[2]:=2;
        MandelBrotMasKord[3]:=-1.5;
        MandelBrotMasKord[4]:=1.5;
        MandelBrotMasKord[5]:=1;
        OnTabSheet6(Sender);
      end;
     7:begin
         ATreePif.Rit:=4;
         ATreePif.Lef:=4;
         TreePif(150,190,10,70,pi/2);
       end;
     8:Tree(150,195,3*pi/2,50);
  end;
end;

r:=i;
end;

end.
