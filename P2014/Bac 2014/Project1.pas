program Project1;

uses
  System.SysUtils;

type
  TabST = array [1 .. 20] of string;

var
  T, T1: TabST;
  wor: string;
  i, n: integer;

procedure filltab1(var T: TabST; ch: string; var n: integer);
var
  p: integer;

begin
  i := 1;
  ch := ch + ' ';
  repeat
    p := pos(' ', ch);
    T[i] := copy(ch, 1, p - 1);
    delete(ch, 1, p);
    n := n + 1;
    i := i + 1
  until (pos(' ', ch) = 0);
end;

procedure changetab(var T: TabST; n: integer);
var
  k, i: integer;
begin
  k := length(T[1]);
  for i := 2 to n do
    if k < length(T[i]) then
      k := length(T[i]);
  for i := 1 to n do
    while (length(T[i]) < k) do
    begin
      T[i] := T[i] + '*';
    end;
end;

procedure filltab2(T: TabST; var T1: TabST; n: integer);
var
  i, j: integer;
begin
  for i := 1 to length(T[1]) do
    T1[i] := '';

  for i := 1 to length(T[1]) do
  begin
    for j := 1 to n do
      T1[i] := T1[i] + T[j][i];
  end;
end;

begin
  wor := ('Bonjour Sami jai fini mon travail');
  filltab1(T, wor, n);
  changetab(T, n);
  for i := 1 to n do
    writeln(T[i]);
  filltab2(T, T1, n);
  writeln('-----------');
  for i := 1 to length(T[1]) do
    writeln(T1[i]);
  readln;

end.
