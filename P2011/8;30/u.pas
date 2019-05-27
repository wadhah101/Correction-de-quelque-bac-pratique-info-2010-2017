program inse;

uses 
  wincrt;

type 
  tab=array[1..50] of integer;

var 
  t: tab;
  n,k: integer;

procedure remplir(var t: tab; n: integer);
var 
  i: integer;
begin
  for i := 1 to n do 
   readln(T[i]); 
end;

procedure inser(Var t: tab; n,k: integer);
var 
  i: integer;
begin 
  i := n+1;
  repeat 
    i := i - 1;
    if k > T[i] then 
      T[i + 1] := k 
    else 
      T[i + 1] := T[i];   
  until (k > T[i]) or (i = 0);
end;

procedure affiche (t: tab; n: integer);
var 
  i: integer;
begin
  for i := 1 to n do 
    writeln(T[i]); 
end;

begin 
  write('N= ');
  readln(n);
  writeln('---');
  remplir(t,n);
  writeln('K= ');
  readln(k);
  inser(t,n,k);
  affiche(t,n+1);
end.