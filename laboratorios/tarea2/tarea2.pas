procedure print(text: Texto);
var
    i: Integer;
begin
    for i:= 1 to text.tope do
        write(text.tex[i]);
    writeln();
end;

function obtenerClaveVacia(): Clave;
var
    claveVacia: Clave;
    i: Integer;
begin
    with claveVacia do
    begin
        for i := 1 to MAX_LARGO_CLAVE do
            cla[i] := ' ';
        tope := MAX_LARGO_CLAVE;
    end;
    obtenerClaveVacia := claveVacia;
end;

function obtenerTextoVacio(): Texto;
var
  textoVacio: Texto;
  i: Integer;
begin
  with textoVacio do
  begin
    for i := 1 to MAX_LARGO_TEXTO do
        tex[i] := ' ';
  end;
  obtenerTextoVacio := textoVacio;
end;

function obtenerUsuarioVacio(): TUsuario;
var
    usuarioVacio: TUsuario;
begin
    usuarioVacio.usuario := obtenerTextoVacio();
    usuarioVacio.serviciosUsuario := NIL;
    obtenerUsuarioVacio := usuarioVacio;
end;

function obtenerUsuarioClaveVacio(): TUsuarioClave;
var
    usuarioClaveVacio: TUsuarioClave;
begin
    usuarioClaveVacio.usuario := obtenerTextoVacio();
    usuarioClaveVacio.desp := 1;
    usuarioClaveVacio.masterCifrada := obtenerClaveVacia();
    obtenerUsuarioClaveVacio := usuarioClaveVacio;
end;

function posicionEnAlfabeto(letra: Char): Integer;
begin
    case letra of
        'a'..'z':
            posicionEnAlfabeto := ord(letra) - 97;
        'A'..'Z':
            posicionEnAlfabeto := ord(letra) - 65;
        else
            posicionEnAlfabeto := 0;
    end;
end;

procedure cifradoVigenere (textoPlano:Texto;cl:Clave; var textoCifrado:Texto);
var
    idxTexto, idxClave, posicionAlfabetica: Integer;
begin
    textoCifrado.tope := textoPlano.tope;
    idxClave := 1;
    for idxTexto := 1 to textoPlano.tope do
    begin
        posicionAlfabetica := posicionEnAlfabeto(cl.cla[idxClave]);
        textoCifrado.tex[idxTexto] := sustituirLetra(textoPlano.tex[idxTexto], posicionAlfabetica);
        if(idxClave < cl.tope) then
            idxClave := idxClave + 1
        else
            idxClave := 1;
    end;
end;

procedure descifradoVigenere (textoCifrado:Texto;cl:Clave; var textoPlano:Texto);
var
    idxTexto, idxClave, posicionAlfabetica: Integer;
begin
    textoPlano.tope := textoCifrado.tope;
    idxClave := 1;
    for idxTexto := 1 to textoCifrado.tope do
    begin
        posicionAlfabetica := posicionEnAlfabeto(cl.cla[idxClave]);
        textoPlano.tex[idxTexto] := sustituirLetra(textoCifrado.tex[idxTexto], -posicionAlfabetica);
        if(idxClave < cl.tope) then
            idxClave := idxClave + 1
        else
            idxClave := 1;
    end;
end;

procedure crearGestor(var gc:TGestorContrasenia; var authInfo : TAutenticacion);
var
    i : Integer;
begin
    with gc do
    begin
        for i := 1 to MAX_USUARIOS do
            usuarios[i] := obtenerUsuarioVacio();
        tope := 0;
    end;
    with authInfo do
    begin
        for i := 1 to MAX_USUARIOS do
            usuarios[i] := obtenerUsuarioClaveVacio();
        tope := 0;
    end;
end;

procedure agregarUsuario(us:Texto; cl:clave; var gc:TGestorContrasenia; var authInfo:TAutenticacion; var full,existe:boolean);
var
    i: Integer;
    nuevoUsuario: TUsuario;
