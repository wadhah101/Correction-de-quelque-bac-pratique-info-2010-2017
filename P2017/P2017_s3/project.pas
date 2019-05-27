program bac;

uses
  wincrt;

var
  M: string;
  p:longword;

function valide(ch: string): boolean;
var
  i: word;
begin
  valide := true;
  if ch = '' then
    valide := false
  else
    for i := 1 to length(ch) do
    begin
      if not((UpCase(ch[i]) in ['A' .. 'Z']) or (ch[i] = ' ')) then
        valide := false;
    end;
end;

procedure saisir(var ch: string);
begin
  repeat
    writeln('Donner le message a crypter ');
    readln(ch);
  until (valide(ch));
end;

function NBmot(ch: string): longword;
var
  i: word;
  k: integer;
begin
  k := 1;
   while ch[length(ch)] = ' ' do
    begin
    delete(ch, length(ch), 1)
    end;
  for i := 2 to length(ch) do
  begin
    if (ch[i] = ' ') and (not(ch[i - 1] = ' ')) then
      k := k + 1;
  end;
  NBmot := k;
end;

function crypt(ch: string; p: word): string;
var
  i: integer;
  x, y: longword;
begin
  for i := 1 to length(ch) do
  begin
   if not(ch[i] =' ') then
   begin
    x := ord(ch[i]);
    y := x + p;
    if y > 122 then
      y := y - 26;
    ch[i] := chr(y);
  end;
  end;
  crypt := ch;
end;

begin
 saisir(M);
 p := NBmot(M);
 writeln(crypt(M,P));
 readln;
end.
