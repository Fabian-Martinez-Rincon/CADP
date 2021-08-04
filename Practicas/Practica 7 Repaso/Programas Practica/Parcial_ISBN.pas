{La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de préstamos de
 libros efectuados en marzo de 2020. Para ello, se debe leer la información de los préstamos realizados. De cada préstamo
  se lee: nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31).
   La
información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se ingresa el ISBN -1
 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
 Esta estructura debe quedar ordenada por ISBN de libro.
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
    cadISBN =record   
        CantPrestado:integer;
        ISBN:integer;
    end;
    lista=^nodo;
    nodo=record
        datos:prestamo;
        sig:lista;
    end;
    listaNueva=^nodoN;
    nodoN=record
        datosN:cadISBN;
        sigN:listaNueva;
    end;
    
//___________________________________________________
procedure LeerP(var P:prestamo);
begin
    writeln('ISBN:');readln(P.ISBN);
    if P.ISBN <> -1 then
    begin
        writeln('Nro Prestamo');readln(P.nroPrestamo);
        writeln('Nro Socio');readln(P.nroSocio);
        writeln('Dia Prestado');readln(P.dia_Prestamo);
    end;
end;
//___________________________________________________
procedure agregarAtraz(ISBN:integer;cantidad:integer;var LN:listaNueva);
var
    act,nue:listaNueva;
begin
    new(nue);
    nue^.datosN.ISBN:=ISBN;
    nue^.datosN.CantPrestado:=cantidad;
    nue^.sigN:=nil;
    if (LN <> nil) then
    begin
        act:=LN;
        while act^.sigN <> nil do
        begin
            act:=act^.sigN;
        end;
        act^.sigN:=nue;
    end
    else
        begin
            LN:=nue;
        end;
end;
//___________________________________________________
procedure imprimirListaNueva(LN:listaNueva);
begin
    while LN<>nil do
    begin
        writeln('ISBN ',LN^.datosN.ISBN);
        writeln('Cantidad de veces prestado ',LN^.datosN.CantPrestado);  
        LN:=LN^.sigN;
    end;
end;
//___________________________________________________
procedure imprimirLista(L:lista);
begin
    while L<>nil do
    begin
        writeln('nro prestamo ',L^.datos.nroPrestamo);
        writeln('ISBN ',L^.datos.ISBN);
        writeln('nro Socio ',L^.datos.nroSocio);
        writeln('dia ',L^.datos.dia_Prestamo);
    end;
end;
//___________________________________________________
procedure leerInfo(var L:lista);
var
    actual:integer;
    P:prestamo;
    cant:integer;
    Lnueva:listaNueva;
begin
    Lnueva:=nil;
    LeerP(P);
    while (P.ISBN  <> -1) do
    begin
        writeln('probando1');
        actual:=P.ISBN;
        cant:=0;
        while (P.ISBN <> -1) and (actual=P.ISBN) do
        begin
            writeln('probando1');
            cant:=cant+1;
            LeerP(P);
        end;
        if (P.ISBN <> -1) then
        begin
            agregarAtraz(P.ISBN,cant,Lnueva);
        end;
    end;
    imprimirListaNueva(Lnueva);
    writeln('Funca');
    imprimirLista(L);
end;
//___________________________________________________
var
    L:lista;
    
begin
    L:=nil;
    leerInfo(L);
    
end.
