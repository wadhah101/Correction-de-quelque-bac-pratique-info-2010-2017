program di;

uses
  wincrt;
 
var 
  n: integer;

function div7(n :integer): boolean;
var 
  i: integer;
begin
  repeat 
    i := n mod 10 ; 
    n := n div 10;
    n := abs(n- 2*i);
  until n div 10 = 0 ;
  div7 := n mod 7 = 0;
end;

begin
  readln(n);
  writeln(div7(n));
end.