program Holis;
var
    num1, num2 : Integer;
    num3, num4 : Real;
begin
    num1 := 199;
    num3 := 0.5;
    num4 := num3 + num1;
    num4 := num4 + 5;
    writeln(num4);
    num1 := num1 + num1;
    writeln('num + num: ', num1);
end.