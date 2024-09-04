program practico3;
type
    Vector = array [1..5] of Integer;
function ceil(x: Real): Integer;
var
    integer_part : Integer;
begin
    integer_part := trunc(x);
    if (x - integer_part > 0) then ceil := integer_part + 1 else ceil := integer_part;
end;

procedure ejercicio1();
var
    p, q, r : Boolean;
begin
(*
(a) Indique cu´ales de las siguientes expresiones booleanas son verdaderas.
□ 0 > 1
□ 'A' < 'Z'
□ TRUE < FALSE
□ ('b' < 'd') and (0 < 1)
□ (5 < 1) or (0 > -1)
(b) Suponiendo que p = TRUE, q = FALSE y r = TRUE, indique cu´ales de las siguientes
expresiones booleanas son verdaderas.
□ not p or q and r
□ q and p or not r
□ not (p and q and r)
*)
    writeln('Parte a:');
    writeln(0 > 1); // falsa
    writeln('A' < 'Z'); // verdadera
    writeln(TRUE < FALSE); // falsa
    writeln(('b' < 'd') and (0 < 1)); // verdadera
    writeln((5 < 1) or (0 > -1)); // verdadera
    
    writeln('Parte b:');
    p := TRUE;
    q := FALSE;
    r := TRUE;
    writeln(not p or q and r); // falso
    writeln(q and p or not r); // falso
    writeln(not (p and q and r)); // verdadero
end;

procedure ejercicio2();
var x : Integer;
begin
(*
Indique el valor de cada una de las siguientes expresiones para x = 0, seg´un el tipo de
evaluaci´on utilizado. Escriba true, false o error seg´un corresponda.

Circuito corto Circuito completo    Expresi´on
                                    (x <> 0) and (abs(x)/x <> 1)
                                    (x = 0) and (abs(x)/x <> 1)
                                    (abs(x)/x <> 1) and (x <> 0)
                                    (x <> 0) or (abs(x)/x <> 1)
                                    (x = 0) or (abs(x)/x <> 1)
                                    (abs(x)/x <> 1) or (x <> 0)
*)
    x := 0;
    writeln((x <> 0) and (abs(x)/x <> 1)); // corto: false, completo: error
    //writeln((x = 0) and (abs(x)/x <> 1)); // corto: no, completo: error
    //writeln((abs(x)/x <> 1) and (x <> 0)); // corto: error?, completo: error 
    //writeln((x <> 0) or (abs(x)/x <> 1)); // corto: no?, completo: error
    writeln((x = 0) or (abs(x)/x <> 1)); // corto: true, completo: error
    //writeln((abs(x)/x <> 1) or (x <> 0)); // corto: error, completo: error
end;

procedure ejercicio3();
var
    calif : Integer;
    califs : Vector;
begin
(*
Considere la siguiente instrucci´on:
    if (calif >= 90) or (calif < 60) then
        write ('Extrema')
    else
        write ('Media')
Indique qu´e valor se exhibe al ejecutarla, seg´un el valor de calif.
calif Resultado
90    'Extrema'
60    'Media'
0     'Extrema'
70    'Media'
-90   'Extrema'
*)
    califs[1] := 90;
    califs[2] := 60;
    califs[3] := 0;
    califs[4] := 70;
    califs[5] := -90;

    for calif in califs do
        if (calif >= 90) or (calif < 60) then
            write ('Extrema - ')
        else
            write ('Media - ');
        // output: Extrema - Media - Extrema - Media - Extrema -
    writeln();
end;

procedure ejercicio4();
var
    a,b,c : Integer;
begin
(*
Suponga que a y b son variables enteras. Considere las siguientes instrucciones if anidadas:
    if a > b then
        if a > c then
            write ('a es el grande')
Escriba una sola instrucción if que sea equivalente a esta pero que no contenga otra instrucción if anidada.
*)
    a := 5;
    b := 4;
    c := 3;
    if (a > b) and (a > c) then
        writeln('a es el más grande como bokita');
end;

procedure ejercicio5();
var x, y: Integer;
begin
(*
Considere el siguiente fragmento de programa:
    x := 7;
    y := 8;
    if x > y then
        x := x + 1
    else
        y := y + 1
Determine el valor que queda en las variables x e y tras su ejecuci´on.
*)
    x := 7;
    y := 8;
    if x > y then
        x := x + 1
    else
        y := y + 1;
    // x = 7 ; y = 9
    writeln('x e y = ', x, y);
end;

procedure ejercicio6();
var x, y, z : Integer;
begin
(* 
 Considere el siguiente programa:
    program Pr3Ej6;
    var x, y, z : Integer;
    begin
        x := 10;
        y := 11;
        z := 12;
        if (x > y) or (z > y) then
        if x > z then
        if y > z then
        writeln ('Termine.')
        else writeln ('No termino aun.')
        else writeln ('Nunca llega aqui.')
    end.
(a) Indique qu´e se exhibir´a en la salida est´andar al ejecutarlo. Despu´es, ejec´utelo en máquina y compare lo que esperaba con la salida que se exhibe.
(b) Reescriba el programa anterior con una indentaci´on adecuada.
(c) Asumiendo que las expresiones booleanas se eval´uan por circuito corto, diga si la
expresi´on z > y es evaluada.
*)
    x := 10;
    y := 11;
    z := 12;
    if (x > y) or (z > y) then
        if x > z then
            if y > z then
                writeln ('Termine.')
            else writeln ('No termino aun.')
        else writeln ('Nunca llega aqui.');
    // (a) 'Nunca llega aqui'
    // (b) 
    // (c) sí porque x > y es false; necesita evaluar lo que está despues del or por sí es true
