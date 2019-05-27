program majo; 

uses 
  wincrt; 
 
type 
  tab= array [1..25] of integer;
  tabb= array[1..25] of boolean;
var 
  T: tab;
  n: integer;
 
procedure saisir(var n: integer);
begin
  readln(n); 
end;

procedure remplir(Var t: tab; n: integer);
var 
  i: integer;
begin
  for i:= 1 to n do 
    begin
      write('T[',i,']= ');
      readln(T[i]); 
    end; 
end;

procedure affiche(t: tab; n:integer); 
var 
  Bt: Tabb;
  i:integer; 
  k, occ1, occ2, j: integer;

begin
  k := 1;
  occ1 := 0;
  occ2 := 0;
  for i := 1 to n do   
    if T[k] = T[i]  then 
      begin
        occ1 := occ1 + 1; 
      end;
  for j := 2 to n do 
  begin
   occ2 := 0;
    for i := 2 to n do 
     begin 
      if (T[i] = T[j]) then 
       begin
         occ2 := occ2 + 1; 
       end; 
      if occ2 > occ1 then 
        begin 
          k := j;
          occ1 := occ2; 
        end;  
     end;
   end;
    writeln('- L entier ',T[k],' possede le plus grand nombre d apparation egale a ', occ1);
    writeln('- le nombre d element autre, ',T[k], ' restant dans le tableau est egal a ', n - occ1);
  end;


 
 begin
   saisir(n);
   remplir(t,n);
   affiche(t,n);
 end.