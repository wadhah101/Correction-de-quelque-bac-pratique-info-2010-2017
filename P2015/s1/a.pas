program crypt; 

uses 
  wincrt; 
  
type 
  tab = array [1..100] of integer;
  
var 
  T: tab;
  ch: string;
const
  p = 17;
  q = 19;
  e = 5;

function  check(ch: string): boolean;
var 
  i: integer;
  bl : boolean;
begin
  bl := true;
  for i := 1 to length(ch) do 
    if not (Upcase(ch[i]) in ['A'..'Z']) then 
      bl := false;
  check := bl;
end;
  
procedure saisir(Var ch: string);
begin
 repeat  
  write('sasir le message a crypter: ');
  readln(ch) 
 until check(ch);  
end;

procedure trait(var T: tab; ch: string);
var 
  i: integer;
begin
  writeln('Le tableau crypté est '); 
  write('|');
  for i := 1 to length(ch) do
    begin 
      T[i] := ord(Upcase(ch[i])) - 64;
      T[i] := trunc(exp(e*ln(T[i]))) mod (p*q);
      write(T[i],'|');
    end;
end; 

begin
  saisir(ch);
  trait(T,ch);
end.
