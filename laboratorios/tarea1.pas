program tarea1;
function sustituirLetra(letra : char; desplazamiento : integer): char;
var
    ord_letra : integer;
begin
    ord_letra := ord(letra);
    // chequear que el ord ascii se encuentre en el intervalo A-Z o a-z
    if(ord_letra > 96) and (ord_letra < 123) then
        ord_letra := 97 + (ord_letra - 97 + desplazamiento) mod 26
    else if(ord_letra > 64) and (ord_letra < 91) then
        ord_letra := 65 + (ord_letra - 65 + desplazamiento) mod 26; // si no esta en los intervalos, no es una letra.
    // devolver la letra con el cambio de posición.
    sustituirLetra := char(ord_letra);
end;
procedure procesarMensaje(clave: integer; accion: char);
const
    codificar: char = 'C';
    decodificar: char = 'D';
var
    caracter: char;
    n_iter: integer;
begin
    
    // asegurar que si se quiere decodificar se utilizará el opuesto y viceversa
    if(accion = decodificar) then
        clave := abs(clave) * -1
    else if(accion = codificar) then
        clave := abs(clave)
    else
        begin
        writeln('Solo se aceptan "C" y "D" como acciones. Intente de nuevo.');
        halt(-1);
        end;

    write('Ingrese el mensaje que desea procesar seguido de un punto ("."): ');
    n_iter := 0;
    repeat
        read(caracter);
        if(n_iter = 0) then
            // Imprimir el mensaje descriptivo unicamente en la primera iteración y cambiar el msj dependiendo de la accion
            if(accion = codificar) then
                write('El mensaje cifrado es: ')
            else
                write('El mensaje descifrado es: ');
            n_iter := 1;
        write(sustituirLetra(caracter, clave));
    until (caracter = '.');
    writeln();
end;
var
    clave: integer;
    accion: char;
begin
    write('Ingrese la clave: ');
    readln(clave);
    write('Ingrese la letra "C" para cifrar o "D" para descifrar: ');
    readln(accion);
    procesarMensaje(clave, accion);
end.