program Olympiade;

uses 
  wincrt;

type 
  tab=array[1..26] of string;

var 
  N, i: integer;
  TN, TG, TC: tab;
  
function verif(ch: string; n: integer): boolean;
var 
  bl: boolean;
  i: integer;
begin 
  i := 0;
  bl := true;
  repeat 
    i := i + 1;
    bl := upcase(ch[i]) in ['A'..'Z'];
  until not(bl) or (i = length(ch));
  verif := bl and (n >= length(ch))
end;

procedure Generer(TG: tab; var TC: tab; N: integer);
var 
  i, j, k: integer;
  ch: string;
begin 
  for i := 1 to N do 
    TC[i] := 'SSS';
  for j := 1 to n do 
    begin 
    k := 0;
    for i := j to N do
      if (TG[i] = TG[j]) and verif(TC[i],10) then
        begin
          k := k + 1;
          str(k,ch);
          if length(ch) = 1 then 
            ch := '0' + ch;
          TC[i] := copy(TG[i],1,3) + ch
        end; 
    end;
end;

procedure afficher(TN,TC: tab; N:integer);
var 
  i: integer;
  ch: string;
begin 
  writeln;
  write('Les noms de participants sont: '); 
  for i := 1 to n do 
    begin
       ch := TN[i] + ' '+ TC[i];
       while (pos(TC[i],ch) < 10) do 
         insert(' ',ch,pos(' ',ch));
       writeln(ch);
    end;
end; 


begin
  repeat 
    write('donner le nombre de participants: ');
    readln(N);
  until N in [1..26]; 
  for i := 1 to N do 
    begin
      repeat 
        write('Doneer le nom de particpants ',i,': ');
        readln(TN[i]);
      until Verif(TN[i], 15);
      repeat
        write('donner le nom du gouvernorat:',i,': ');
        readln(TG[i]); 
      until Verif (TG[i], 10); 
    end;
  generer(TG, TC, N);
  afficher(TN, TC, N);
end.