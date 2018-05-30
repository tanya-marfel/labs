(*
 * Project: labs
 * User: tatsianamarfel
 * Date: 5/30/18
 *)
program PerfectNumbers;
var
  m, n, i, j, sum : Integer;
begin
  readln(m);
  ReadLn(n);
  //sum := 0;
  for j:=m to n do
  begin
    for i:=1 to j - 1 do
    begin
      if (j mod i) = 0 then
      begin
        sum := sum + i;
      end;
    end;
    if (sum = j) then
    begin
      WriteLn(sum);
    end;
    sum := 0;
  end;
end.

