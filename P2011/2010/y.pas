program  heureux;

uses 
  wincrt;

var 
  n: integer;
  
procedure saisir(var n: integer);
begin
  repeat
    readln(n); 
  until n > 0;
end;

function log(n: integer): real;
begin
  log := ln(n)/ln(10); 
end;

function power(n,k: integer): integer;
begin
  power := trunc(exp(k*ln(n))); 
end;

function lengthi(n: integer): integer;
var 
  i: integer;
begin
  lengthi := 1; 
  while n div 10 <> 0 do 
    begin
      lengthi := lengthi + 1;
      n := n div 10; 
    end;
end;

function sommesqr(n: integer): integer;
var 
  i: integer;
begin
  sommesqr := 0;
  for i := 1 to lengthi(n) do 
    sommesqr := sommesqr +  sqr((n div power(10,i-1)) mod 10)
end;

function heureux(n :integer):boolean;
begin
  repeat 
     writeln(n);
    n := sommesqr(n);
  until n div 10 = 0; 
  heureux := n = 1;
 
end;
begin 
 // saisir(n);
  write(heureux(7));
end.