begin
    full := gc.tope = MAX_USUARIOS;
    i := 1;
    existe := false;
    while (i <= gc.tope) and (not existe) do
    begin
        existe := igualTexto(us, gc.usuarios[i].usuario);
        i := i + 1;
    end;
    if not (full or existe) then
    begin
        with gc do
        begin
            nuevoUsuario.usuario := us;
            nuevoUsuario.serviciosUsuario := NIL;
            tope := tope + 1;
            usuarios[tope] := nuevoUsuario;
        end;
        agregarInfoAutenticacion(us, cl, authInfo);
    end;
end;

procedure agregarServicioUsuario (us:Texto; master: Clave; authInfo : TAutenticacion; servn : Texto; co:Texto; var gc:TGestorContrasenia; var res:TRes);
var
    respAuth: TRespAutenticacion;
    i: Integer;
    existe: Boolean;
    nuevoSrv, currSrv, prevSrv: TServicios;
begin
    autenticarUsuario(us, master, authInfo, respAuth);
    with gc do
    begin
        i := 1;
        while (i <= tope) and (not igualTexto(us, usuarios[i].usuario)) do
            i := i + 1;
        new(nuevoSrv);
        currSrv := usuarios[i].serviciosUsuario;
        prevSrv := usuarios[i].serviciosUsuario;
        existe := false;
        while(currSrv <> nil) and (not existe) do
        begin
            existe := igualTexto(servn, currSrv^.nombreServicio);
            prevSrv := currSrv;
            currSrv := currSrv^.sig;
        end;
        currSrv := prevSrv;
        if not respAuth.autenticacionOK then
            res.resp := nocontra
        else if existe then
            res.resp := noserv
        else
        begin
            res.resp := serv;
            res.cserv := servn;
            nuevoSrv^.nombreServicio := servn;
            nuevoSrv^.sig := nil;
            cifradoVigenere(co, respAuth.master, nuevoSrv^.contraServCifrada);
            if(currSrv = nil) then
                usuarios[i].serviciosUsuario := nuevoSrv
            else
                currSrv^.sig := nuevoSrv;
        end;
    end;
end;

procedure contraseniaServicio (us : Texto; master : Clave; servn : Texto; gc : TGestorContrasenia; authInfo : TAutenticacion; var res : TRes);
var
    respAuth: TRespAutenticacion;
    i: Integer;
    existe: Boolean;
    currSrv, prevSrv: TServicios;
begin
    autenticarUsuario(us, master, authInfo, respAuth);
    with gc do
    begin
        i := 1;
        while (i <= tope) and (not igualTexto(us, usuarios[i].usuario)) do
            i := i + 1;
        currSrv := usuarios[i].serviciosUsuario;
        prevSrv := usuarios[i].serviciosUsuario;
        existe := false;
        while(currSrv <> nil) and (not existe) do
        begin
            existe := igualTexto(servn, currSrv^.nombreServicio);
            prevSrv := currSrv;
            currSrv := currSrv^.sig;
        end;
        currSrv := prevSrv;
        if not respAuth.autenticacionOK then
                res.resp := nocontra
        else if not existe then
            res.resp := noserv
        else
        begin
            res.resp := serv;
            descifradoVigenere(currSrv^.contraServCifrada, respAuth.master, res.cserv);
        end;
    end;
end;

procedure serviciosUsuario(us:Texto;master:Clave;gc:TGestorContrasenia;authInfo:TAutenticacion;var servs:TServicios; var existe:boolean); 
var
    respAuth: TRespAutenticacion;
    i: Integer;
begin
    autenticarUsuario(us, master, authInfo, respAuth);
    existe := respAuth.autenticacionOK;
    if existe then
    begin
        with gc do
        begin
            i := 1;
            while (i <= tope) and (not igualTexto(us, usuarios[i].usuario)) do
                i := i + 1;
            servs := usuarios[i].serviciosUsuario;
            while(servs <> nil) and (not existe) do
            begin
                print(servs^.nombreServicio);
                servs := servs^.sig;
            end;
        end;
    end;
end;
