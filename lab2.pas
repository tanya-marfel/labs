(*
 * Project: labs
 * User: tatsianamarfel
 * Date: 5/8/18
 *)
program lab2;
var
  s1, s2, ls : string;
  la : array [1..300] of string;
  i, minLength : Integer;

begin
  ls := 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua';
  for i:= 1 to Length(ls) do
  begin
    if NOT(ls[i] = ' ') then
    begin
      s1 := Concat(s1 + ls[i]);
      WriteLn(s1)
    end
    else
    begin
      la[i] := s1;
      s1 := '';
      WriteLn(la[i])
    end;
  end;
  minLength := Length(la[1]);
  for i:=1 to Length(la) do
  begin
    If (Length(la[i]) < minLength) AND (la[i] <> la[Length(la)]) then
      s1 := la[i];

  end;


end.