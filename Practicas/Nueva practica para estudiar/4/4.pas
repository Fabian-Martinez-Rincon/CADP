{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el 
valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde 
se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}
program cuatro;
const
    dimF=10;
type
    rango = 1..dimF;
    vector = array [1..dimF] of integer;
//___________________________________________________
procedure cargarArreglo(var v:vector;var dim:rango);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        dim:=dim+1;
        v[i]:=i;
    end;
end;
//___________________________________________________
function EncontrarPosicion(v:vector; x:integer;dim:rango):integer;
var
    contador:integer;
    encontro:boolean;
begin
    contador:=0;
    encontro:=false;
    while ((encontro = False) and (contador<=dim)) do
    begin
        contador:=contador+1;
        if (v[contador]=x) then
        begin
            encontro:=true;
        end;
    end;
    if (encontro) then
    begin
        EncontrarPosicion:=contador;
    end
    else
        begin
            EncontrarPosicion:=-1;
        end;
end;
//___________________________________________________
procedure intercambio(var v:vector;x:rango;y:rango);
var
    inter:rango;
begin
    inter:=v[x];
    v[x]:=v[y];
    v[y]:=inter;
end;
//___________________________________________________
procedure imprimirVector(v:vector;dim:rango);
var
    i:integer;
begin
    for i:=1 to dim do
    begin
        WriteLn(v[i]);
    end;
end;
//___________________________________________________
function totalVector(v:vector;dim:rango):integer;
var
    i:integer;
    total:integer;
begin
    total:=0;
    for i:=1 to dim do
    begin
        total:=total+v[i];
    end;
    totalVector:=total;
end;
//___________________________________________________
function promedioFuncion(v:vector;dim:rango):integer;
var
    i:integer;
    total:integer;
begin
    total:=0;
    for i:=1 to dim do
    begin
        total:=total+v[i];
    end;
    promedioFuncion:=total div dim;
end;
//___________________________________________________
function posicionMaxima(v:vector;dim:rango):rango;
var
    i:integer;
    maximo:integer;
    pos_max:rango;
begin
    maximo:=-1;
    for i:=1 to dim do
    begin
        if (v[i]>maximo)then
        begin
            maximo:=v[i];
            pos_max:=i;
        end;
    end;
    posicionMaxima:=pos_max;
end;
//___________________________________________________
function posicionMinima(v:vector;dim:rango):rango;
var
    i:integer;
    minimo:integer;
    pos_min:rango;
begin
    minimo:=999;
    for i:=1 to dim do
    begin
        if (v[i]<minimo)then
        begin
            minimo:=v[i];
            pos_min:=i;
        end;
            
    end;
    posicionMinima:=pos_min;
end;      
//___________________________________________________
var
    v:vector;
    dim:rango;
    x,y:rango;
    posicion_X:integer;
    sumaVector:integer;
    promedio:integer;
    pos_maximo:rango;
    pos_minimo:rango;
begin
    pos_maximo:=0;
    pos_minimo:=10;
    promedio:=0;
    sumaVector:=0;
    x:=4;
    y:=7;
    WriteLn('_________________');
    WriteLn('A)');
    cargarArreglo(v,dim);
    WriteLn(dim);
    posicion_X:=EncontrarPosicion(v,x,dim);
    WriteLn(posicion_X);
    WriteLn('_________________');
    WriteLn('B)');
    intercambio(v,x,y);
    imprimirVector(v,dim);
    WriteLn('_________________');
    WriteLn('C)');
    sumaVector:=totalVector(v,dim);
    WriteLn('Suma vector: ',sumaVector);
    WriteLn('_________________');
    WriteLn('D)');
    promedio:=promedioFuncion(v,dim);
    WriteLn(promedio);
    WriteLn('_________________');
    WriteLn('E)');
    pos_maximo:=posicionMaxima(v,dim);
    WriteLn('max: ',pos_maximo);
    WriteLn('_________________');
    WriteLn('F)');
    pos_minimo:=posicionMinima(v,dim);
    WriteLn('min: ', pos_minimo);
end.