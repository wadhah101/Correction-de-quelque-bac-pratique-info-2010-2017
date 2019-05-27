program crypt; 

uses 
  wincrt; 

var 
  ch, ch2: string;

function check(ch : string): boolean;
var 
  i: integer;
  bl: boolean;
begin
  bl := true;
  for i := 1 to length(ch) do
    if not((ch[i] in ['A'..'Z']) or (ch[i] = ' ')) then
      bl := false;
  check := bl;
end;

procedure saisir(var ch: string);
begin 
  repeat 
    write('donnez le msg a crypter: ');
  until check(ch)
end;


begin 
end.