program zig;
  
uses 
  wincrt; 
  
type 
  tab=array[1..10] of string;
  
var
 T: Tab;
 n: integer;
  
function check(ch: string): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  i := 1;
  repeat
    bl := ch[i] in ['A'..'Z']; 
    i := i + 1;
  until not(bl) or  (i = length(ch));
  check := bl and (length(ch) in [2..12]);
end; 
  
procedure saisir(var ch: string); 
begin
  repeat
    readln(ch); 
   if not(check(ch)) then 
     begin
     write('resaisir le mot svp: ');  
     end;
  until check(ch) 
end;

function zigzag(ch: string): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  i := 1;
  if ch[i] > ch[i+1] then
    repeat 
      if ((i mod 2) = 1) then 
        bl := ch[i] > ch[i+1] 
      else 
        bl := ch[i] < ch[i+1];
      i := i +1 
    until not(bl) or (i = (length(ch)))
  else
    repeat 
      if ((i mod 2) = 1) then 
        bl := ch[i] < ch[i+1] 
      else 
        bl := ch[i] > ch[i+1];
      i := i +1 
    until not(bl) or (i = (length(ch)));
  zigzag := bl;
end;

procedure remplir(var T:tab ; n:integer);
var 
  i :integer;
begin
  for i := 1 to n do 
   begin 
    write('T[',i,']= ');
    saisir(T[i]); 
   end;
end;

procedure entrer(var n:integer);
begin
 repeat
  write('N= ');
  readln(n); 
 until n in [5..10]
end;

procedure affiche(T: tab; n: integer);
var 
  i: integer;
begin
  writeln;
  writeln('Les mot zigzag sont: ');
  write('|');
  for i:= 1 to n do 
    if zigzag(T[i]) then 
      write(T[i],'|');
end;


begin 
 entrer(n);
 remplir(T,n);
 affiche(T,n)
  
end.



 