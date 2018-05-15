(*
 * Project: labs
 * User: tatsianamarfel
 * Date: 5/8/18
 *)
program lab2;

uses regexpr;

var
  re : TRegExpr;
    {экземпляр класса TRegExpr}
  ls, s1, s2 : string;
    {исходная и итоговые строки}
  la : array of string;
    {массив для добавления каждого слова строки}
  minLength, i, ind, count : Integer;
    {Вспомогательные переменные для подсчета минимальной длины и итерации  цикла}
  word : boolean;
begin
  ReadLn(ls); {Чтение данных введенных пользователем}
  if Length(ls) < 1 then {Условие для обработки пустой строки}
    WriteLn('Error. The string should not be empty');
  re := TRegExpr.Create; {Создание экземляра класса TRegExpr для обработки регулярных выражений}
  re.Expression := ('[\s,.]'); {Набор символов для разбиения строки на слова}

  ind := 0; {Установление индекса для первого элемента массива}
  count := 0; {Инициализация переменной для подсчета слов в строке}

  while i < Length(ls) do
  begin
    if re.exec(ls[i]) then
      word := false
    else if NOT(word) then
    begin
      word := true;
      count := count + 1;
    end;
    i := i + 1;
  end;
  SetLength(la, count);

  for i:=0 to Length(ls) do
  begin
    if NOT re.exec(ls[i]) then
    begin
      s1 := Concat(s1 + ls[i]);
    end
    else
    begin
      la[ind] := s1;
      WriteLn(s1);
      s1 := '';

      WriteLn(Length(la[ind]));
      ind := ind + 1;
    end;
  end;


  minLength := Length(la[0]);
  for i:=0 to Length(la) do

  begin

    If (Length(la[i]) < minLength) AND NOT(la[i] = la[Length(la)]) then
    begin
      minLength := Length(la[i]);
      s1 := la[i];
    end;

  end;
  WriteLn(s1);

  for i:=0 to Length(la) do
  begin
    if pos('th', la[i]) <> 0 then
    begin
      Delete(la[i], pos('th', la[i]), 2);
      Writeln(la[i]);
    end
    else
    begin
      WriteLn('No occurrences of "th" were found. Try again with a differnt string.');
      break
    end;
  end;

end.