program ejercicios;

function fact(n: Integer): longint;
begin
    if(n = 0) then
        fact := 1
    else
        fact := n * fact(n-1);
end;

function AExpB(a, b: Real):Real;
begin
if (a < 0) then
    begin
        writeLn('Error! a debe de ser mayor a 0');
        halt(-1);
    end
    else
    begin
        AExpB := exp(b * ln(a));
    end;
end;

procedure ejercicio1();
var
    a, b, c, d : Integer;
    x, y, z : Integer;
begin
(*
Considere la siguiente secuencia de instrucciones y que todas las variables se han declararado
como variables enteras:
read(x,y,z);
readln(a);
readln(b,c);
read(d);
Suponga que se ejecuta dicha secuencia con los siguientes datos ingresados por la entrada
estándar:
8 7 2 1 3
1 4 4 6 2
3 7
Indique con qué valores quedan las variables a, b, c, d, x, y, z.
*)
    writeln('Empieza ejercicio1');
    read(x,y,z);
    readln(a);
    readln(b,c);
    read(d);
    writeln('Variables [x, y, z, a, b, c, d] asignadas con: ', x, y, z, a, b, c, d);
    writeln('Termina ejercicio2');
    // ? x = 8, y = 7, z = 2, a = 1, b = 1, c = 4, d = 3
    // correcta suposición maquinola cósmica, ah hablaba solo no.
end;

procedure ejercicio2();
var
    a,b,c: integer;
    x,y,z: real;
begin
(*
Dada la siguiente declaración de variables:
var
a,b,c: integer;
x,y,z: real;
Suponga que se ingresan los siguientes datos por la entrada estándar:
3 2.3 -6.5
1 5 2.1
Para cada una de las siguientes secuencias de instrucciones, indique si se ejecutan correctamente o si se produce error en tiempo de ejecución. En caso afirmativo, indique en qué
instrucción se produce el error.
i) read(x,y,z); read(a,b,x)
ii) read(a,x,y); read(b,z,c)
iii) readln(a,x); read(b,c,y,z)
*)
    writeln('Empieza ejercicio2');
    read(x,y,z); read(a,b,x); // ok, 2.1 | 2.3 | 5 | 1 | 2.3 | 2.1

    // read(a,x,y); read(b,z,c); // ok, 3 | 2.3 | 1 | 5

    // readln(a,x); read(b,c,y,z); // not ok, ejecución no finita
    writeln();
    writeln('Valores asignados para a, x, y, b, z, c: ', a, x, y, b, z, c);
    writeln('Termina ejercicio2');
end;

procedure ejercicio3();
begin
(*
¿Qué se desplegará en la salida estándar cuando se ejecute el siguiente programa en Pascal?
Anticipe cuál va a ser la salida que se mostrará. Después, ejecútelo en máquina y compare
lo que esperaba con la salida que se muestra.

program valoresSuma;
begin
    write ('Valor1 es: ');
    writeln(3);
    write ('Valor2 es: ');
    writeln(5.5);
    writeln ('La suma de ', 3, ' y ', 5.5, ' es ', 3 + 5.5)
end.

*)
    writeln('Empieza ejercicio3');
    write ('Valor1 es: ');
    writeln(3); // Valor1 es: 3
    write ('Valor2 es: '); 
    writeln(5.5); // Valor2 es: 5.5
    writeln ('La suma de ', 3, ' y ', 5.5, ' es ', 3 + 5.5); // La suma de 3 y 5.5 es 3 + 8.5
    writeln('Termina ejercicio3');
end;

procedure ejercicio4();
var
    a,b,c : Integer;
begin
(*
Suponga que a, b y c son variables enteras y se ingresan los siguientes datos por la entrada
estándar:
1 2
3 4
Indique cual o cuáles de las siguientes secuencias de instrucciones no producirá los valores
a = 1, b = 2 y c = 3:
□ read(a); readln(b); read(c)
□ readln (a,b,c)
□ read(a,b,c)
□ read(a); read(b); readln; read(c)
□ readln(a); readln(b); readln(c)
*)
    writeln('Empieza ejercicio4');
    //read(a); readln(b); read(c); // si
    //readln (a,b,c); // si
    //read(a,b,c); // si
    //read(a); read(b); readln; read(c); // si
    readln(a); readln(b); readln(c); // no, ejecución no finita
    writeln('Variables asignadas [a,b,c]: ', a, b, c);
    writeln('Termina ejercicio4');
end;

