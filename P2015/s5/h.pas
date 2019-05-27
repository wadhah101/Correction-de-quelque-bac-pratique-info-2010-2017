program pyramide;

uses
  wincrt;

type
  tab = array [1 .. 1000] of integer;
  chtab = array [1 .. 100] of string;

var
  E: integer;
  ch: string;

function check7(ch: string): boolean;
var
  E, k, i, s: integer;
  T: tab;
  ch2: string;

begin
  s := 0;
  k := 1;
  while (not((length(ch) mod 3) = 0)) do
    ch := '0' + ch;
  repeat
    ch2 := copy(ch, length(ch) - 2, 3);
    val(ch2, T[k], E);
    k := k + 1;
    Delete(ch, length(ch) - 2, 3)
  until (ch = '');
  for i := 1 to k do
  begin
    if ((i mod 2) = 1) then
      s := s + T[i]
    else
      s := s - T[i];
  end;
  check7 := ((s mod 7) = 0);
end;

function somme(ch: string): integer;
var
  i, s, n, E: integer;
begin
  s := 0;
  for i := 1 to length(ch) do
  begin
    val(ch[i], n, E);
    s := s + n;
  end;
  somme := s;
end;

procedure affiche(var T: chtab; k: integer);
var
  i, j: integer;
begin
  for i := 1 to k do
  begin
    for j := i to k - 1 do
      T[i] := ' ' + T[i];
    writeln(T[i]);
  end;
end;

procedure Buildpyramid(E: integer);
var
  i, k: integer;
  ch, a: string;
  T: chtab;
begin
  k := 1;
  str(E, ch);
  repeat
    T[k] := ch;
    k := k + 1;
    i := somme(ch) + length(ch) mod 10;
    while (i >= 10) do
      i := i mod 10;
    str(i, a);
    ch := a + ch + a;
  until check7(ch);
  T[k] := ch;
  affiche(T, k);
end;

begin
  write ('saisir seed : ');
  readln(E);
  writeln (' le pyramide  :');
  Buildpyramid(E);
  readln;
end.