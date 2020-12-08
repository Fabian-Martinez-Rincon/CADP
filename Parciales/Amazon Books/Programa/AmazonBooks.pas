{
La tienda de libros Amazon Books está analizando información de algunas editoriales. Para
ello, Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los
libros (Arte y Cultura, Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de
edición, cantidad de veces que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título
“Relato de un náufrago” (que debe procesarse) y devuelva en una estructura de
datos adecuada para la editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos
los libros con más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre
de la editorial y el título de cada libro con más de 250 ventas
}
program AmazonBooks;
type
    cadena20=string[40];
    tematicas = array [1..35] of cadena20;
    libro=record
        titulo:cadena20;
        editorial:cadena20;
        cantPaginas:integer;
        anioEdic:1..2021;
        cantVendido:integer;
        codTematica:1..35;
    end;
    //_________________________________
    Ventas=record
        titulo:cadena20;
        nomTematica:cadena20;
        cantPaginas:integer;
    end;
    lista=^nodo;
    nodo=record
        datos:Ventas;
        sig:lista;
    end;
    estructura=record
        editorial:cadena20;
        anioAntiguo:1..2021;
        cantEditados:integer;
        cantVentas:integer;
        Detalle:lista;
    end;

//_______________________________________________________
procedure LeerLibro(var L:libro);
begin
    writeln('Titulo: ');        ReadLn(L.titulo);
    writeln('Editorial: ');     ReadLn(L.editorial);
    writeln('Paginas: ');       ReadLn(L.cantPaginas);
    writeln('Anio Edicion: ');  ReadLn(L.anioEdic);
    writeln('Cant Ventas: ');   ReadLn(L.cantVendido);
    writeln('Cod Tematica: ');  ReadLn(L.codTematica);
end;
//_______________________________________________________
procedure AgregarAdelante(var LN:lista;titulo:cadena20;NomTemat:cadena20;Paginas:integer);
var
    nue:lista;
begin
    new(nue);
    nue^.datos.titulo:=titulo;
    nue^.datos.nomTematica:=NomTemat;
    nue^.datos.cantPaginas:=Paginas;
    nue^.sig:=LN;
    LN:=nue;
end;
//_______________________________________________________
procedure A(var E:estructura;lib:libro);
var
    vt:tematicas;
begin
    E.editorial:=lib.editorial;
    if lib.anioEdic<E.anioAntiguo then
    begin
        E.anioAntiguo:=lib.anioEdic;
    end;
    E.cantEditados:=E.cantEditados+1;
    E.cantVentas:=E.cantVentas+lib.cantVendido;
    if (lib.cantVendido > 250) then
    begin
        AgregarAdelante((E.Detalle),lib.titulo,vt[lib.codTematica],lib.cantPaginas);
    end;
end;
//_______________________________________________________
procedure InformacionLibros(var E:estructura);
var
    Lib:libro;
begin
    LeerLibro(Lib);
    E.anioAntiguo:=9999;
    repeat
        if (Lib.editorial = 'Planeta Libros') then
        begin
            A(E,Lib);
        end;
        LeerLibro(Lib);
    until ((Lib.titulo)<>'Relato de un náufrago')
end;
//_______________________________________________________
procedure ImprimirA(E:estructura);
begin
    while ((E.Detalle) <> Nil) do
    begin
        if (E.cantVentas > 250) then
        begin
            writeln('Editorial: ',E.editorial);E.editorial;
            WriteLn('Titulo:',(E.Detalle)^.datos.titulo )
        end;  
        (E.Detalle):=(E.Detalle)^.sig;
    end;
    
    
end;
//_______________________________________________________
var 
    E:estructura;
begin
    InformacionLibros(E);
    ImprimirA(E);
end.