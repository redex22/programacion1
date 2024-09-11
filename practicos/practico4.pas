program practico4;

procedure ejercicio1a;
var aux, n : Integer;
begin
    aux := 2;
    for n := 1 to 4 do
        begin
            aux := aux * n;
            writeln(n, aux)
    end
end;

procedure ejercicio1b;
var a, b : Integer;
begin
    for b := 1 to 3 do
    begin
        if b <= 1 then
            a := b - 1;
        if b <= 2 then
            a := a - 1
        else
            a := a + 1
    end;
    writeln(a)
end;

procedure ejercicio1c;
var k, bajo : Integer;
begin
    bajo := 1;
    for k := bajo to 3 do
    begin
        bajo := bajo + 2;
        writeln(k, bajo)
    end
end;

procedure ejercicio1();
begin
{ 
Indique qu´e se exhibir´a en la salida est´andar al ejecutar cada uno de los siguientes programas. 
Despu´es, verfique compilando y ejecutando.
(a) program Ejercicio1a;
    var aux, n : Integer;
    begin
        aux := 2;
        for n := 1 to 4 do
            begin
                aux := aux * n;
                writeln(n, aux)
        end
    end.
(b) program Ejercicio1b;
    var a, b : Integer;
    begin
        for b := 1 to 3 do
        begin
        if b <= 1 then
            a := b - 1;
        if b <= 2 then
            a := a - 1
        else
            a := a + 1
        end;
        writeln(a)
    end.
(c) program Ejercicio1c;
    var k, bajo : Integer;
    begin
        bajo := 1;
        for k := bajo to 3 do
        begin
            bajo := bajo + 2;
            writeln(k, bajo)
        end
    end.
}
    ejercicio1a(); // Outputs: 1 2 \n 2 4 \n 3 12 \n 4 48
    ejercicio1b(); // Outptus: -1
    ejercicio1c(); // Outputs: 1 3 \n 2 5 \n 3 7
end;

procedure ejercicio2();
var i, j : Integer;
begin
{ 
Determine cu´ales de los siguientes fragmentos de c´odigo producir´an la misma salida al ejecutarlos.
Suponga que todas las variables son enteras.
(a) for i := 1 to 3 do
for j := i+1 to 3 do
write(i, j)
(b) for i := 1 to 3 do
write(i, i+1)
(c) for i := 1 to 4 do
if (i = 1) or (i = 4) then
write (i)
else
write(i,i)
}
    // a
    for i := 1 to 3 do
        for j := i+1 to 3 do
            write(i, j);
    // out: 1 2 1 3 2 3 
    writeln();
    // b
    for i := 1 to 3 do
        write(i, i+1);
    // out: 1 2 2 3 3 4
    writeln();
    // c
    for i := 1 to 4 do
        if (i = 1) or (i = 4) then
            write(i)
        else
            write(i,i);
    // out: 1 2 2 3 3 4
    writeln();
end;

procedure ejercicio3();
CONST TOTAL = 4;
var sum, ind, j : Integer;
begin
{ Indique el valor final de la variable sum al finalizar la ejecuci´on de cada uno de los siguientes fragmentos de c´odigo.
Suponga que todas las variables son enteras.
(a) sum := 0;
j := 10;
for ind := 1 to 5 do
begin
sum := sum + 2 * ind + 1 + j;
j := j - 4;
end;
(b) const TOTAL = 4;
....
sum := 0;
for ind := 1 to TOTAL do
for j := 1 to ind do
sum := sum + ind + j; }
    // (a)
    sum := 0;
    j := 10;
    for ind := 1 to 5 do
        begin
            sum := sum + 2 * ind + 1 + j;
            j := j - 4;
        end;
    writeln(sum);
    // out: 45

    sum := 0;
    for ind := 1 to TOTAL do
        for j := 1 to ind do
            sum := sum + ind + j;
    writeln(sum);
    // out: 50
end;

procedure ejercicio4();
var a,b,c, multiplo : Integer;
begin
{ Escriba un programa en Pascal que lea de la entrada est´andar tres n´umeros naturales a, b y n. 
El programa debe exhibir en pantalla todos los m´ultiplos de n que haya entre a y b.
Ejemplo
a = 3, b = 17, n = 4
4 8 12 16 }
    writeln('Ingrese los números naturales a, b y c: ');
    readln(a, b, c);
    multiplo := 0;
    while(multiplo <= b) do
        begin
            if(multiplo > a) then
                write(multiplo);
            multiplo := multiplo + c;
        end;
    writeln();
end;

