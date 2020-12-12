program Parcial;
const
    gen = 8;
type
    rangoGen = 1..gen;
    pelicula = record
        codigo:integer;
        nombre:string;
        codGenero:rangoGen;
        puntajePromedio:real;
    end;
    ListaPeliculas = ^nodoP;
    nodoP = record
        datos:pelicula;
        sig:ListaPeliculas;
    end;
    critica = record
        dni:integer;
        apeYnom:string;
        codigo:integer;
        puntaje:real;
    end;
//_______________________________________________
procedure LeerCritica(var c:critica);
begin
    readln(c.codigo);
    if c.codigo <> -1 then
    begin
        readln(c.dni);
        readln(c.apeYnom);
        readln(c.puntaje);  
    end;
    
end;
//_______________________________________________
procedure actualizar(var lp:ListaPeliculas);
var
    promedio:real;
    totPuntaje:real;
    cantCriticas:integer;
    c:critica;
    actual:integer;
begin
    LeerCritica(c);
    while c.codigo <> -1 do
    begin
        actual:=c.codigo;
        promedio:=0;
        totPuntaje:=0;
        cantCriticas:=0;
        while actual:=c.codigo do
        begin
            totPuntaje:=totPuntaje+c.puntaje;
            cantCriticas:=cantCriticas+1;
            LeerC(c);
        end;
        promedio:=totPuntaje/cantCriticas;
        agregarAtras(lp,promedio);
    end;
end;
//_______________________________________________
var
    lp:ListaPeliculas;
    pri:ListaPeliculas;
begin
    lp:=nil;
    cargarPeliculas(lp,pri);//Se dispone
    actualizar(lp,pri);
end.