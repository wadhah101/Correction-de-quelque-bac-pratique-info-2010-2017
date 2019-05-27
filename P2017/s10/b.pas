program Bigramme;

uses 
  wincrt;
 
 var 
   ch: string;
 
 function check(ch: string): boolean;
 var 
   i: integer;
   bl: boolean;
 begin 
   bl := true;
   i := 0;
   if length(ch) = 0 then 
     bl := false 
   else 
   repeat 
     i := i + 1;
     bl := ch[i] in ['a'..'z'];
   until not(bl) or (i = length(ch));
   check := bl; 
 end;
   
 procedure saisir(var ch: string);
 begin 
   repeat 
     write('Ch= ');
     readln(ch);
   until check(ch);
 end;
 
 function occ(ch1,ch2: string): integer;
 var 
   k: integer;
 begin
    k := 0; 
    while (pos(ch1,ch2) <> 0) do 
      begin
        k := k + 1;
        delete(ch2,pos(ch1,ch2),length(ch1)); 
      end;
    occ := k;
 end;
 
 procedure afficher(ch: string); 
 var 
   i,k: integer;
   a: string;
 begin 
   a := '';
   for i := 2 to length(ch) do 
     if (ch[i-1] <> ch[i]) and (pos(ch[i-1] + ch[i],a) = 0) then 
     begin 
       a := a + ch[i-1] + ch[i];
       k := occ(ch[i-1] + ch[i],ch);
       writeln('Le nombre doccurance de ',ch[i-1] + ch[i], ' est ', k);
     end;          
 end;
 
 begin
   saisir(ch);
   afficher(ch);  
 end.