procedure ejercicio5();
var
    a, b, c, d : char;
    r1, r2 : integer;
    resu : real;
begin
(*
Dado el siguiente programa:
program charOrd;
var
    a, b, c, d : char;
    r1, r2 : integer;
    resu : real;
begin
    read (a, b, c, d);
    r1 := ord(a) - ord('0');
    r2 := (ord(c) - ord('0')) * 10 + (ord(d) - ord('0'));
    resu := r1 + r2 / 100;
    writeln ('Valor ingresado: ', resu:4:2)
end.

Suponga que se ejecuta dicho programa con los siguientes datos ingresados por la entrada
estándar:
    3.14
¿Qué se desplegaría en la salida estándar cuando se ejecute el programa? Anticipe cuál va
a ser la salida. Después, ejecútelo en máquina y compare lo que esperaba con la salida que
se muestra.
*)
    writeln('Empieza ejercicio5');
    read (a, b, c, d);
    r1 := ord(a) - ord('0');
    writeln('Valor de r1: ', r1); // 3
    r2 := (ord(c) - ord('0')) * 10 + (ord(d) - ord('0'));
    writeln('Valor de r2: ', r2); // 14
    resu := r1 + r2 / 100;
    writeln('Valor de resu: ', resu); // 3.14
    writeln ('Valor ingresado: ', resu:4:2);
    writeln('Termina ejercicio5');
end;

procedure ejercicio6();
var
    t1, t2 : Integer;
    resultado : Integer;
    days, hours, minutes : Integer;
begin
(*
Escriba un programa en Pascal que, dados dos enteros de la forma hhmm (ingresados por la
entrada est´andar), donde hh representa las horas (menos de 24) y mm los minutos (menos
de 60), determine la suma de estos dos tiempos, y exhiba el resultado en la salida est´andar,
en la forma d hhmm, donde d es d´ıas (ya sea cero o uno). Incluya mensajes de salida con
etiquetas descriptivas para el ingreso de datos.

Ejemplo:

Entrada     Salida
1345 2153   1 1138
*)
    writeln('Empieza ejercicio 6:');
    write('Ingrese el primero tiempo (hhmm): ');
    readln(t1);
    write('Ingrese el segundo tiempo (hhmm): ');
    readln(t2);

    minutes := round(((t1 / 100) - trunc(t1 / 100)) * 100) + round(((t2 / 100) - trunc(t2 / 100)) * 100);
    hours := (t1 div 100 + t2 div 100) + (minutes - minutes mod 60) div 60;
    days := (hours - hours mod 24) div 24;
    writeln('days: ', days);
    writeln('hours: ', hours mod 24);
    writeln('minutes: ', minutes mod 60);
    writeln('La suma de ambos tiempos es (d hhmm): ');
    writeln('Termina el ejercicio 6.');
end;

procedure ejercicio7();
var
    m, v : Real;
begin
(*
El error relativo en una medición m es la razón de la diferencia absoluta entre la medición
y el valor verdadero v al valor verdadero, la cual se calcula como |m − v|/v. Escriba un
programa en Pascal que lea por la entrada estándar dos números reales que representan
la medición m y el valor verdadero v. El programa debe calcular el error relativo de la
medición y exhibirlo en la salida estándar junto con la medición y el valor verdadero.
Incluya mensajes de salida con etiquetas descriptivas para el ingreso y el despliegue de
datos.
Ejemplo:
Entrada     Salida
51.0 51.3   Medición = 5.1000000000e+01
            Valor verdadero = 5.1300000000e+01
            Error relativo = 5.8479532164e-0003
*)
    write('Ingrese la medición (m): ');
    readln(m);
    write('Ingrese el valor verdadero (v): ');
    readln(v);
    writeln('Medición: ', m:4:2);
    writeln('Valor verdadero: ', v:4:2);
    writeln('El error relativo es de: ', Abs((m - v) / v));
end;

procedure ejercicio8();
var
    num : Integer;
    rnd_num : Integer;