end;

procedure ejercicio7();
var letra : Char;
begin
(*
Indique qu´e se exhibir´a en la salida est´andar al ejecutar el siguiente fragmento de programa:
    var letra : Char;
    ...
    letra := 'E';
    case letra of
    'A': writeln ('El valor es 1.');
    'E': writeln ('El valor es 5.');
    'I': writeln ('El valor es 9.');
    'O': writeln ('El valor es 15.');
    'U': writeln ('El valor es 21.');
    end
*)
    letra := 'E';
    case (letra) of
    'A': writeln ('El valor es 1.');
    'E': writeln ('El valor es 5.');
    'I': writeln ('El valor es 9.');
    'O': writeln ('El valor es 15.');
    'U': writeln ('El valor es 21.');
    // output: 'El valor es 5.'
    end;
end;

procedure ejercicio8();
var 
    val, k, r, s, t: Integer;
    calif : Char;
begin
(* 
(a) Escriba una instrucci´on case que sea equivalente a las siguientes instrucciones if anidadas. Suponga que todas las variables son de tipo integer.
    if k = 0 then
        r := r + 1
    else
        if k = 1 then
            s := s + 1
        else
            if (k = 2) or (k = 3) or (k = 4) then
                t := t + 2
(b) Escriba una instrucci´on case que sea equivalente a las siguientes instrucciones if anidadas. Suponga que la variable calif es de tipo char.
    if (calif = 'D') or (calif = 'F') then
        writeln ('Trabajo deficiente.')
    else
        if (calif = 'C') or (calif = 'B') then
            writeln ('Buen trabajo.')
        else
            if calif = 'A' then
                writeln ('Trabajo excelente.')
(c) Sea el siguiente fragmento de programa:
    val := 3;
    case val of
    1: writeln ('uno');
    2: writeln ('dos')
    end;
    writeln ('Despues del case');
¿Qu´e sucede en Free Pascal cuando es ejecutado? Suponga que la variable val es de
tipo integer.
1. Aborta.
2. Da un mensaje de error.
3. Despliega el mensaje ’Despues del case’.
4. Sucede otra cosa.
*)
// (a):
    k := 4;
    case k of
    0: r := r+1;
    1: s := s+1;
    2,3,4: t := t+2;
    end;

// (b):
    case calif of
    'D', 'F': writeln('Trabajo deficiente.');
    'C', 'B': writeln('Buen trabajo.');
    'A': writeln('Trabajo excelente.');
    end;

// (c):
    val := 3;
    case val of
    1: writeln ('uno');
    2: writeln ('dos')
    end;
    writeln ('Despues del case');
    // 3. Despliega el mensaje 'Despues del case'
end;

procedure ejercicio9();
var num : Integer;
begin
(* 
Escriba un programa en Pascal que lea de la entrada est´andar un entero de hasta cuatro
cifras y lo despliegue en la salida est´andar con un punto separando la cifra de los millares
(si la hay) de la cifra de las centenas. Su programa no necesita controlar que el entero
ingresado tenga hasta cuatro cifras, asuma que as´ı ser´a. Incluya mensajes de salida con
etiquetas descriptivas para el ingreso de datos.

Ejemplos
Ingrese un n´umero decimal de a lo sumo 4 cifras: 1234
1.234
Ingrese un n´umero decimal de a lo sumo 4 cifras: 3004
3.004
Ingrese un n´umero decimal de a lo sumo 4 cifras: 7084
7.084
Ingrese un n´umero decimal de a lo sumo 4 cifras: 567
567
Ingrese un n´umero decimal de a lo sumo 4 cifras: 23
23
*)
    write('Ingrese un número decimal de a lo sumo 4 cifras: ');
    readln(num);
    if(num > 999) then
        writeln((num / 1000):1:3)
    else
        writeln(num);
end;

procedure ejercicio10();
const
    costo = 77;
    costo_adicional = 56;
var
    peso : Real;
    datos_entrada: array[1..5] of Real = (0.50, 1.00, 1.01, 3.00, 3.40);
begin
(* El costo de enviar por correo un paquete es
    - $77 para paquetes que pesan hasta un kilogramo (inclusive)
    - $77 m´as $56 por kilogramo adicional o fracci´on para paquetes que pesan m´as de un kilogramo.
Escriba un programa en Pascal que, lea de la entrada est´andar el peso de un paquete como
un n´umero real de kilogramos y exhiba en la salida est´andar dicho peso junto al costo del
env´ıo, seg´un se muestra en los siguientes ejemplos. Incluya mensajes de salida con etiquetas
descriptivas para el ingreso y el despliegue de datos. *)
    //write('Ingrese peso del paquete: ');
    //readln(peso);
    writeln('Peso', ^i, ^i, 'Costo');
    for peso in datos_entrada do
        if(peso <= 1) then
            writeln(peso:1:2, ^i, costo)
        else if(peso < 2) then
            writeln(peso:1:2, ^i, costo + costo_adicional)
        else
            writeln(peso:1:2, ^i, costo + costo_adicional * ceil(peso - 1));
end;

begin
    ejercicio1();
    writeln('--------------------');
    ejercicio2();
    writeln('--------------------');
    ejercicio3();
    writeln('--------------------');
    ejercicio4();
    writeln('--------------------');
    ejercicio5();
    writeln('--------------------');
    ejercicio6();
    writeln('--------------------');
    ejercicio7();
    writeln('--------------------');
    ejercicio8();
    writeln('--------------------');
    //ejercicio9();
    //writeln('--------------------');
    ejercicio10();
    writeln('--------------------');
    
end.