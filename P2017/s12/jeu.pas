program jeu;

uses 
  wincrt; 

var 
  ch, mot1, mot2: string;
  score1, score2, i: integer;
  
procedure generer(var ch: string);
var 
  i: integer;
begin 
  ch := '';
  for i := 1 to 10 do
    ch := ch + chr(ord('A') + random(26))
end;


function verif1(mot, ch: string): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  i := 0;
  repeat 
    i := i + 1;
    bl := (pos(mot[i],ch) <> 0);
    if bl then 
      delete(ch, pos(mot[i],ch), 1);
  until not(bl) or (i = length(mot));
  verif1 := bl;
end;


function verif(mot, ch: string): boolean;
var 
  bl: boolean;
  k: string;
begin
  k := '';
  bl := verif1(mot,ch);
   if bl then 
     begin 
        write('Le mot existe dans la langue francaise ou non? ');
        readln(k);
     end;
   bl := k[1] = 'o';  
   verif := bl;
end;

begin
  randomize; 
  i := 0;
  score1 := 0; 
  score2 := 0;
  repeat 
    i := i + 1;    
    generer(ch);
    writeln('*tour ' ,i,'* Les lettes propose sont: ',ch);
    write('Donner la proposition du joueur 1: ');
    readln(mot1);
    if verif(mot1, ch)  then 
      score1 := score1 + length(mot1);
    write('Donner la proposition du joueur 2: ');
    readln(mot2);  
    if verif(mot2,ch) then 
      score2 := score2 + length(mot2);
    writeln('Score du joueur 1: ',score1,' ****** Score de joueur 2 :', score2);
  until (score1 > 15) or (score2 > 15);
  if score1 = score2 then 
    writeln('egalite entre les deux joueurs')
  else if (score1 > score2) then 
    writeln('c"est le premier joueu qui a gagne')
  else 
    writeln('c"est le deusieme joueur qui a gagne');
end.
