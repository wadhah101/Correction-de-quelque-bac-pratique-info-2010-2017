program p;

uses 
  wincrt; 
type 
  tabbool=array[1..20] of boolean;
var 
  x,i: integer;

function prime(ch: string):boolean;
var 
  i, n, e: integer;
  bl: boolean;
begin
  val(ch,n,e);
  bl := true;
  i := 2;
  repeat 
   bl := not(n mod i = 0);
   i := i + 1;
  until  not(bl) or (i > sqrt(n))   
end;

procedure saisir(var n: integer);
begin
  repeat 
    write('X= ');
    readln(x);
  until  (n >= 100) and (n <= 999) 
end;

function circulaire (n: integer): boolean;
var 
  i: integer;
  ch: string;
  a, b, c: char;
  T: tabbool;
  bl: boolean;
begin
  bl := true;
  i := 1;
  str(n,ch);
  a := ch[1];
  b := ch[2];
  c := ch[3];
  T[1] := prime(a+b+c);
  T[2] := prime(a+c+b);
  T[3] := prime(b+a+c);
  T[4] := prime(b+c+a);
  T[5] := prime(c+a+b);
  T[6] := prime(c+b+a);
  T[7] := prime(a+c);
  T[8] := prime(a+b);
  T[9] := prime(b+a);
  T[10] := prime(b+c);
  T[11] := prime(c+a);
  T[12] := prime(c+b);
  repeat 
    bl := T[i];
    i := i + 1;
  until not(bl) or  (i = 12);  
  circulaire := bl; 
end;


begin
 writeln(circulaire(119));
end.