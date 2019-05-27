program suitep;

uses 
  wincrt;
var 
  n: integer;

procedure saisir(var n: integer); 
begin 
  repeat 
    readln(n);
  until (n >= 10)
end;

function checkp(ch: string): boolean;
var  
  i: integer;
  bl: boolean;
begin 
  i := 0; 
  bl := true;
  repeat 
    i := i + 1;
    bl := (ch[i] = ch[length(ch)- i + 1]); 
  until  not(bl)  or (i = (length(ch) div 2));
  checkp := bl;  
end;

procedure  swap(var a, b: char);
var 
  med: char;
begin 
  med := b; 
  b := a;
  a := med;
end;
function inv(ch: string): string;
var 
  i: integer;
begin 
  for i := 1 to (length(ch) div 2) do
   swap (ch[i], ch[length(ch)- i + 1]);
  inv := ch;
end;

procedure genSuite(n: integer);
var 
  i: integer;
  ch: string;
  bl: boolean; 
  x, y: longword;
  e: integer;
begin 
  str(n,ch);
  i := 0;
  repeat 
  i := i + 1;
  write(ch,', '); 
  if not checkp(ch) then 
    begin 
      val(ch,x,e);
      val(inv(ch),y,e);
      x := x + y; 
      str(x,ch);
    end;    
  until checkp(ch) or (i = 11);
  if i = 11 then 
    writeln(ch, 'Le calcul de 11 terme ne donne pas une suite palindromique pour ce nombre')
  else 
    writeln(ch, ' : Cette suite est palindromique');
end;
  
begin
  saisir(n);
  genSuite(n);
end.