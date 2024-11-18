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
        tope := MAX_USUARIOS;
    end;
    with authInfo do
    begin
        for i := 1 to MAX_USUARIOS do
            usuarios[i] := obtenerUsuarioClaveVacio();
        tope := MAX_USUARIOS;
    end;
end;

procedure agregarUsuario(us:Texto; cl:clave; var gc:TGestorContrasenia; var authInfo:TAutenticacion; var full,existe:boolean);
begin
end;

procedure agregarServicioUsuario (us:Texto; master: Clave; authInfo : TAutenticacion; servn : Texto; co:Texto; var gc:TGestorContrasenia; var res:TRes);
begin
end;

procedure contraseniaServicio (us : Texto; master : Clave; servn : Texto; gc : TGestorContrasenia; authInfo : TAutenticacion; var res : TRes);
begin
end;

procedure serviciosUsuario(us:Texto;master:Clave;gc:TGestorContrasenia;authInfo:TAutenticacion;var servs:TServicios; var existe:boolean); 
begin
end;
