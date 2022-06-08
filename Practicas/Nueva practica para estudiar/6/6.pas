{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al
espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de
meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del espectro
electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar
la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez}

type
    cadena12 = string[12];
    rango_espectro = 1..7;
    sonda = record
        nombre:cadena12;
        duracion:integer;
        costo_const:integer;
        costo_mante:integer;
        espectro:rango_espectro;
    end;
    categorias = array [rango_espectro] of cadena12;
    vector_contador = array [rango_espectro] of integer;
    
    lista = ^nodo;
    nodo = record
        dato:sonda;
        sig:lista;
    end;
//_______________________________________________________________
procedure cargarCategorias(var vcategorias:categorias);
begin
    vcategorias[1]:='radio';
    vcategorias[2]:='microondas'; 
    vcategorias[3]:='infrarrojo';
    vcategorias[4]:='luz visible';
    vcategorias[5]:='ultravioleta';
    vcategorias[6]:='rayos';
    vcategorias[7]:='rayos gamma';
end;
//_______________________________________________________________
procedure LeerSonda(var s:sonda);
begin
    WriteLn('Nombre: '); ReadLn(s.nombre);
    if (s.nombre <> 'GAIA') then
    begin
        WriteLn('Duracion en meses: '); ReadLn(s.duracion);
        WriteLn('Costo construccion: '); ReadLn(s.costo_const);
        WriteLn('Costo de mantenimiento'); ReadLn(s.costo_mante);
        WriteLn('Espectro (1..7)'); ReadLn(s.espectro);
    end;
end;
//_______________________________________________________________
procedure armarNodo(var l:lista;s:sonda);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=s;
    nue^.sig:=l;
    l:=nue;
end;
//_______________________________________________________________
procedure inicializarVector(var vc:vector_contador);
var
    i:integer;
begin
    for i:=1 to 7 do
    begin
        vc[i]:=0;
    end;
end;
//_______________________________________________________________
procedure ImprimirVector(vc:vector_contador);
var
    i:integer;
begin
    for i:=1 to 7 do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________________________
procedure cargarLista(var L:lista;vcate:categorias);
var
    s:sonda;
    SondaCostosa:integer;
    nombreCostosa:cadena12;
    vc:vector_contador;
begin
    inicializarVector(vc);
    SondaCostosa:=-1;
    LeerSonda(s);
    while  (s.nombre <> 'GAIA')  do
    begin
        armarNodo(L,s);
        if ((s.costo_const+s.costo_mante)>SondaCostosa) then
        begin
            SondaCostosa:=(s.costo_const+s.costo_mante);
            nombreCostosa:=s.nombre;
        end;
        v[s.espectro]:=v[s.espectro]+1;
    end;
    writeln('El nombre de la sonda mas costosa es: ', nombreCostosa);
    ImprimirVector(vc);
end;
//_______________________________________________________________
var
    vcate:categorias;
    l:lista;
begin
    l:=nil;
    cargarCategorias(vcate);
    cargarLista(l,vcate);
end.