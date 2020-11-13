{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al
espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de
meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y rango del espectro
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
        rango_espector:rango;
    end;

    lista = ^nodo;
    nodo = record
        Sonda : DatosSonda;
        sig : lista;
    end;
//________________________________________________________________________________________________________
procedure armarNodo(var L: lista; v: DatosSonda);
var
    aux : lista;
begin
    new(aux);
    aux^.Sonda := v;
    aux^.sig := L;
    L := aux;
end;

//________________________________________________________________________________________________________
procedure LeerSonda(var productoF:DatosSonda);
begin
    with productoF do
    begin
        WriteLn('Nombre:'); ReadLn(nombre);
        WriteLn('Duracion en meses:'); ReadLn(duracion);
        WriteLn('Costo de construccion:'); ReadLn(cost_construccion);  
        WriteLn('Costo de mantenimiento mensual:'); ReadLn(cost_mensual);
        WriteLn('Rango del espectro electromacnetico:'); ReadLn(rango_espector);  
    end;
end;
//________________________________________________________________________________________________________
var
    ListaP : lista;
    Sonda:DatosSonda;
begin
    
    ListaP := nil;
    writeln('Ingrese un producto');
    LeerSonda(Sonda);
    while (Sonda.nombre <> 'GAIA') do
       begin
        armarNodo(ListaP, Sonda);
        writeln('Ingrese un producto');
        LeerSonda(Sonda);
        
    end;
    
    
end.
