{La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31). La
información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado. Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y
nro. de socio par.
}
program Parcial;
type
    dia=1..31;
    prestamo =record   
        nroPrestamo:integer;
        ISBN:integer;
        nroSocio:integer;
        dia_Prestamo:dia;
    end;
    lista=^nodo;
    nodo=record
        datos:prestamo;
        sig:lista;
    end;
//___________________________________________________
procedure LeerP(var P:prestamo);
begin
    readln(P.ISBN);
    if P.ISBN <> -1 then
    begin
        readln(P.nroPrestamo);
        readln(P.nroSocio);
        readln(P.dia_Prestamo);
    end;
end;
//___________________________________________________
procedure leerInfo(var L:lista);
var
    actual:integer;
    P:prestamo;
    cant:integer;
begin    
    cant:=0;
    LeerP(P);
    while P.ISBN  <> -1 do
    begin
        actual:=L^.datos.ISBN;
        while (P.ISBN <> -1) and (actual=L^.datos.ISBN) do
        begin
            cant:=cant+1;
        end;
    end;
end;
//___________________________________________________
var
    L:lista;
    
begin
    L:=nil;
    leerInfo(L);
    
end.
