program jeu;

uses 
  wincrt; 

var
  mot, masque: string;

function verif(ch: string): boolean;
var 
  i: integer;
  bl: boolean;
begin 
  i := 0;
  bl := true;
  repeat
    i := i + 1; 
    bl := upcase(ch[i]) in ['A'..'Z'];
  until not(bl) or (i = length(ch));
  verif := bl and (length(ch) in [5..20]);
end;

procedure devenir(mot: string; var masque: string);
var 
  i: integer;
  ch: string;
  c: char;
begin
  ch := mot;
  masque := mot;
  for i := 2 to length(mot)-1 do 
    masque[i] := '-';
  i := 0 ;
  repeat 
    i := i + 1;
    writeln('Le mot a devenir est ', masque);
    writeln('IL vous reste ', length(masque) - i + 1,' essai(s)');
    write('proposr un caractere: ');
    readln (c); 
    while (pos(c,ch) <> 0) do
      begin
        masque[pos(c,ch)] := ch[pos(c,ch)];
        ch[pos(c,ch)] := '0';
      end;    
  until (masque = mot) or (i = length(ch)); 
end;


begin
  repeat 
    write('saisir le mot a devenir: ');
    readln(mot);
  until verif(mot);
 // CLRSCR;
  devenir(mot, masque);
  if masque = mot then 
    writeln('Bravo vous avez gagné')
  else 
    writeln('Desole vous avez perdu');  
end.