program practico3;

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

begin
    ejercicio1();
    writeln('--------------------');
    ejercicio2();
    writeln('--------------------');
    
end.