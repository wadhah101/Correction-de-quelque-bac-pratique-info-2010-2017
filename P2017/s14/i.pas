program Verification;

uses 
  wincrt;

type 
  tab=array[1..10] of string;

var 
  Pub, code: tab;
  n,i: integer;
  
function authentique(ch: string): boolean;
var 
  i: integer;
  c: string;
  x, y: longword;
  e1, e2: integer;
begin 
  delete(ch,1,5);
  delete(ch,pos('-',ch),1);
  c := ch[length(ch)];
  delete(ch,length(ch),1);
  if c = 'X' then 
    c := '10';
  val(ch,x,e1);
  val(c,y,e2);
  authentique := y = x mod 11;
   
end;
  
function numerique(ch: string): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  i := 0;
  repeat 
    i := i + 1;
    bl := ch[i] in ['0'..'9'];
  until  (i = length(ch)) or not(bl); 
  numerique := bl;
end; 


function checkISSN(ch: string): boolean;
begin 
  checkISSN := (pos('ISSN ',ch) = 1)  and numerique(copy(ch,6,4));
  checkISSN := checkISSN and  (ch[10] = '-');
  checkISSN := checkISSN and ((numerique(copy(ch,11,4))) or (numerique(copy(ch,11,3))and (ch[14] = 'X')));
  checkISSN := checkISSN and (length(ch)= 14) ;
end;

procedure remplir(VAR Pub, Code: tab; n: integer);
var 
  i: integer;
begin 
  for i := 1 to n do 
    begin
      write('pub[',i,']=');
      readln(pub[i]);
      repeat 
        write('code[',i,']= ');
        readln(code[i]);
      until checkISSN(code[i]) 
    end;
end;


begin
  repeat 
     write('saisir le nombre de publicattion a verifier: ');
     readln(n);
  until N in [1..10]; 
  remplir(Pub, code, N);
  if not(authentique(code[1])) then 
    writeln('il nya pas des ISSN authentique')
  else
  for i := 1 to N do 
    if authentique(code[i]) then 
      write('|',PUB[i],'|');
end.