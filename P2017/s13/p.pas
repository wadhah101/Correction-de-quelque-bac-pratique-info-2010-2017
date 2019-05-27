program crypt;

uses 
  wincrt; 

var 
  m: string;

function prime(n :integer): boolean;
var 
  i: integer;
  bl: boolean;
begin 
  i := 1; 
  bl := true;
  repeat 
    i := i + 1;
    bl := not((n mod i) = 0);
  until not(bl) or (i = n div 2);
  prime := bl;
end;
function valide(ch: string): boolean;
var 
  i: integer;
begin
  valide := not(prime(length(ch))) and (length(ch) > 4)
end;

procedure saisir(var ch: string);
begin 
  repeat 
    readln(ch);
  until valide(ch);
end;
 
procedure swap(var a, b: char);
var 
  x: char;
begin 
  x := a;
  a := b;
  b := x;
end; 

function inverse(ch: string): string;
var 
  i: integer;
begin 
  for i := 1 to length(ch) div 2 do 
    swap(ch[i],ch[length(ch)-i+1]);
  inverse := ch;
end;

procedure inverseblock(var ch: string; k:integer);
var 
  i: integer;
  o: string;
begin 
  o := '';
  i := 0;
  repeat 
  i := i + k;
  o := o + inverse(copy(ch,i-k+1,k)); 
  until (i = length(ch));
  ch := o;
end;


function crypt(ch: string): string;
var 
  i: integer;
begin 
  for i := 2 to length(ch) div 2 do 
    if length(ch) mod i = 0 then 
     inverseblock(ch,i);
  crypt := ch; 
end;

begin
  saisir(m);
  writeln (crypt(m)); 
end.