program besoin;

uses
  wincrt;

type 
  StArray=array[1..250] of string;
  IntArray=array[1..250] of integer;
  
var 
  TE, TB: StArray;
  TBU: Intarray;
  n: integer;
  
const
  P1 = 80;
  P2 = 160;
  
procedure saisir(var n: integer);
begin
  repeat 
    write('N= ');
    readln(n);
  until (n >= 2)  and (250 >= n) 
end;

function check(ch: string): boolean;
var 
  bl: boolean;
  i: integer;
begin
  bl := true; 
  i := 0;
  repeat 
    i := i + 1;
    bl := ch[i] in ['0'..'9'];
  until not(bl) or (i = length(ch));
  check := bl;
end;
procedure add_1(var ch: string; i: integer);

begin 
  repeat 
    write('TE[',i,']=');
    readln(ch);
  until (length(ch) = 6) and check(ch) ; 
end;

procedure add_2(var ch: string; i: integer);
var 
  x, y, p, e1, e2:integer;
begin 
  repeat
    write('TB[',i,']=');
    readln(ch);
    p := pos('#',ch);
    if not(p = 0) then 
    begin 
      val(copy(ch,1,p-1),x,e1);
      val(copy(ch,p+1,length(ch)),y,e2);  
    end; 
    if  (x > 999) OR   (Y > 999) then
      p := 0; 
  until (p <> 0) and (e1 = 0) and (e2 = 0)
end;

procedure remplir(var TE, TB: StArray; n: integer);
var 
  i: integer;
begin 
 for i := 1 to n do 
   begin  
     add_1(TE[i],i);
     add_2(TB[i],i);
   end;
end;

procedure generer(TB: StArray; var TBU: intArray; n: integer);
var 
  i, p, x, y, e1, e2: longint;
begin 
  for i := 1 to n do 
    begin
      p := pos('#',TB[i]);
      val(copy(TB[i],1,p-1),x,e1);
      val(copy(TB[i],p + 1,length(TB[i])),y,e2);  
      TBU[i] := x*P1 + y*P2;
    end;
end;


procedure afficher(TE: StArray; var TBU: intArray; n: integer);
var 
  i, d: integer;
begin 
  d := 1; 
  for i := 2 to n do 
    if TBU[d] < TBU[i] then 
      d := i;
  write('Le besoin budgétaire le plus élevé est ',TBU[d],' D et les écoles concernées sont : ', TE[d]);
  for i := 1 to n do 
    if (TBU[d] = TBU[i]) and (i <> d) then 
     write('  -  ',TE[i]);
end;

begin
  saisir(n);
  remplir(TE, TB, n);
  generer(TB, TBU, n);
  afficher(TE, TBU, n); 
end.