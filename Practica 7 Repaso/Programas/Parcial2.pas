{
}
program Parcial;
const
    dimF=5000;
type
    anioV=1900..2021;
    mesV=1..12;
    cadena20=string[20];
    Libro = record
        codigo:1..5000;
        codMaterie:1..7;
        titulo:cadena20;
        anio:anio;
        precio:real;
        apellido:cadena20;
    end;
    vector_libros= array [1..dimF] of Libro;
    venta =record
        codigo:integer;
        dni:integer;
        mes:mesV;
        anio:anioV;
    end;
//_________________________________________________
procedure LeerLibro(L:Libro);
begin
    ReadLn(L.codigo);
    ReadLn(L.codMaterie);
    ReadLn(L.titulo);
    ReadLn(L.anio);
    ReadLn(L.precio);
    ReadLn(L.apellido);
end;
//_________________________________________________
procedure AgregarOrdenado(var V:vector_libros;dimL:integer;Elemento:Libro; pos:integer);
var
    i:integer;
begin
    if (pos>1) and (pos<dimL) then
    begin
        for i:=pos downto pos to
    end;
end;
//_________________________________________________
procedure LeerYAlmacenar(var A:vector_libros);
var
    i:integer;
    dimL:integer;
begin
    dimL:=0;
    pos:=0;
    for i:=1 to dimF do
    begin
        LeerLibro(A[i]);
        AgregarOrdenado(A,i,A[i],i);
        dimL:=i;
    end;
end;
//_________________________________________________
var
    A:vector_libros;
begin
    LeerYAlmacenar(A);
end.