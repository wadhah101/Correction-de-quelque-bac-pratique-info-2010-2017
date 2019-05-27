program test; 

uses 
  wincrt; 
  
function prime(x:integer): boolean; 
var 
  nb: boolean;
  i: integer; 
begin
  nb := true; 
  i := 2;
  repeat
    nb := not((x mod i) = 0);
    i := i + 1;
  until (i > (x div 2)) or not(nb) ; 
  if x = 1 then 
    nb := false; 
  prime := nb;
end;

procedure main(x:integer); 
var 
  i: integer; 
begin
  for i:= 1 to x-1 do 
   begin
      if prime(i) and prime (x-i) then
        writeln('(',i,',',x-i,')'); 
   end;
end; 

begin
  main(33);
end.
 