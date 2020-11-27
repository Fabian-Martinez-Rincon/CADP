{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto
(1..7), nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y
año de su descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos
los datos.
B. Una vez leída y almacenada toda la información, se pide calcular e informar:
I. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
II. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
III. La cantidad de objetos observados por cada categoría.
IV. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
}
program JugamosConListas;
type
    clasificacion=1..7;
    str20=string[20];
    objeto=record
        cod_objeto:integer;
        categoria:clasificacion;
        nombre:str20;
        dist_tierra:integer;
        descubridor:str20;
        anio_desc:1..2021;
    end;
    lista = ^nodo;
    nodo = record
        datos : objeto;
        sig : lista;
    end;
    vectorCategoria= array [1..7] of integer;
//___________________________________________________________
procedure LeerObjeto(var O:objeto);
begin
    writeln('Codigo Objeto: ');ReadLn(O.cod_objeto);
    if (O.cod_objeto <> -1)then
    begin
        writeln('Categoria: '); ReadLn(O.categoria);
        writeln('Nombre: ');ReadLn(O.nombre);
        writeln('Distancia de la tierra: ');ReadLn(O.dist_tierra);
        writeln('Descubridor: ');ReadLn(O.descubridor);
        writeln('Anio de su descubrimiento: ');ReadLn(O.anio_desc);
    end;
end;
//___________________________________________________________
procedure OrdenarLista(var L:lista;O:objeto);
var 
    nue:lista;
begin
    new(nue);
    nue^.datos:=O;
    nue^.sig:=L;
    L:=nue;
end;
//___________________________________________________________
procedure CargarLista(var L:lista);
var 
    O:objeto;
begin
    LeerObjeto(O);
    while (O.cod_objeto <> -1) do
        begin
            OrdenarLista(L,O);
            LeerObjeto(O);
        end;
end;
//___________________________________________________________
procedure DosMaximos(Obj:objeto;var codmax1,codmax2:integer;var distmax1,distmax2:integer);
begin
    if (Obj.dist_tierra<distmax1) then
    begin
        distmax2:=distmax1;
        codmax2:=codmax1;
        distmax1:=Obj.dist_tierra;
        codmax1:=Obj.cod_objeto;
    end
    else
        begin
            if(Obj.dist_tierra<distmax2)then
            begin
                distmax2:=Obj.dist_tierra;
                codmax2:=Obj.cod_objeto;
            end; 
        end;
end;
//___________________________________________________________
procedure inicializarVector(var V:vectorCategoria);
var
    i:integer;
begin
    for i:=1 to 7 do
    begin
        V[i]:=0;    
    end;
end;
//___________________________________________________________
procedure masPares(obs:objeto);
var
    dig:integer;
    par:integer;
    impares:integer;
begin
    par:=0;
    impar:=0;
    while (obs.cod_objeto <> 0) do
    begin
        dig:=obs.cod_objeto mod 10;
        if(dig mod 2)then
        begin
            par:=par+1;
        end
        else
        begin
            impar:=impar+1;  
        end;
    end;
    if(par>impar)then
    begin
        WriteLn(L^.datos.nombre);
    end;
end;
//___________________________________________________________
procedure RecorrerLista(L:lista);
var
    codmax1:integer;
    codmax2:integer;
    distmax1:integer;
    distmax2:integer;
    Cont_Gali:integer;
    Vc:vectorCategoria;
    cate:integer;
begin
    inicializarVector(Vc);
    Cont_Gali:=0;
    codmax1:=-1;
    codmax2:=-1;
    distmax1:=-1;
    distmax1:=-1;
    while L <> nil do
    begin
        DosMaximos(L^.datos,codmax1,codmax2,distmax1,distmax2);
        if (L^.datos.descubridor = 'Galileo Galilei') and (L^.datos.anio_desc<1600)then
        begin
            Cont_Gali:=Cont_Gali+1;
        end;
        cate:=L^.datos.categoria;
        Vc[cate]:=Vc[cate]+1;
        L:=L^.sig;
        masPares(L.datos);
    end;
    WriteLn('El codigo mas lejano es: ',codmax1);
    WriteLn('El segundo codigo mas lejano: ', codmax2);
    WriteLn('planetas descubiertos por "Galileo Galilei" antes del año 1600:',Cont_Gali);
end;
//___________________________________________________________
var
    L:lista;
begin
    L := nil;
    CargarLista(L);
    RecorrerLista(L);
end.
