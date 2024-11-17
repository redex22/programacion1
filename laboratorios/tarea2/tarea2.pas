procedure cifradoVigenere (textoPlano:Texto;cl:Clave; var textoCifrado:Texto);
begin
end;

procedure descifradoVigenere (textoCifrado:Texto;cl:Clave; var textoPlano:Texto);
begin
end;

procedure crearGestor(var gc:TGestorContrasenia; var authInfo : TAutenticacion);
begin
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
