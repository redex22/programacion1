program segundo_parcial;

procedure ejercicio1();
const
    MAXPREGUNTA = 3; { valor mayor que 0 }
type
    TOpcion = 'A' .. 'E';
    TRespuesta = record case responde : boolean of
        true : (opcion : TOpcion);
        false: ()
    end;
    RangoPregunta = 1 .. MAXPREGUNTA;
    TRespuestas = array [RangoPregunta] of TRespuesta;
    TCorrectas = array [RangoPregunta] of TOpcion;
var
    respuestas: TRespuestas;
    correctas: TCorrectas;
    puntajeObtenido: real;
function puntaje(respuestas: TRespuestas; correctas: TCorrectas): real;
var
    i: Integer;
    acumulador: Real;
begin
    acumulador := 0;
    for i := 1 to MAXPREGUNTA do
    begin
        if(not respuestas[i].responde) then
            acumulador := acumulador + 0
        else if(respuestas[i].opcion = correctas[i]) then
            acumulador := acumulador + 2
        else
            acumulador := acumulador - 0.5;
    end;
    puntaje := acumulador;
end;
function AlMenosN(n : Integer; opcion : TOpcion; respuestas : TRespuestas) : boolean;
var
    i, cant: Integer;
begin
    i := 1;
    cant := 0;
    while (cant < n) and (i <= MAXPREGUNTA) do
    begin
        if((respuestas[i].responde) and (respuestas[i].opcion = opcion)) then
            cant := cant + 1;
        i := i + 1;
    end;
    AlMenosN := cant >= n;
end;
begin
    respuestas[1].responde := true; respuestas[1].opcion := 'A';
    respuestas[2].responde := true; respuestas[2].opcion := 'B';
    respuestas[3].responde := false;
    correctas[1] := 'A';
    correctas[2] := 'A';
    correctas[3] := 'C';
    puntajeObtenido := puntaje(respuestas, correctas);
    writeln('Puntaje obtenido: ', puntajeObtenido:2:2);
    writeln('Responde al menos 1: ', AlMenosN(1, 'A', respuestas)); { true }
    writeln('Responde al menos 2: ', AlMenosN(2, 'A', respuestas)); { false }
    writeln('Responde al menos 3: ', AlMenosN(3, 'B', respuestas)); { false }
end;

procedure ejercicio2();
type
    Lista = ^TipoCelda;
    TipoCelda = record
        dato: real;
        sig: Lista;
        end;
procedure desplegarLista(list: Lista);
begin
    while list <> nil do
    begin
        write(list^.dato:2:2, ' -> ');
        list := list^.sig;
    end;
    writeln();
end;
procedure NumeroAlCuadrado(var lis : Lista; r : real);
var
    prev, curr: Lista;
    nuevaCelda: Lista;
    presente: Boolean;
begin
    presente := false;
    curr := lis;
    new(nuevaCelda);
    while (not presente) and (curr <> NIL) do
    begin
        if(curr^.dato = r) then
        begin
            curr^.dato := r * r;
            presente := true;
        end;
        prev := curr;
        curr := curr^.sig;
    end;
    if(not presente) then
    begin
        with nuevaCelda^ do
        begin
            dato := r;
            sig := NIL;
        end;
        prev^.sig := nuevaCelda;
    end;
end;
var
    list: Lista;
begin
    new(list);
    list^.dato := 2;
    list^.sig := nil;
    NumeroAlCuadrado(list, 2);
    desplegarLista(list); { 4 -> }
    NumeroAlCuadrado(list, 3);
    desplegarLista(list); { 4 -> 3 -> }
end;

procedure ejercicio3();
const MAX = 4 ; { valor mayor que 1 }
type
    TEntero = record
        digs : array [1..MAX] of '0'..'9';
        tope : 0..MAX;
        end;
function iguales(n, m: TEntero): Boolean;
var
    i: Integer;
    sonIguales: Boolean;
begin
    sonIguales := n.tope = m.tope;
    if(sonIguales) then
    begin
        i := 1;
        while (not sonIguales) and (i <= n.tope) do
        begin
            sonIguales := n.digs[i] = m.digs[i];
            i := i + 1;
        end;
    end;
    iguales := sonIguales;
end;
var
    n: TEntero;
    m: TEntero;
    i: Integer;
begin
    with n do
    begin;
        tope := 4;
        for i := 1 to MAX do
            if(i > 4) then
                digs[i] := '0'
            else
                digs[i] := chr(i + 48);
    end;
    with m do
    begin
        tope := 4;
        for i := 1 to MAX do
            if(i > 4) then
                digs[i] := '0'
            else
                digs[i] := chr(i + 48);
    end;
    writeln('Iguales?: ', iguales(n, m)); { true }
    m.tope := 3;
    writeln('Iguales?: ', iguales(n, m)); { false }
    with m do
    begin
        tope := 4;
        for i := 1 to MAX do
            if(i > 6) then
                digs[i] := '0'
            else
                digs[i] := chr(i + 48);
    end;
    writeln('Iguales?: ', iguales(n, m)); { false }
end;

procedure ejercicio4();
var a,b,c,u : integer;
    function maiz(a: integer) : integer;
    var b: integer;
        procedure trigo(a: integer; var b: integer);
        begin
            b := a + c
        end;
    begin
        trigo(a,b);
        c := b;
        writeln(c);
        maiz := b - a
    end;
    function soja(var a: integer; b: integer) : integer;
        function cebada(c : char) : integer;
        begin
            cebada := 5
        end;
    begin
        a := c + cebada('*');
        writeln(a);
        soja := b - c
    end;
begin
    readln(a);
    b := 9 - a;
    c := b div 2;
    u := soja(a,b);
    writeln(maiz(u))
end;

begin
    writeln('--------------------------------------------------------------');
    writeln('Ejercicio 1: ');
    ejercicio1();
    writeln('--------------------------------------------------------------');
    writeln('Ejercicio 2: ');
    ejercicio2();
    writeln('--------------------------------------------------------------');
    writeln('Ejercicio 3: ');
    ejercicio3();
    writeln('--------------------------------------------------------------');
    writeln('Ejercicio 4: ');
    ejercicio4();
    writeln('--------------------------------------------------------------');
end.
