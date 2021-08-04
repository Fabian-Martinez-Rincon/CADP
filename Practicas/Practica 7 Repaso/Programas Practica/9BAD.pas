{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por  las críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como parámetro (el mismo puede no existir).
}
program JugamosConListas;
type
    cadena15=string[15];
    pelicula =record   
        codPeli:integer;
        titulo:integer;
        Codigo:-1..8;
        puntuajeProm:real; 
    end;
    critica= record
        DNI:integer;
        apellido:cadena15;
        nombre:cadena15;
        CodigoC:integer;
        puntuajeC:real;
    end;
    Lista=^nodo;
    nodo= record
        Datos:critica;
        sig:Lista;
    end;
    ListaPel=^nodoP;
    nodoP=record
        DatosP:pelicula;
        sigP:ListaPel;
    end; 
    promedios = record
        prom:real;
        codPeli:integer;
    end;
    ListaProm=^nodoProm;
    nodoProm=record
        DatosProm:promedios;
        sigProm:ListaProm;
    end; 
    vector_contador = array [1..8] of Real;

//___________________________________________________
procedure LeerCritica(var C:critica);
begin
    writeln('DNI');readln(C.DNI);
    writeln('Apellidp');readln(C.apellido);
    writeln('Nombre');readln(C.nombre);
    writeln('Codigo');readln(C.CodigoC);
    writeln('Puntuaje');readln(C.puntuajeC);
end;
//___________________________________________________
procedure InsertarOrdenado(var L:Lista;C:critica);
var
    ant,nue,act:Lista;
begin
    new(nue);
    nue^.Datos:=C;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.Datos.CodigoC<C.CodigoC) do
    begin
        ant:=act;
        act:=act^.sig;  
    end;
    if (ant= act)then
    begin
      L:=nue;
    end
    else
        begin
            ant^.sig:=nue;
        end;
    nue^.sig:=act;
end;
//___________________________________________________
procedure InicializarVector(var vc:vector_contador);
var
    i:integer;
begin
    for i:=1 to 8 do
    begin
        vc[i]:=0;
    end;
end;
//___________________________________________________
procedure agregarListaNueva(var LN:ListaProm;codigo:integer;promedio:real);
var
    ant,nue,act:ListaProm;
begin
    new(nue);
    nue^.DatosProm.codPeli:=codigo;
    nue^.DatosProm.prom:=promedio;
    act:=LN;
    ant:=LN;
    while (act <> nil) and (act^.DatosProm.codPeli<codigo) do
    begin
        ant:=act;
        act:=act^.sigProm;  
    end;
    if (ant= act)then
    begin
      LN:=nue;
    end
    else
        begin
            ant^.sigProm:=nue;
        end;
    nue^.sigProm:=act;
end;
//___________________________________________________
procedure imprimirListaNueva(LN:ListaProm);
begin
    while LN <> nil do
    begin
        WriteLn('Promedio',LN^.DatosProm.prom:2:2);
        WriteLn('Codigo Pelicula',LN^.DatosProm.codPeli:2);
        LN:=LN^.sigProm;
    end;
end;
//___________________________________________________
procedure CargarCritica(var L:lista;var P:real);
var
    C:critica;
    Total:real;
    cantCriticas:integer;
    VC:vector_contador;
    actual:integer;
    LN:ListaProm;
begin
    LN:=Nil;
    InicializarVector(VC);
    LeerCritica(C);
    if C.CodigoC <> -1 then
        begin
            cantCriticas:=cantCriticas+1;
            Total:=Total+C.puntuajeC;
            P:=Total/cantCriticas;
            agregarListaNueva(LN,C.CodigoC,P);  
        end;
    while C.CodigoC <> -1 do
    begin
        P:=0;
        actual:=C.CodigoC;
        total:=0;
        cantCriticas:=0;
        InsertarOrdenado(L,C);
        while (C.CodigoC <> -1) and (actual=C.CodigoC) do
        begin
            LeerCritica(C);
            cantCriticas:=cantCriticas+1;
            Total:=Total+C.puntuajeC;  
        end;
        if C.CodigoC <> -1 then
        begin
            P:=Total/cantCriticas;
            agregarListaNueva(LN,C.CodigoC,P);  
        end;
        
        
    end; 
    imprimirListaNueva(LN);
    
end;
//___________________________________________________
{procedure actualizar(P:real;var LP:ListaPel);
begin
    while LP <> nil do
    begin
        LP^.DatosP.puntuajeProm:=P;
        LP:=LP^.sig;
    end;
end;}
//___________________________________________________
procedure ImprimirCriticas(L:Lista);
begin
    while L <> nil do
    begin
        WriteLn('DNI: ',L^.Datos.DNI :2);
        WriteLn('Apellido: ',L^.Datos.apellido :2);
        WriteLn('Nombre: ',L^.Datos.nombre :2);
        WriteLn('Codigo Pelicula: ',L^.Datos.CodigoC :2);
        WriteLn('Puntuaje de critico: ',L^.Datos.puntuajeC :2);
        L:=L^.sig;  
    end;
end;
//___________________________________________________
var
    L:lista;
    //LP:ListaPel;
    P:real;
begin
    P:=0;
    //LP:=Nil;
    //CargarPeliculas(LP);//Se dispone
    L := nil;
    CargarCritica(L,P);
    //WriteLn('El promedio de las criticas es: ',P:2:2);
    //ImprimirCriticas(L);
    //Actualizar(P,LP);
end.
