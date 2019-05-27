program Harshad; 

uses 
  wincrt; 
  
var 
  n, m, i: integer;

function somme(x:integer): integer;
var 
  i ,k ,v ,e: integer;
  ch: string; 
begin 
  str(x, ch);
  k := 0;
  for i := 1 to length(ch) do 
   begin
     val(ch[i],v,e);
     K := K + v;   
   end;
   somme := k;
end;

function harsh(x:integer): boolean;
begin
  harsh := ((X mod somme(x)) = 0 ) 
end;

function prime(x:integer): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  i := 2;
  repeat 
     bl := not((x mod i) = 0);
     i := i + 1; 
  until (bl = false) or (i = trunc(sqrt(x)));
  prime := bl;
end;


begin 
  for i := 100 to 150 do 
  begin
    if (harsh(i) and prime(i-1)) then  
      writeln(i);
  end;
end.