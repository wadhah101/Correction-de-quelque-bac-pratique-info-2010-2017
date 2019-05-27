program sequence_nulle;

uses 
  wincrt; 
 
type 
   tab = array [1..16] of integer;
 
var 
  t: tab; 
  N:integer; 
  
procedure saisir(var n: integer); 
begin
  repeat 
    write('Donner la taille du tableau :');
    readln(n);
  until n in [3..15]  
end;

procedure remplir(var T:tab; n:integer);
var 
  i: integer; 
begin
  for i := 1 to n do 
   begin
    write('T[',i,']= ');
    readln(T[i]); 
   end;   
end; 

procedure aff_sequence(T: tab; start,finish:integer); 
var 
  i: integer; 
begin
 write('# ');
 for i:= start to finish - 1 do 
  begin
   write(T[i],', ') 
  end;
  writeln(T[finish]); 
end;

function somme(T: tab; start,finish: integer):integer; 
var 
  R, i: integer; 
begin
  R := 0; 
  for i := start to finish do 
   begin 
     R:= R + T[i]; 
   end;  
end; 
procedure afficher (T: tab; n:integer); 
var 
  i, j, c: integer; 

begin
 c := 0; 
 for i := 1 to n do 
  for j := i+1 to n do 
   begin
    if somme(T,i,j) = 0 then 
     c := c + 1;
   end;
writeln(); 
writeln('Le nombre de sequence nulle est ', c);    
 for i := 1 to n do 
  for j := i+1 to n do 
   begin
    if somme(T,i,j) = 0 then 
     aff_sequence(T,i,j);  
   end;
end; 

begin
  saisir(n);
  remplir(t,n);
  afficher(t,n); 
end.