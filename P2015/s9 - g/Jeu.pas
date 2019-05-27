program game;

uses 
  wincrt;

var 
  nombre: string;
  
function generer: string;
var 
  x, y: integer;
  ch1, ch2: string;
begin
  x := 1000 + random(9000);
  y :=random(10000);
  str(x,ch1);
  str(y,ch2); 
  while length(ch2) < 4 do 
   ch2 := '0' + ch2;
  generer := ch1 +ch2;
end;

procedure saisir1 (var ch: string);
begin
 repeat 
   write ('Proposer un chiffre?');
   readln(ch);
 until (length(ch) = 1) ;   
end;

procedure saisir2 (var ch: string);
begin
  repeat
    write('Voulez vous proposer un numero? ');
    readln(ch);
  until  (ch = 'O') or (ch = 'N');  
end;


procedure gamebody(nb: string);
var
  Nbc, ch, Nb2: string; 
  condition, i: word;
  
begin 
  Nb2 := Nb;
  Nbc := '________';
  repeat 
    saisir1(ch);
    i := i + 1;
    while not(pos(ch,nb) = 0) do
      begin
        Nbc[pos(ch,nb)] := ch[1];
        Nb [pos(ch,nb)] := 'k';
      end;
    writeln('Le numero de telephone est: ',Nbc); 
    saisir2(ch);
    if (ch = 'O') then 
     begin
       write('Proposer un numero: ');
       readln(Nbc);  
       if Nbc = Nb2 then 
         condition := 1 
       else
         condition := 2; 
     end;
     if (i = 5) then 
      begin 
        write('Proposer un numero: ');
        readln(Nbc); 
        if nbc = nb2 then 
          condition := 1 
        else
          condition := 2;
      end;
  until (condition = 1) or (condition = 2); 
  if (condition = 1) then 
    writeln('Bravo! Vous avez gagné')
  else 
    writeln('Desole! Vous avez perdu');
end;

begin 
  randomize;
  nombre := generer;
  writeln(nombre);
  gamebody(nombre);
end.