{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector, o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector donde
se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector

}

 program Vectores;
 const
 dimF=100;
 type vector =  Array [1..dimF] of integer;
 str20=string[20];
//_________________________________________________________________________________________
 procedure Cargar (var vectorF:vector; var dimL:integer);//Solo cargamos el arreglo
var
    i:integer;
 begin
    for i:=dimL to dimF do
    begin
        vectorF[i]:=i;
    end;
    writeln('El arreglo se cargo con 100 numeros');
 end;
//_________________________________________________________________________________________
procedure Econtrar_posicion (arregloF:vector;dimL:integer;var encontrar_x:integer);
//El while no termina hasta encontrar una posicion con el numero que ingresamos y a lo ultimo verifica de que forma termino
var
i:integer;
begin
    i:=1;
    writeln('Ingrese x');
    ReadLn(encontrar_x);
    while (encontrar_x<>arregloF[i]) and (i<dimF) do
    begin
        i:=i+1;  
    end;
    if(encontrar_x<>arregloF[i]) then
    begin
        encontrar_x:=-1;
    end
    else
        begin
        encontrar_x:=arregloF[i];
        end;
end;
//_________________________________________________________________________________________
procedure intercambio(arregloF2:vector;var x,y:integer);
var
    i,mantener:integer;    
    verificar:str20;
begin
    Writeln('Ingrese x');
    readln(x);
    Writeln('Ingrese y');
    ReadLn(y);
    mantener:=arregloF2[x];
    arregloF2[x]:=arregloF2[y];
    arregloF2[y]:=mantener;
    writeln('ahora se intercambiaron: ',arregloF2[x],' X ',arregloF2[y],' Y ');
    //No es parte de la pregunta pero lo queria agregar para probar
    writeln('Si queres verificarlo escribi "si": ');
    ReadLn(verificar);
    if(verificar='si') then
    begin
        for i:=1 to 100 do
        begin
          writeln(arregloF2[i]);
        end;
    end;
end;
//_________________________________________________________________________________________
procedure sumaVector(arregloF:vector;dimL:integer;var sumar:integer);
var
i:integer;

begin
    for i:=dimL to dimF do
    begin
      sumar:=sumar+arregloF[i];
    end;
    
end;

//_________________________________________________________________________________________
function promedio_calcular(total:integer):Real;
begin
    promedio_calcular:=total/100;
end;
//_________________________________________________________________________________________
procedure maximo(arregloF3:vector;var numero_maximo:integer);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        if arregloF3[i]>numero_maximo then
        begin
            numero_maximo:=arregloF3[i];
        end;
    end;
end;
//_________________________________________________________________________________________
procedure minimo(arreglo:vector;var minimoF:integer);
var
i:integer;
begin
    for i:=1 to dimF do
    begin
        if(arreglo[i]<minimoF) then
            minimoF:=arreglo[i];
    end;
end;
//_________________________________________________________________________________________
var
    arreglo:vector;
    dimension_logica,   
    posicion_x,
    intercambiar_x,
    intercambiar_y,
    suma_vector,
    elemento_Maximo,
    elemento_minimo:integer;
    promedio:Real;
begin
    elemento_Maximo:=-1;
    elemento_minimo:=9999;
    promedio:=0;
    dimension_logica:=0;
    suma_vector:=0;
    Cargar(arreglo,dimension_logica);
   

    WriteLn('A) ________________________________');
    Econtrar_posicion(arreglo,dimension_logica, posicion_x);
    writeln('La A nos devuelve: ', posicion_x);

    WriteLn('B) ________________________________');
    intercambio(arreglo,intercambiar_x,intercambiar_y);

    WriteLn('C) ________________________________');
    sumaVector(arreglo,dimension_logica,suma_vector);
    writeln('La suma de todos los numeros es: ', suma_vector);

    WriteLn('D) ________________________________');
    promedio:=promedio_calcular(suma_vector);
    WriteLn('El promedio es: ',promedio:5:3);
    
    WriteLn('E) ________________________________');
    maximo(arreglo,elemento_Maximo);
    writeln('El numero maximo es: ', elemento_Maximo);

    WriteLn('F) ________________________________');
    minimo(arreglo,elemento_minimo);
    writeln('El numero minimo es: ', elemento_minimo);
end.