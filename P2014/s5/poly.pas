program poly; 

uses 
  wincrt; 
  
var 
  a, b: longword;
  
procedure saisir(var a, b: longword);
begin 
  repeat
    write('a= '); 
    readln(a);
    write('b= ');
    readln(b);
  until  (100 <= a)  and (a < b) 
end;

function checkpoly(a: longword): boolean;
var 
 ch: string;
 bl: boolean;
 x: longword;
 i, e, l:integer;
begin 
  bl := true;
  str(a, ch);
  i := 0;
  l := length(ch);
  repeat 
    i := i + 1; 
    val(ch,x,e);
    bl := ((x mod length(ch)) = 0 );
    delete(ch,length(ch),1);
    until (i = l) or not(bl);
  checkpoly := bl;
end;

procedure chercher(a, b:longword);
var 
  i: longword; 
begin 
 writeln ('les terme poly sont'); 
 write('(');
  for i := a to b do
   if checkpoly(i) then  
     write(i,',');
 write(')');
end;
 
begin 
 { saisir(a, b);
  chercher(a, b);}
  writeln(checkpoly(345654));
  
end.