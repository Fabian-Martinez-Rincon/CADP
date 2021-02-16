{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del espectro
electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.
}
program JugamosConListas;
type
    rango=1..7;
    str20=string[20];
    DatosSonda = record
        nombre:str20;
        duracion:integer;
        cost_construccion:real;
        cost_mensual:Real;
        rango_espectro:rango;
    end;

    lista = ^nodo;
    nodo = record
        Sonda : DatosSonda;
        sig : lista;
    end;
    lista2 =^nodo2;
    nodo2 = record
        Nombre: str20;
        sig2:lista2;
    end;
    vector_contador = Array [1..7] of integer;
//_____________________________________________________
procedure armarNodo(var L: lista; v: DatosSonda);
var
    aux : lista;
begin
    new(aux);
    aux^.Sonda := v;
    aux^.sig := L;
    L := aux;
end;
//_____________________________________________________
procedure armarNodo2(var L: lista2; v: str20);
var
    aux : lista2;
begin
    new(aux);
    aux^.Nombre := v;
    aux^.sig2 := L;
    L := aux;
end;

//_____________________________________________________
procedure LeerSonda(var productoF:DatosSonda);
begin
    with productoF do
    begin
        WriteLn('Nombre:'); ReadLn(nombre);
        if (productoF.nombre <> 'GAIA') then
        begin
            WriteLn('Duracion en meses:'); ReadLn(duracion);
            WriteLn('Costo de construccion:'); ReadLn(cost_construccion);  
            WriteLn('Costo de mantenimiento mensual:'); ReadLn(cost_mensual);
            WriteLn('Rango del espectro electromacnetico:'); ReadLn(rango_espectro);
        end;  
    end;
end;
//_____________________________________________________
procedure CargarLista(var ListaPri:lista;var Sonda:DatosSonda );
begin

    writeln('Ingrese un producto');
    LeerSonda(Sonda);
    while (Sonda.nombre <> 'GAIA') do
       begin
        armarNodo(ListaPri, Sonda);
        writeln('Ingrese un producto');
        LeerSonda(Sonda);
    end;
end;
//_____________________________________________________
procedure Sonda_Costosa(ListaPri:lista;var Nom_sond_Cost:str20;var num_maximo:real);
begin
    
    if (ListaPri^.Sonda.cost_construccion  > num_maximo) then
    begin
        num_maximo:= ListaPri^.Sonda.cost_construccion;
        Nom_sond_Cost:=ListaPri^.Sonda.nombre;
    end;
end;
//_____________________________________________________
procedure Inicializar_vector(var VC:vector_contador);
var
    i:integer;
begin
    for i:=1 to 7 do
    begin
        VC[i]:=0;
    end
end;
//_____________________________________________________
procedure imprimir_VectorContador(VC:vector_contador);
var
    i:integer;
begin
    for i:=1 to 7 do
    begin
        WriteLn('En la posicion ',i,' se contaron ',VC[i],' veces ');
    end;
end;
//_____________________________________________________
procedure Mayor_que_promedio_costo(ListaPri:lista ; promedio:real; var superan_tiempo:integer;Costo_promedio:real; var mucho_costo:lista2);
var
    nombre:str20;
begin
    while ListaPri <> Nil do
        begin
            if (ListaPri^.Sonda.duracion>promedio) then
                begin
                    superan_tiempo:=superan_tiempo+1;
                end;

            if(ListaPri^.Sonda.cost_construccion>Costo_promedio)then
            begin
                nombre:=ListaPri^.Sonda.nombre;
                armarNodo2(mucho_costo, nombre );
            end;
             
            ListaPri:=ListaPri^.sig;
         
        end;
end;
//_____________________________________________________
var
    ListaPri : lista;
    Sonda:DatosSonda;
    Nom_sond_Cost:str20;
    maximo:real;
    Vcontador:vector_contador;
    tipo:integer;
    promedio:real;
    sondas_totales:integer;
    suma_sondas:real;
    superan_tiempo:integer;
    primero:lista;
    Costo_promedio:real;
    Costo_Total:real;
    mucho_costo:lista2;
begin
    mucho_costo:=Nil;
    Costo_Total:=0;
    Costo_promedio:=0;
    superan_tiempo:=0;
    suma_sondas:=0;
    sondas_totales:=0;
    promedio:=0;
    ListaPri := nil;
    maximo:=-1;
    CargarLista( ListaPri, Sonda );
    primero:=ListaPri;
    //A, B, C y D
    Inicializar_vector(Vcontador);
    while (ListaPri <> Nil) do
       begin
            Sonda_Costosa(ListaPri,Nom_sond_Cost,maximo); //A
            tipo:=ListaPri^.Sonda.rango_espectro; //B
            Vcontador[tipo]:=Vcontador[tipo]+1; //B
            sondas_totales:=sondas_totales+1; //C
            suma_sondas:=suma_sondas+ListaPri^.Sonda.duracion;//C
            Costo_Total:=Costo_Total+ListaPri^.Sonda.cost_construccion;
            ListaPri:=ListaPri^.sig;
        end;
    Costo_promedio:=Costo_Total/sondas_totales;
    writeln('A ) ',Nom_sond_Cost);//A
    WriteLn('B) ___________');
    imprimir_VectorContador(Vcontador);//B
    promedio:=suma_sondas/sondas_totales;//C
    ListaPri:=primero;//Pongo al puntero en la primera posicion
    WriteLn('COSA');
    Mayor_que_promedio_costo(ListaPri,promedio,superan_tiempo,Costo_promedio,mucho_costo); //D
    WriteLn('D) La cantidad de Sondas que superan el tiempo promedio son: ', superan_tiempo);
end.
