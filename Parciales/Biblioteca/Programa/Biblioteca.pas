{
La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la
información de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN
del libro prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31). La
información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se
ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces
que fue prestado. Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y
nro. de socio par.
}
program AmazonBooks;
type 
    prestamo = record
        nroPrestamo:integer;
        ISBN:integer;
        nroSocio:integer;
        diaPrestamo:1..31;
    end;
    lista=^nodo;
    nodo= record
        datos:prestamo;
        sig:lista;
    end;
    Estructura=record
        vecesPrestado:integer;
        ISBN:integer;
    end;
    ListaNueva=^nodoISBN;
    nodoISBN=record
        ISBN:integer;
        cantPrestado:integer;
    end;

//_________________________________________________
procedure LeerPrestamo(var P:prestamo);
begin
    writeln('ISBN: ');ReadLn(P.ISBN);
    if P.ISBN <> -1 then
    begin
        writeln('Nro Prestamo: ');ReadLn(P.nroPrestamo);
        writeln('nro Socio: ');ReadLn(P.nroSocio);
        writeln('Dia Prestamo (1..31): ');ReadLn(P.diaPrestamo);  
    end;
        
end;
//_________________________________________________
procedure Insertar(var L:lista;P:prestamo);
var
    ant,act,nue:lista;
begin
    new(nue);
    nue^.datos:=P;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.datos.ISBN<P.ISBN) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant= act) then
    begin
       L:=nue;   
    end
    else
        begin
            ant^.sig:=nue;  
        end;
    nue^.sig:=act;
end;
//_________________________________________________
procedure ProcesarInfo(var L:lista);
var
    P:prestamo;
begin
    LeerPrestamo(P);
    while P.ISBN <> -1 do
    begin
        Insertar(L,P);
        LeerPrestamo(P);  
    end;
end;
//_________________________________________________
procedure ImprimirLista(L:lista);
begin
    while L <> nil do
    begin
        WriteLn('____________');
        WriteLn('ISBN: ',L^.datos.ISBN);
        WriteLn('nro Prestamo: ',L^.datos.nroPrestamo);
        WriteLn('nro Socio: ',L^.datos.nroSocio);
        WriteLn('diaPrestamo: ',L^.datos.diaPrestamo);
        L:=L^.sig;
    end;
end;
//_________________________________________________
var
    L:lista;
begin
    ProcesarInfo(L);
    WriteLn('_________');
    ImprimirLista(L);
end.