begin
(*
No es posible utilizar una computadora para generar números aleatorios genuinos ya que
es preciso utilizar un algoritmo para generar los números, lo que implica que es posible predecir los números generados. Lo que sí pueden hacer las computadoras es generar números
seudoaleatorios (números que, estadísticamente, parecen ser aleatorios). Una técnica antigua (que no produce buenos resultados) se llama método del cuadrado medio. Funciona
así: dado un número a, para generar el siguiente n´umero de la secuencia se extraen los
d´ıgitos que est´an en la posición de las decenas y las centenas de a.
Por ejemplo, si a es 53, entonces a^2 es 2809, y el siguiente número seudoaleatorio será 80. Se ve que el siguiente
número seudoaleatorio a 80 es 40. Si se continúa este proceso se obtiene 60, 60, 60, . . .
Escriba un programa en Pascal que lea por la entrada estándar un entero de dos dígitos
y determine el siguiente número seudoaleatorio que se generaría si se usara el método del
cuadrado medio. Como resultado, exhiba por la salida estándar el numero de dos dígitos
original, el cuadrado de este entero, y el siguiente número seudoaleatorio. Incluya mensajes
de salida con etiquetas descriptivas para el ingreso y el despliegue de datos.
Ejemplo:
Entrada     Salida
53          Numero introducido = 53
            Cuadrado del numero = 2809
            Siguiente numero seudoaleatorio = 80
*)
    write('Ingrese un numero de dos digitos: ');
    readln(num);
    writeln('Numero introducido: ', num);
    writeln('Cuadrado del numero: ', num * num);
    writeln('Siguiente numero seudoaleatorio: ', (num * num div 10) mod 100);
end;

procedure ejercicio9();
var
    x, resultado, power_of_x : Real;
    i : Integer;
begin
(*
La funci´on exp de Pascal calcula un valor igual a la suma de la serie infinita 1 + [x/1!] +
[(x2)/2!] + [(x3)/3!] + [(x4)/4!], siendo x un n´umero real. Escriba un programa en Pascal
que lea por la entrada est´andar un valor real para x entre 0,0 y 1,0. El programa debe
determinar, por un lado, la suma de los primeros cinco t´erminos de la serie infinita y, por
otro lado, el valor de exp(x) mediante la funci´on predefinida. Como resultado, exhiba por
la salida est´andar ambos valores calculados junto con el valor de x. Incluya mensajes de
salida con etiquetas descriptivas para el ingreso y el despliegue de datos.
Ejemplo:
Entrada     Salida
0.5         Valor introducido: x = 5.0000000000e-01
            Suma de los cinco t´erminos = 1.648437619e+00
            Valor de Exp (x) = 1.6487212707e+00
*)
    resultado := 0.;
    power_of_x := 1.0;
    write('Ingrese un número entre 0 y 1: ');
    readln(x);
    for i := 0 to 5 do
    begin
        resultado := resultado + power_of_x / fact(i);
        power_of_x := power_of_x * x;
    end;

    writeln('Valor introducido: x = ', x);
    writeln('Suma de los cinco términos = ', resultado);
    writeln('Valor de Exp (x) = ', exp(x));
end;

procedure ejercicio10();
var
    input : Real;
begin
(*
Con el resultado del ejercicio 11 del Pr´actico 1, escriba un programa en Pascal para determinar la ra´ız cuadrada de un n´umero real positivo a mediante el c´alculo de a^0,5. 
El programa deber´a leer el valor para a por la entrada est´andar. Como resultado, exhiba por
la salida est´andar el valor de a, el valor de a^0,5, y el valor de sqrt(a) (el cual se calcular´a con la funci´on predefinida). 
Incluya mensajes de salida con etiquetas descriptivas para el ingreso y el despliegue de datos. 
Ejemplo:
Entrada     Salida
12.7        Valor introducido: a = 1.2700000000e+01
            Raiz cuadrada calculada = 3.5637059362e+00
            Valor de Sqrt (a) = 3.5637059362e+00
*)
    write('Ingrese un valor positivo: ');
    readln(input);
    writeln('Valor introducido: a = ', input);
    writeln('Raiz cuadrada calculada = ', AExpB(input, 0.5));
    writeln('Valor de Sqrt (a) = ', sqrt(input));
end;

begin
    //ejercicio1();
    writeln('---------------------');
    writeln();
    //ejercicio2();
    writeln('---------------------');
    writeln();
    // ejercicio3();
    writeln('---------------------');
    writeln();
    //ejercicio4();
    writeln('---------------------');
    writeln();
    //ejercicio5();
    writeln('---------------------');
    writeln();
    //ejercicio6();
    writeln('---------------------');
    writeln();
    //ejercicio7();
    writeln('---------------------');
    writeln();
    //ejercicio8();
    writeln('---------------------');
    writeln();
    //ejercicio9();
    writeln('---------------------');
    writeln();
    ejercicio10();
    writeln('---------------------');
    writeln();
end.