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
program biblioteca;
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
    //________________________
    Estructura=record
        vecesPrestado:integer;
        ISBN:integer;
    end;
    ListaNueva=^nodoISBN;
    nodoISBN=record
        datosISBN:Estructura;
        sigISBN:ListaNueva;
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
procedure agregarAtras(var LN:ListaNueva;pres:integer;ISBN:integer);
var  act, nue : ListaNueva;
begin 
 new (nue);
 nue^.datosISBN.vecesPrestado:= pres;
 nue^.datosISBN.ISBN:=ISBN;
 nue^.sigISBN := NIL;
 if LN <> Nil then begin
                 act := LN ;
                 while  (act^.sigISBN <> NIL ) do act := act^.sigISBN ;
                 act^.sigISBN := nue ;
               end
               else
                 LN:= nue;
end;

//_________________________________________________
procedure ImprimirListaNueva(LN:ListaNueva);
begin
    WriteLn('_________');
    while LN <> nil do
    begin
        WriteLn('ISBN del libro: ',LN^.datosISBN.ISBN);
        WriteLn('Cantidad de veces prestado: ',LN^.datosISBN.vecesPrestado);
        LN:=LN^.sigISBN;
    end;
end;
//_________________________________________________
procedure ProcesarInfo(var L:lista);
var
    P:prestamo;
    LN:ListaNueva;
    actual:integer;
    contPrestado:integer;
begin
    contPrestado:=0;
    LN:=nil;
    LeerPrestamo(P);
    actual:=P.ISBN;
    //
    while  (P.ISBN <> -1) and (actual=P.ISBN)do
        begin
            contPrestado:=contPrestado+1;
            LeerPrestamo(P);
        end;
    if (P.ISBN <> -1) or (contPrestado>1) then
        begin
            WriteLn('Lo que le sumo es: ', contPrestado);
            agregarAtras(LN,contPrestado,P.ISBN);  
        end;
    //Puse todo ese quilombo porque no me leia el primer numero ingresado
    while P.ISBN <> -1 do
    begin
        Insertar(L,P);
        contPrestado:=0;
        actual:=P.ISBN;
        while (P.ISBN <> -1) and (actual=P.ISBN) do
        begin
            contPrestado:=contPrestado+1;
            LeerPrestamo(P);
        end;
        if P.ISBN <> -1 then
        begin
            WriteLn('Lo que le sumo es: ', contPrestado);
            agregarAtras(LN,contPrestado,P.ISBN);  
        end;
    end;
    ImprimirListaNueva(LN);
end;
//_________________________________________________
procedure ImprimirLista(L:lista);//Para imprimir la lista de prestamos
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
    //ImprimirLista(L);
end.