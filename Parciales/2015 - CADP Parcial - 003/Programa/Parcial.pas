program CADPParcial;
type
    cadena=string[40];
    pelicula = record
        cod:integer;
        nombre:cadena;
        genero:1..8;
        puntProm:real;
    end;
    listaPeliculas = ^nodoP;
    nodoP=record
        datosP:pelicula;
        sigP:listaPeliculas;
    end;
    critica=record
        dni:integer;
        apellYNombre:cadena;
        codPel:integer;
        puntuaje:real;
    end;
//___________________________________________________________
procedure ActualizarLP(var LP);
var
    C:critica;
//___________________________________________________________
var
    LP:listaPeliculas;
begin
    LP:=Nil;
    //CargarListaPeliculas(LP);//Se dipone
    ActualizarLP(LP);
end.