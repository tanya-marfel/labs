(*
 * Project: labs
 * User: tatsianamarfel
 * Date: 5/26/18
 *)
PROGRAM PiCalculation;
Uses sysutils, math;

Const
  m = 5;
    { Первый аргумент }
  n = 239; { Второй аргумент }
Var
  x, Pi, eps : Double;
{ Слагаемое, сумма и введенная точность }
  i, j, sign, mstep, nstep : Integer;{ Вспомогательные переменные }

begin
  sign := 1; { Определение знака для первого слагаемого}
  i := 1; { Начальное значение i }
  j := 0; { Начальное значение j для подсчета количества суммируемых слагаемых }; { Начальное значение x }
  Pi := 0; { Начальное значение Pi}
  mstep := m; { Начальное значение степени m }
  nstep := n; { Начальное значение степени n }
  x := (16 / (i * mstep) - 4 / (i * nstep));
  Writeln('Please, enter the epsilon value ');
  Readln(eps); { Чтение введенной точности }
  if (eps <= 0) or (eps > abs(x)) then { Обработка некорректных значений }
  begin
    WriteLn('Error. The entered value should be less or equal to x.');
    exit;
  end;
  repeat { Итерационный цикл для вычисления значения Pi }
    Pi := Pi + x * sign; { Вычисление первого слагаемого }
    inc(j); { Увеличение количества просуммированных слагаемых }
    i := i + 2; { Увеличение переменной-счетчика }
    mstep := mstep * m * m; { Наращивание степени m }
    nstep := nstep * n * n; { Наращивание степени n }
    sign := sign * (-1); { Изменение знака следующего слагаемого }
    x := (16 / (i * mstep) - 4 / (i * nstep)); { Вычисление следующего слагаемого }
  until abs(x) <= eps; { Сравнение полученного слагаемого с введенной точностью }
  WriteLn('You assigned', eps: ceil(abs(log10(eps))), ' value to epsilon.'); { Вывод исходной точности }
  WriteLn('As a result, Pi = ', Pi : 5 : ceil(abs(log10(eps))), '.'); { Вывод полученной суммы с точностью, определенной пользователем }
  WriteLn('Overall, ', j, ' numbers were added.'); { Вывод количества просуммированных слагаемых }
end.