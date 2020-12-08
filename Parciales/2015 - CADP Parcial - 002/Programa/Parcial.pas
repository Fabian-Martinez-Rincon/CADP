program CADPParcial;
type
    cadena=string[40];
    proyecto = record
        nroInterno:integer;
        descripcion:cadena;
        anioInicio:1..2021;
        anioFin:1..2021;
        codLenguaje:1..5;
        cantPersonas:integer;
        totalHoras:integer;
    end;
    lista=^nodo;
    nodo = record
        datos:proyecto;
        sig:lista;
    end;
    vectorLenguajes=array [1..5] of integer;
    vector_contador= array [1..5] of integer;
//_______________________________________________________________
procedure cargarLenguajes (var VL:vectorLenguajes);
var
    i:integer;
begin
    for i:=1 to 5 do
    begin
        VL[i]:=i*10;
    end;
end;
//_______________________________________________________________
procedure LeerP(var P:proyecto);
begin
    writeln('Nro Interno (integer): ');     ReadLn(P.nroInterno);
    if P.nroInterno <> 0 then
    begin
        writeln('Descripcion (string): ');      ReadLn(P.descripcion);
        writeln('Anio inicio (1..2021): ');     ReadLn(P.anioInicio);
        writeln('Anio Fin (1..2021): ');        ReadLn(P.anioFin);
        writeln('Cod Lenguaje (1..5): ');       ReadLn(P.codLenguaje);
        writeln('Cant Personas (integer): ');   ReadLn(P.cantPersonas);
        writeln('Total Horas (integer): ');     ReadLn(P.totalHoras);
    end;
end;
//_______________________________________________________________
procedure agregarAdelante(var L:lista;P:proyecto);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=P;
    nue^.sig:=L;
    L:=nue;
end;
//_______________________________________________________________
procedure ProcesarLista(var L:lista);
var
    P:proyecto;
begin
    LeerP(P);
    while P.nroInterno <> 0 do
    begin
        agregarAdelante(L,P);
        LeerP(P);
    end;
end;
//_______________________________________________________________
procedure imprimirL(L:lista);
begin
    while L <> nil do
    begin
        WriteLn('______________');
        writeln('Nro Interno : ',L^.datos.nroInterno); 
        writeln('Descripcion: ',L^.datos.descripcion);     
        writeln('Anio inicio: ',L^.datos.anioInicio);    
        writeln('Anio Fin: ',L^.datos.anioFin);      
        writeln('Cod Lenguaje: ',L^.datos.codLenguaje);       
        writeln('Cant Personas: ',L^.datos.cantPersonas);  
        writeln('Total Horas: ',L^.datos.totalHoras);     
        L:=L^.sig;
    end;
end;
//_______________________________________________________________
procedure inicializarContador (var VC:vector_contador);
var
    i:integer;
begin
    for i:=1 to 5 do
    begin
        VC[i]:=0;
    end;
end;
//_______________________________________________________________
procedure dosMayores(VC:vector_contador;var max1,max2:integer);
var
    i:integer;
    mayor1:integer;
    mayor2:integer;
begin
    mayor1:=-1;
    mayor2:=-1;
    for i:=1 to 5 do
    begin
        if VC[i]>mayor1 then
        begin
            mayor2:=mayor1;
            max2:=max1;
            mayor1:=VC[i];
            max1:=i;
        end
        else
            begin
                if (VC[i]>mayor2) then
                begin
                    mayor2:=VC[i];
                    max2:=i;
                end;  
            end;
    end;
end;
//_______________________________________________________________
procedure RecorrerLista (L:lista;VL:vectorLenguajes);
var
    VC:vector_contador;
    lenguajeMax1:integer;
    lenguajeMax2:integer;
    totalHoras:integer;
    personasPython:integer;
begin
    totalHoras:=0;
    lenguajeMax1:=-1;
    lenguajeMax2:=-1;
    personasPython:=0;
    inicializarContador(VC);
    while L <> nil do
    begin
        VC[L^.datos.codLenguaje]:=VC[L^.datos.codLenguaje]+1;
        if (L^.datos.anioInicio>=2000)and (2014>L^.datos.anioInicio) then
        begin
            totalHoras:=totalHoras+L^.datos.totalHoras;
        end;
        if ((L^.datos.codLenguaje) = 3) and ((L^.datos.anioFin)-(L^.datos.anioInicio) < 1) then
        begin
            personasPython:=personasPython+1;
        end;
        L:=L^.sig;
    end;
    dosMayores(VC,lenguajeMax1,lenguajeMax2);
    WriteLn('El lenguaje mas utilizado es: ', lenguajeMax1);
    WriteLn('El segundo lenguaje mas utilizado es: ', lenguajeMax2);
    WriteLn('La cantidad total de horas es: ',totalHoras);
    WriteLn('La cantidad de personas que trabajaron en Phyton');
end;
//_______________________________________________________________
var
    VL:vectorLenguajes;
    L:lista;
begin
    cargarLenguajes(VL);//Se dispone pero lo hago porque se me canta
    ProcesarLista(L);
    //imprimirL(L);
    RecorrerLista(L,VL);
end.
