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
    end;{
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
procedure InformacionLibros(var L:libro);
begin
    LeerLibro(L);
    repeat
        LeerLibro(L);

    until ((L.titulo)<>'Relato de un náufrago')
end;
//_______________________________________________________
var 
    L:libro;}
begin
    WriteLn('Hola mundo');
    //InformacionLibros(L);
end.