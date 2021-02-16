{5. Utilizando los módulos implementados en el ejercicio 3, realizar un programa que lea números enteros desde
teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar la carga, se
debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la operación realizada
de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ... fue intercambiado con el
elemento mínimo ... que se encontraba en la posición ...”.


}

 program Vectores;
 const
 dimF=100;
 type vector =  Array [1..dimF] of integer;
 str20=string[20];

//_________________________________________________________________________________________
procedure leer_numeros(arregloF:vector;var numero_maximo,numero_minimo:integer);
var
    mantener,
    numero,
    contador,
    posicion_max,
    posicion_min:integer;
begin
    posicion_max:=-1;
    posicion_min:=999;
    contador:=1;
    ReadLn(numero);
    while ((contador<10) and (numero<>0)) do
    begin
        arregloF[contador]:=numero;
    //_________________________________________________
        if(arregloF[contador]>numero_maximo)then
            begin
                numero_maximo:=arregloF[contador];
                posicion_max:=contador;  
            end;
    //_________________________________________________
        if(arregloF[contador]<numero_minimo) then
            begin
                numero_minimo:=arregloF[contador];  
                posicion_min:=contador;
            end;
        ReadLn(numero);
        contador:=contador+1;
    end;
    
    writeln('El elemento maximo: ',numero_maximo,' que se encontraba en la posicion: ',posicion_max,' Fue intercambiado por el elemento minimo: ', numero_minimo,' que se encontraba en la posicion: ', posicion_min);
    mantener:=arregloF[posicion_max];
    arregloF[posicion_max]:=arregloF[posicion_min];
    arregloF[posicion_min]:=mantener;
end;
//_________________________________________________________________________________________

var
    numero_maximo,
    numero_minimo:integer;
    arreglo:vector;
begin
    numero_maximo:=-1;
    numero_minimo:=999;
    leer_numeros(arreglo,numero_maximo,numero_minimo);
    
end.