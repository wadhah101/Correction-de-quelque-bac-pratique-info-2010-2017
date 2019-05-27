program suite; 

uses 
  wincrt; 
  
type 
  tab=array[1..40] of integer;
var 
  T, V: tab;
  o,n: integer;
 function check(n:integer): boolean;
 var 
   i: integer;
   nb: boolean;
 begin
  nb := true;
  if n = 1 then 
    nb := true
  else
    repeat
      Nb := ((n + 1) mod 3 = 0);
      n := (n + 1) div 3;  
    until not(nb) or (n = 1); 
  check := nb;
 end;
 
 function min(T: tab; n: integer): integer; 
 var 
   i, x: integer;
 begin
   x := 1; 
   for i:= 2 to n do 
    begin
      if T[i] <= T[x] then 
        x := i;
    end; 
   min := x;
 end;
 
 function max(T: tab; n: integer): integer; 
 var 
   i, x: integer;
 begin
   x := 1; 
   for i:= 2 to n do 
    begin
      if T[i] >= T[x] then 
        x := i;
    end; 
   max := x;
 end;
 procedure array_out(T: tab; n:integer);
 var 
   i: integer;
 begin 
   for i:= 1 to n-1 do 
    begin 
      write(T[min(t,n)],', ');
      T[min(t,n)] := T[max(t,n)];
    end;
   write(T[1]);
 end;
 
 procedure remplir(var T: tab; n:integer);
 var 
   i: integer;
 begin
   for i := 1 to n do 
    begin
      write('T[',i,']= '); 
      readln(T[i]); 
    end; 
 end;
 
 procedure main(var T1,T2: tab; var n,k: integer);
 var 
   i: integer;
 begin
   for i := 1 to n do 
    begin
      if check(T1[i]) then 
       begin
        k := k + 1; 
        T2[k] := T1[i];
       end;
    end; 
    if k = 0 then 
      writeln ('no ')
    else
     array_out(T2,k); 
 end;  
 
 
 begin
   n := 6;
   remplir(T,n);
   main(t,v,n,o); 
 end.