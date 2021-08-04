{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y otra para
el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas posiciones.
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