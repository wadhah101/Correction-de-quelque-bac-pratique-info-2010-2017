program p;

uses 
  wincrt; 
  
type 
  Tab=array[1..13] of string;
var 
  t: tab;
 
function check(s: string): boolean; 
var 
 bl: boolean;
 i: integer;
begin
 bl := true;
 i := 0;
 repeat 
 i := i + 1;
   if not(s[i] in ['A'..'Z']) then  
     bl := false;
 until not(bl) or (i = length(s));
 check := bl;
end;

procedure saisir(var s: string);
begin
  repeat 
    readln(s);
  until check(s);
end;
  
procedure remplir(var t:tab);
var 
  i: integer;
begin
 for i := 1 to 12 do 
   begin
     write('T[',i,']= ');
     saisir(T[i]);  
   end; 
end;

procedure swap(var a, b: string);
var 
  x: string;
begin 
  x := a;
  a := b;
  b := x;
end;

procedure trie(var t: tab); 
var 
  p, i:integer;
  bl: boolean;
begin
  p := 1 + random(3); 
  repeat
    bl := false;
    for i := 1 to 12-1 do 
      if (T[i][p] > T[i + 1][p]) then 
        begin 
          swap(T[i], T[i + 1]);
          bl := true;
        end; 
  until not(bl)
end;

procedure affiche(T: tab);
var 
  i: integer;
begin 
  trie(t);
  for i := 1 to 12 do 
    begin
      if  (i mod 3 = 1) then 
        writeln;
      write(' | ',T[(i div 3)*3 + (i mod 3)]); 
    end;
end;  


begin
  remplir(T);
  affiche(T); 
end.