program captcha;

uses 
  wincrt; 
  
type 
  tab = array['A'..'Z'] of word;

var 
  T: tab;
  i, n: word;

procedure saisir(var n: word);
begin
 repeat
  write('Donnez le nombre de codes a generer : '); 
  readln(n);
 until n in [2..100]  
end;
  
procedure remplir(var T: tab);
var 
  i: char;
begin 
 for i := 'A' to 'Z' do 
    T[i] := random(2);
end;

function Voy_occ(ch: string): word;
var 
  i, k: word;
  
begin
  k := 0;
  for i := 1 to length(ch) do 
   begin 
     if ch[i] in ['A','E','U','I','O','Y'] then 
      k := k +1  
   end;
  Voy_occ := k; 
end;

function GenererCap(T: tab): string;
var 
  ch: string;
  i: char;
begin
  ch:= '';
  for i := 'A' to 'Z' do
    begin
      if (T[i] = 1) then 
      ch := ch + i; 
    end;
  ch := ch + chr(70 + voy_occ(ch));
  GenererCap := ch;     
end;

begin
  randomize;
  saisir(n);
  for i:= 1 to n do 
   begin
    remplir(T);
    writeln('Le code captcha n° ',i,' est: ', Generercap(T)); 
   end;
end.