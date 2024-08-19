program ejercicios;

procedure ejercicio5();
var
    resultado1, resultado2, resultado3, resultado5, resultado7  : Integer ;
    resultado4, resultado6, resultado8 : Real;
begin
(*
Para cada una de las siguientes expresiones, determine su tipo y eval´uela (calcule su valor).
i) 6 DIV 2 - 6 MOD 5
ii) 14 MOD 2 * 6 + 3
iii) 3 + 14 MOD (2 * 3)
iv) 3.2 + 14 MOD (2 * 3)
v) 5 MOD 8 + 8 MOD 5
vi) 7 MOD 2 + 13 DIV 3 - 2.5
vii) 6 - 2 MOD (1 + 4) + 5
viii) 6 - 2.1 * 3 + 1
*)
    writeln('--------------------------------------');
    writeln('Empieza a ejecutarse el ejercicio 5: ');
    resultado1 := 6 div 2 - 6 mod 6;
    resultado2 := 14 MOD 2 * 6 + 3;
    resultado3 := 3 + 14 MOD (2 * 3);
    resultado4 := 3.2 + 14 MOD (2 * 3);
    resultado5 := 5 MOD 8 + 8 MOD 5;
    resultado6 := 7 MOD 2 + 13 DIV 3 - 2.5;
    resultado7 := 6 - 2 MOD (1 + 4) + 5;
    resultado8 := 6 - 2.1 * 3 + 1;
    writeln(resultado1); // 3? ok
    writeln(resultado2); // 5? no, 3
    writeln(resultado3); // 5? ok
    writeln(resultado4); // 5.2? ok
    writeln(resultado5); // 8? ok
    writeln(resultado6); // 2.5? ok
    writeln(resultado7); // 9? ok
    writeln(resultado8); // 0.7? ok
    writeln('Terminó de ejecutarse el ejercicio 6');
    writeln('--------------------------------------');
end;

procedure ejercicio6();
var
    acosto, bcosto, ccosto, dcosto: real;
begin
    (*
    Evalúe cada una de las siguientes expresiones:
    i) sqrt (16)
    ii) trunc (-13.8)
    iii) round (10.7)
    iv) sqr (5)
    v) round (-3.5)
    vi) abs (-12)
    vii) trunc (10.1)
    viii) trunc (8.6) - round (8.6)
    ix) sqrt (acosto / bcosto - ccosto + dcosto - 2.5)
    x) trunc (dcosto) * abs (ccosto * (bcosto / acosto))
    *)
    writeln('--------------------------------------');
    writeln('Empieza a ejecutarse el ejercicio 6: ');
    acosto := 4.0;
    bcosto := 1.0;
    ccosto := -2.0;
    dcosto := 5.5;
    writeln(sqrt(16)); // 4? ok, 4.0
    writeln(trunc(-13.8)); // -13? ok
    writeln(round(10.7)); // 11? ok
    writeln(abs(-12)); // 12? ok
    writeln(trunc(10.1)); // 10? ok
    writeln(trunc(8.6) - round(8.6)); // -1? ok
    writeln(sqrt(acosto / bcosto - ccosto + dcosto - 2.5)); // 3.0? ok
    writeln(trunc(dcosto) * abs(ccosto * (bcosto / acosto))); // 2.5? ok
    writeln('Terminó de ejecutarse el ejercicio 6');
    writeln('--------------------------------------');
end;

procedure ejercicio7();
var
    num, suma, total : Integer;
    valor : Real;
    car1, car2 : Char;
begin
(*Determine cuáles de las siguientes instrucciones de asignación son válidas.*)
    num := 10;
    suma := 20;
    total := 30;
    valor := 5.0;
    car1 := '1';
    car2 := '2';
    num := num + num; // válido
    // num := suma / total; // no válido, no lo coerce
    // suma := num / total; // no válido, no lo coerce -> / da double como resultado.
    valor := total; // válido
    valor := total * num + suma; // válido
    // valor := total + car1; // no valido
    car2 := car1; // válido
    // car2 := car1 + 1; // no válido
    // car2 := 'car1'; // no válido, string != char
end;

procedure ejercicio8();
begin
(*
Para cada una de las siguientes expresiones, determine su tipo y evalúela (calcule su valor).
i) 5 + sqr(3) - 4 + trunc(3.6 - 2.1)
ii) 3 * sqrt(8 MOD 6 * 10 DIV 5)
iii) 6 + 9 * 8 DIV 2 * round(1.362) - 2 * 3
iv) trunc(12 / 5 * sqrt(4 + 4 * 3) / 4)
*)
    writeln('--------------------------------------');
    writeln('Empieza a ejecutarse el ejercicio 8: ');

    writeln('5 + sqr(3) - 4 + trunc(3.6 - 2.1): ', 5 + sqr(3) - 4 + trunc(3.6 - 2.1)); // 11? ok
    writeln('3 * sqrt(8 MOD 6 * 10 DIV 5): ', 3 * sqrt(8 MOD 6 * 10 DIV 5)); // 6? ok, 6.0
    writeln('6 + 9 * 8 DIV 2 * round(1.362) - 2 * 3: ', 6 + 9 * 8 DIV 2 * round(1.362) - 2 * 3); // 36? ok
    writeln('trunc(12 / 5 * sqrt(4 + 4 * 3) / 4): ', trunc(12 / 5 * sqrt(4 + 4 * 3) / 4)); // 2? ok

    writeln('Terminó de ejecutarse el ejercicio 8');
    writeln('--------------------------------------');
end ;

procedure ejercicio10();
CONST
    pi = 3.1415926535;
    r1 = 2.0;
    r2 = 5.0;
    medio = 0.5;
VAR
    num, area: Real;
    a, b : Integer;
BEGIN
(*
Para cada uno de los siguientes programas en Pascal, trate de anticipar cuál va a ser la
salida que emitirá al ejecutarlo. Después, ejecútelo en máquina y compare lo que esperaba
con la salida que se exhibe. Ejecute el segundo programa varias veces, y use números tanto
positivos como negativos, con partes fraccionarias mayores, menores, y exactamente iguales
que 0.5. Cuando el programa espere el dato de entrada, introduzca su número real y digite
ENTER.
*)
    writeln('--------------------------------------');
    writeln('Empieza a ejecutarse el ejercicio 10: ');
    writeLn('Muestra 1:');
    // muestra1
    area := pi * r1 * r1;
    writeLn (r1, area);
    area := pi * sqr (r2);
    writeLn (r2, area);

    writeln();

    //muestra 2:
    writeLn('Muestra 2:');
    readLn (num);
    a := round (num);
    b := trunc (num + medio);
    writeLn ('Número ingresado, número redondeado, número + medio trunceado', num, a, b);

    writeln('Terminó de ejecutarse el ejercicio 10');
    writeln('--------------------------------------');
END;

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

procedure ejercicio11();
var
    base : Real;
    exponente : Integer;
    parte1, parte2: Real;
begin
    writeln('--------------------------------------');
    writeln('Empieza a ejecutarse el ejercicio 11: ');

    write('Ingrese la base (a): ');
    readln(base);
    write('Ingrese el exponente (b) ');
    readln(exponente);
    writeln('a^b = ', AExpB(base, exponente));

    writeln('Terminó de ejecutarse el ejercicio 11');
    writeln('--------------------------------------');
end;

begin
    ejercicio5();
    writeln();
    ejercicio6();
    writeln();
    ejercicio8();
    writeln();
    ejercicio10();
    writeln();
    ejercicio11();
end.