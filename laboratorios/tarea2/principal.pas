program GestorContrasenias;

{ Con esta directiva queda incluido el archivo definiciones.pas }
{$INCLUDE definiciones.pas}

{ Con esta directiva queda incluido el archivo tarea2.pas }
{$INCLUDE tarea2.pas}


procedure leerOpcion(var opcion: integer);
begin
   writeln('--------------------------------');
   writeln('Ingrese Opción');
   writeln('--------------------------------');
   writeln('0=fin');
   writeln('1=Cifrar contraseña');
   writeln('2=Descifrar contraseña');
   writeln('3=Agregar usuario');
   writeln('4=Agregar servicios de usuario');
   writeln('5=Recuperar contraseña de servicio de un usuario');
   writeln('6=Listar servicios de usuario');
   writeln('--------------------------------');
   readln(opcion);
end;

var
   opcion,i                 : integer;
   gc                       : TGestorContrasenia;
   authInfo                 : TAutenticacion;
   us,co,nserv              : Texto;
   textoPlano,textoCifrado  : Texto;
   cl,master                : clave;
   full, existe             : boolean;
   res                      : TRes;
   servs                    : TServicios;

begin
  { Reinicializamos el randomizador}
    Randomize;
  { inicializo el gestor}
   crearGestor(gc,authInfo);

   repeat
      leerOpcion(opcion);
      case opcion of
        { mostrar }
        0 : writeln('Ejecución finalizada.');

        { Cifrar contraseña }
        1   :
             begin
                write('Ingrese el texto a cifrar (máximo ', MAX_LARGO_TEXTO:0, ' caracteres terminando en .):');
                leerTexto(textoPlano);
                // Lectura de clave
                write('Ingrese la clave para cifrar (máximo ', MAX_LARGO_CLAVE:0, ' caracteres terminando en .):');
                leerClave(cl);
                cifradoVigenere(textoPlano,cl,textoCifrado);
                desplegarTexto(textoCifrado)
             end;

        { Descifrar contraseña }
        2   : begin
               write('Ingrese el texto a descifrar (máximo ', MAX_LARGO_TEXTO:0, ' caracteres terminando en .):');
               leerTexto(textoCifrado);
               write('Ingrese la clave para descifrar (máximo ', MAX_LARGO_CLAVE:0, ' caracteres terminando en .):');
               leerClave(cl);
               descifradoVigenere(textoCifrado,cl,textoPlano);
               desplegarTexto(textoPlano)
              end;       

        { Agregar usuario }
        3   : begin
                write('Ingrese usuario: ');
                leerTexto(us);
                write('Ingrese contraseña maestra: ');
                leerClave(master);
                agregarUsuario(us,master,gc,authInfo,full, existe);
                if full 
                then 
                    writeln('El gestor está lleno, no se pueden agregar más usuarios')
                else 
                    if existe then writeln('El usuario ya existe, no se agrega nuevamente')
                    else writeln('Usuario agregado al gestor de contraseñas')
              end;

        { Agregar servicios de usuario }
        4   : begin
                write('Ingrese usuario: ');
                leerTexto(us);
                write('Ingrese contraseña maestra: ');
                leerClave(master);
                repeat
                    i := 0;
                    write('Ingrese nombre de servicio: ');
                    leerTexto(nserv);
                    write('Ingrese contraseña para el servicio: ');
                    leerTexto(co);
                    agregarServicioUsuario(us,master,authInfo,nserv,co,gc,res);
                    case res.resp of
                        serv     :
                                    begin
                                        write('Se ha agregado con éxito el servicio: ');
                                        desplegarTexto(nserv);
                                        writeln('Para finalizar ingreso de servicios digitar 0, si desea continuar digite 1: ');
                                        readln(i)
                                    end;
                        noserv   : writeln('Servicio ya existe, no fue agregado');
                        nocontra : writeln('Usuario no existente o contraseña ingresada es incorrecta')
                    end;
                until i = 0
            end;
             
        { Contraseña de Servicio de usuario }
        5  :
             begin
                write('Ingrese usuario: ');
                leerTexto(us);
                write('Ingrese contraseña maestra del usuario: ');
                leerClave(master); 
                write('Ingrese servicio de usuario: ');
                leerTexto(nserv); 
                contraseniaServicio(us,master,nserv,gc,authInfo,res);
                case res.resp of
                    noserv : writeln('El servicio no está ingresado para este usuario');
                    nocontra : writeln('La contraseña es incorrecta');
                    serv : desplegarTexto(res.cserv)
                    end
             end;


        { Listar servicios de usuario }
        6   :
             begin
                write('Ingrese usuario: ');
                leerTexto(us);
                desplegarTexto(us);
                write('Ingrese contraseña maestra del usuario: ');
                leerClave(master); 
                serviciosUsuario(us,master,gc,authInfo,servs,existe);
                if existe
                then 
                    if servs = nil then 
                        begin
                            writeln();
                            writeln('No hay servicios ingresados para el usuario');
                        end
                    else 
                        begin   
                            writeln();
                            writeln('Los servicios son: ');
                            desplegarServicios(servs);
                        end
                else writeln('Contraseña incorrecta o usuario no válido')
             end;

        else writeln ('Opción inexistente')
       end
   until opcion = 0;
end.