procedure ejercicio5();
var n, divisor : Integer;
begin
{ Escriba un programa en Pascal que lea de la entrada est´andar un n´umero natural n y
despliegue en pantalla todos los divisores naturales de n.
Ejemplo
n = 116
1 2 4 29 58 116 }
    writeln('Ingrese un número natural: ');
    readln(n);
    writeln('Sus divisores naturales son: ');
    for divisor := 1 to n do
        if(n mod divisor = 0) then
            write(divisor);
    writeln();
end;

procedure ejercicio6();
var n, min, max, other, i : Integer;
begin
{ Escriba un programa en Pascal que lea de la entrada est´andar un n´umero natural n. A
continuaci´on, el programa deber´a leer n enteros y luego desplegar en pantalla el mayor y
el menor de ellos. Incluya mensajes de salida con etiquetas descriptivas para solicitar y
exhibir los valores.
Ejemplo
Ingrese un valor para n: 8
Ingrese 8 enteros: 5 12 36 4 21 95 12 18
El mayor entero ingresado es: 95
El menor entero ingresado es: 4 }
    write('Ingrese un valor para n: ');
    readln(n);
    write('Ingrese ', n, ' enteros: ');
    read(other);
    min := other;
    max := other;
    for i := 2 to n do
        begin
            read(other);
            if(other < min) then
                min := other;
            if(other > max) then
                max := other;
        end;
    writeln();
    writeln('El mayor entero ingresado es: ', max);
    writeln('El menor entero ingresado es: ', min);
end;

procedure ejercicio7();
var n, other, i, j : Integer;
begin
{ Escriba un programa en Pascal que lea de la entrada est´andar n enteros positivos, todos
menores que 60 y produzca una gr´afica de n barras horizontales formadas por asteriscos
(similar a la que se muestra en el ejemplo). La k-´esima barra deber´a tener tantos asteriscos
como indique el k-´esimo entero (de entre los n enteros ingresados). Su programa no necesita
controlar que los enteros ingresados sean menores que 60 (asuma que as´ı ser´a). Incluya
mensajes de salida con etiquetas descriptivas para solicitar y exhibir los valores.
Ejemplo de entrada:
Ejemplo
Ingrese un valor para n: 5
Ingrese 5 enteros positivos: 7 12 17 35 8
*******
************
*****************
***********************************
******** }
    write('Ingrese un valor para n: ');
    readln(n);
    write('Ingrese ', n, ' enteros positivos: ');
    for i := 1 to n do
        begin
        read(other);
        for j := 1 to other do
            write('*');
        writeln();
        end;
    writeln();
end;

procedure ejercicio8();
var
    c : Char;
    n, i, j : Integer;
begin
{ Escriba un programa en Pascal que lea de la entrada est´andar un car´acter c y un natural n.
El programa debe desplegar un tri´angulo de n l´ıneas formado por el car´acter c (similar al
que se muestra en el ejemplo). La primera l´ınea debe tener n ocurrencias de c. La segunda
l´ınea debe tener n-1 ocurrencias de c (y as´ı sucesivamente). La ´ultima l´ınea debe tener
1 ocurrencia de c. Incluya mensajes de salida con etiquetas descriptivas para solicitar y
exhibir los valores.
Ejemplo
Ingrese un car´acter c: &
Ingrese un valor para n: 8
&&&&&&&&
&&&&&&&
&&&&&&
&&&&&
&&&&
&&&
&&
& }
    write('Ingrese un carácter c: ');
    readln(c);
    write('Ingrese un valor para n: ');
    readln(n);
    for i := n downto 1 do
        begin
        for j := 1 to i do
            write(c);
        writeln();
        end;
    writeln();
end;

procedure ejercicio9();
var x,n, power, i : Integer;
begin
{ Escriba un programa en Pascal que lea dos n´umeros naturales x, n de la entrada est´andar
y calcule la potencia de x elevado a la n. Para este ejercicio, solamente se permite utilizar
las operaciones aritm´eticas elementales de Pascal (+, -, *, /, DIV, MOD). Incluya mensajes
de salida con etiquetas descriptivas para solicitar y exhibir los valores.
Ejemplo
Ingrese un valor para x: 3
Ingrese un valor para n: 4
El resultado de 3 elevado a la 4 es: 81 }
    write('Ingrese un valor para x: ');
    readln(x);
    write('Ingrese un valor para n: ');
    readln(n);
    power := 1;
    for i := 1 to n do
        power := power * x;
    writeln('El resultado de ', x, ' elevado a la ', n, ' es: ', power);
end;

begin
    // ejercicio1();
    // ejercicio2();
    // ejercicio3();
    // ejercicio4();
    // ejercicio5();
    // ejercicio6();
    // ejercicio7();
    // ejercicio8();
    // ejercicio9();

end.