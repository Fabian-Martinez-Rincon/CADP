program hola;
type
    tipo = 1..12;
    cadena20 = string[20];
    publicacion = record
        titulo : cadena20;
        nombre : cadena20;
        dni : integer;
        tipoPublic : tipo;
    end;
    Vector_public = Array [tipo] of integer;
//____________________________________________________
procedure LeerPubli(var P: publicacion);
begin
    WriteLn('DNI: ');    ReadLn(P.dni);
    if (P.dni <> 0) then
    begin
        WriteLn('Titulo: ');    ReadLn(P.titulo);
        WriteLn('Nombre: ');    ReadLn(P.nombre);
        WriteLn('Tipo: ');    ReadLn(P.tipoPublic);
    end;
end;
//____________________________________________________
procedure LeerPublicaciones(var vc:Vector_public);
var
    P:publicacion;
    actual: integer;
begin
    LeerPubli(P);
    while (P.dni <> 0) do
    begin
        actual = 
        vc[P.tipoPublic]:=vc[P.tipoPublic]+1;

        LeerPubli(P);
    end;
end;
//____________________________________________________
var
    vcontador : Vector_public;
begin
    LeerPublicaciones(vcontador);
    
end.