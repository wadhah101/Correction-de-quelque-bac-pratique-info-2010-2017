program russe;

uses 
  wincrt; 

type
  tab = array[1..50] of integer;

var 
  DIVIS, MULT: tab;
  A, B: integer;

procedure saisir (var A, B: integer);
begin
  write('A= '); 
  readln(A);
  write('B= '); 
  readln(B); 
end;

function multirusse(a, b : integer): integer;
var 
  i, p, k: integer;
  T1, T2: tab;
begin 
  i := 0;
  repeat
    i := i + 1;
    T1[i] := a;
    T2[i] := b;
    a := a div 2;
    b := b * 2;
  until  (T1[i] = 1);
  p := 0; 
  for k := 1 to i do 
    if (T1[k] mod 2) = 1 then 
      p := p + T2[k];
  multirusse := p; 
end;


begin 
  saisir(a,b);
  writeln(multirusse(a,b));
end. 