program somme;

uses 
  wincrt; 
var 
  n, i:longword;
  

procedure interval_out(a,b: longword);
var 
  i: longword;
begin
  for i:= a to b-1 do 
    write(i,'+');
  write(b);
    
end;
procedure traitement(n: longword);
var 
  i, j, s: longword;
  bl: boolean;
begin
  bl := false;
  for j:=1 to n-1 do
    begin
      S := 0;
      i := j;
      repeat 
       S := S + i;
       i := i + 1; 
      until (S >= n)  ;
      if (S = n) then
        begin 
         bl := true;
         i := i - 1; 
         write(n,' = ');
         interval_out(j,i);
         writeln();
        end;
    end;
  if not(bl) then 
    writeln( n,' ne peut pas etre ecrit en somme des des autre entier consecutif');
end;

begin
  readln(n);
  traitement(n);
end.