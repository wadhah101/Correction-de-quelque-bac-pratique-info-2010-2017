program p; 

uses 
  wincrt; 

var 
  A, B: integer;
  
procedure saisir(Var a, b: integer); 
begin
  repeat
    write('A= ');
    readln(a);
    write('B= '); 
    readln(b);
  until (10 <= A) and (A <= B) and (B <= 10000) 
end;

procedure PGCD(A, B:integer); 
var 
  i, k, G,H:integer;
begin 
  G := 1;
  H := 0;
  write('PGCD(',A,', ',B,')= '); 
  for i := 2 to (A div 2) do
    if (A mod i = 0) and (B mod i =0) then 
      begin 
        H := H + 1;
        if (H > 1) then
          write(' * ');
        K := 0;
        write(i);
        while ((A mod i = 0) and (B mod i =0)) do 
          begin
            K := K + 1;
            A := A div i; 
            B := B div i;
          end;
          G := G * trunc(exp(k*ln(i))); 
        if not(K = 1) then
          write('^',k);
      end;
    write ('= ', G);
end;


begin
  saisir(A,B);
  PGCD(A,B);
end.