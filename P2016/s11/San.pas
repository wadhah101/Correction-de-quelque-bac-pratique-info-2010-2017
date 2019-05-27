program prodDiv;

uses 
  wincrt; 
  
var 
  a, b: integer;
 
function check(x :integer): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  for i := 2 to x do 
    if ((x mod i)=0) and (((x div i) mod i) = 0 ) then 
      bl := false; 
  check := bl;      
end;

procedure affiche(a,b: integer);
var 
  i: integer;
begin 
  for i:= a to b do 
   if check(i) then 
    writeln(i);
end;

  
begin 
 affiche(a,b);
end. 