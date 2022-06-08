{5. Utilizando los módulos implementados en el ejercicio 3, realizar un programa que lea números enteros desde 
teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar la carga, se 
debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la operación realizada 
de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el 
elemento mínimo ... que se encontraba en la posición ...”.}
program cinco;
const   
    dimF = 100;
type
    rango = 1..dimF;
    vector = array [1..dimF] of integer;
//________________________________________________
procedure cargarVector(var v:vector;var dimL:rango;var maximo:integer;var pos_maximo:rango;var minimo:integer;var pos_minimo:rango);
var
    numero:integer;
    mantener_num:integer;
begin
    ReadLn(numero);
    while ((dimL<=dimF) and (numero <> 0)) do
    begin
        v[dimL]:=numero;
        if (v[dimL]>maximo) then    
        begin
            maximo:=v[dimL];
            pos_maximo:=dimL;
        end;
        if (v[dimL]<minimo) then
        begin
            minimo:=v[dimL];
            pos_minimo:=dimL;
        end;    
            
        dimL:=dimL+1;
        ReadLn(numero);
    end;
    mantener_num:=v[pos_maximo];
    v[pos_maximo]:=v[pos_minimo];
    v[pos_minimo]:=mantener_num;
end;
//________________________________________________
var
    v:vector;
    dimL:rango;
    maximo:integer;
    pos_maximo:rango;
    minimo:integer;
    pos_minimo:rango;
begin
    dimL:=1;
    maximo:=-1;
    minimo:=999;
    cargarVector(v,dimL,maximo,pos_maximo,minimo,pos_minimo);
    WriteLn('El elemento maximo: ', maximo,' que se encontraba en la posicion ',pos_maximo, ' fue intercambiado con el elemento minimo: ',minimo,' que se encontraba en la posicion: ',pos_minimo);
end.