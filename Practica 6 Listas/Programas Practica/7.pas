{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos de
investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han determinado
los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la superficie
terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar un
programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos
criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y retorne
dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo total
(construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice el módulo
realizado en b. //No entendi la consiga "C"


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
    for i:=1 to 4 do
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
function Retorna7(ListaF:lista): boolean;
begin
    if (ListaF^.Sonda.cost_mensual<ListaF^.Sonda.cost_construccion) and (ListaF^.Sonda.rango_espectro <> 1) then
    begin
        Retorna7:=True
    end;
end;
//_____________________________________________________
procedure B(ListaF:lista;var Lista_Cumple,Lista_NoCumple:lista2);
var 
    cumpleF:boolean;
    nombre_cumple:str20;
    nombre_Nocumple:str20;
begin
    cumpleF:=false;
    while ListaF <> nil do
    begin
        cumpleF:=Retorna7(ListaF);
        if(cumpleF = False)then
        begin
            nombre_Nocumple:=ListaF^.Sonda.nombre;
            armarNodo2(Lista_NoCumple,nombre_Nocumple);
        end
        else
        begin
            nombre_cumple:=ListaF^.Sonda.nombre;
            armarNodo2(Lista_Cumple,nombre_Nocumple);
            cumpleF:=false;
        end;
        ListaF:=ListaF^.sig;
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
    Lista_Cumple:lista2;
    Lista_NoCumple:lista2;   
    //______________________
    Cumple:boolean;
begin
    Lista_Cumple:=nil;
    Lista_NoCumple:=nil;
    Cumple:=False;
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
            Costo_Total:=Costo_Total+ListaPri^.Sonda.cost_construccion;//D
            ListaPri:=ListaPri^.sig;
        end;
    Costo_promedio:=Costo_Total/sondas_totales;
    writeln('A ) ',Nom_sond_Cost);//A
    WriteLn('B) ___________');
    imprimir_VectorContador(Vcontador);//B
    promedio:=suma_sondas/sondas_totales;//C
    ListaPri:=primero;//Pongo al puntero en la primera posicion
    Mayor_que_promedio_costo(ListaPri,promedio,superan_tiempo,Costo_promedio,mucho_costo); //D
    WriteLn('D) La cantidad de Sondas que superan el tiempo promedio son: ', superan_tiempo);
    B(ListaPri,Lista_Cumple,Lista_NoCumple);
end.
