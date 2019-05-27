program occ_pair;

uses 
  wincrt; 

type 
  tab=array[1..20] of integer;
  
var
  T: tab;
  n: integer;
  
procedure saisir(var n: integer);
begin 
  repeat
    write('N= '); 
    readln(n);
  until n in [3..20]; 

end;

procedure remplir(var t: tab; n:integer);
var 
  i: integer;
begin
   for i := 1 to n do 
     begin
       write('T[', i, ']= ');
       readln(T[i]); 
     end;
end;

function pair(n: integer): boolean;
begin 
  pair := ((n mod 2) = 0);
end;

procedure afficher(t: tab; n: integer); 
var 
  i, j, k, s: integer;
begin 
  k := 0;
  j := 0;
  for i := 1 to n do 
   begin 
    if pair (T[i])  then 
      begin
       j := j + 1; 
      end
     else 
       j := 0;
    if  j = 2 then 
      k := k + 1;    
   end;
   writeln;
   writeln('Le nombre de sequence pair est ',k);
   writeln;
   { l'affichage }
   if not(k = 0) then 
   begin
     writeln('les sequence d"entier pair sont: ');
   i := 0;
   repeat
     i := i + 1; 
     if pair(T[i]) and pair(T[i+1]) then 
       while pair(T[i]) and (i <= n)  do
         begin 
           write (T[i]);
           if pair(T[i + 1]) and not(i = n)  then 
             write (',');
           i := i + 1;
         end;
         writeln;
   until (i > n);  
   end;
end;



begin 
  saisir(n);
  remplir(T,n);
  afficher(T,n);  
end. 