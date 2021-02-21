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
    cantPubli : integer;
begin
    LeerPubli(P);
    while (P.dni <> 0) do
    begin
        cantPubli:=0;
        actual := P.dni;
        while (P.dni = actual) do
        begin
            cantPubli:=cantPubli+1;
            vc[P.tipoPublic]:=vc[P.tipoPublic]+1;
            LeerPubli(P);
        end;
        WriteLn('La cantidad de publicaciones precentadas es: ', cantPubli);
    end;
end;
//____________________________________________________
procedure MayorPublicaciones(var vc:Vector_public);
var
    i:tipo;
    mayor:integer;
begin
    mayor:=-1;
    for i:=1 to 12 do
    begin
        if (vc[i] > mayor) then
        begin
            mayor := i;
        end;
    end;
    WriteLn('El tipo de publicacion con mayor cantidad de publicaciones es: ', mayor);
end;
//____________________________________________________
var
    vcontador : Vector_public;
begin
    LeerPublicaciones(vcontador);
    MayorPublicaciones(vcontador);
    
end.