program UnitParf;

uses 
  wincrt;
  
var 
 a, b: longword;
 
procedure saisir(var a,b: longword);
begin
 repeat 
   write('a= '); 
   read(a);
   write('b= ');
   readln(b);
 until (2 <= a) and (a < b) and (b <= 100)
end;

function Test_Pr(p,k: longword): boolean;
var 
  i: longword;
  bl: boolean;
begin 
  while(p <> k) do 
    if (p > k) Then 
     p := p - k
    else 
     k := k - p;
    Test_Pr := (P = 1); 
end;

function check(x :longword): boolean;
var 
  i: longword;
  k : longword;
begin
  k:= 0;
  for i:= 1 to (x div 2) do
   if (x mod i = 0) and Test_pr(i, (x div i))  then  
     k := k + i; 
  check := (k = x); 
end;

procedure afficher(a,b: longword);
var
i: word;
begin 
  for i:= a to b do 
    if check(i) then 
      write(i,',')
end;    

begin 
  saisir(a,b);
  afficher(a,b);
end.