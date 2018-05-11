(*
 * Project: labs
 * User: tatsianamarfel
 * Date: 5/8/18
 *)
program lab2;

uses regexpr;

var
  re : TRegExpr;
  s1, s2, ls : string;
  la : array of string;
  i, minLength, ind : Integer;

begin
  ReadLn(ls);
  if Length(ls) < 1 then
    WriteLn('Error. The string should not be empty');
  re := TRegExpr.Create('[\s]{1,2}');
  SetLength(la, 90);
  ind := 1;
  for i:= 1 to Length(ls) do
  begin
    if NOT(re.exec(ls[i])) then
    begin
      s1 := Concat(s1 + ls[i]);
    end
    else
    begin
      la[ind] := s1;
      s1 := '';
      WriteLn(Length(la[ind]));
      ind:=ind+1;
    end;

  end;
  minLength:=Length(la[1]);
  WriteLn('minLength', minLength);
  for i:=1 to Length(la) do
    If (Length(la[i]) <= minLength) AND NOT(la[i] = la[Length(la)]) then
    begin
      minLength := Length(la[i]);
      s1 := la[i];
    end;
  WriteLn(s1);
end.