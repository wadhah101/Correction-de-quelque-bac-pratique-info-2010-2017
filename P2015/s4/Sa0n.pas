program test;
uses wincrt; 

function pgcd(a, b: integer): integer;
var
  i, r: integer;
begin
  r := 1;
  for i := 2 to a+b  do
    while ((a mod i) = 0) and ((b mod i) = 0) do
    begin
      r := r * i;
      a := a div i;
      b := b div i;
    end;
  pgcd := r;
end;

begin
  writeln(pgcd(10, 5));

end.