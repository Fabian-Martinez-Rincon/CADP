<h1 align="center"> 📚Vectores </h1>
<div align="center">
<img src="https://media.giphy.com/media/7E8lI6TkLrvvAcPXso/giphy.gif"/>
 </div>
<br>

Indice
=================

<!--ts-->
   * [Asignación de contenido](#asignación_de_contenido)
   * [Lectura/Escritura](#lectura_escritura)
   * [Recorridos](#recorridos)
   * [Carga de datos](#cargar_Datos)
   * [Agregar al Final](#agregar_al_final)
   * [Insertar Elementos](#insertar_un_elemento)
   * [Borrar Elementos](#borrar_elementos)
   * [Buscar un elemento](#buscar_elemento)

Asignación_de_contenido
=======================

```Pas
var
  numero:integer;
  v:vector;
begin
  numero:=10;
  v[4]:=numero;
end.
```

Lectura_Escritura
=================

```Pas
var
  v:vector;
begin
  readln(v[1);
  writeln(v[1];
end.
```
Recorridos
==========

La operacion de ***Recorridos*** en un vector consiste en recorrer el vector de manera total o parcial, para realizar algún proceso sobre sus elementos.
- ***Recorrido Total*** Implica analizar ```todos``` los elementos del vector, lo que lleva a recorrer completamente la estructura.
- ***Recorrido Parcial*** Implica analizar los elementos del vector, ```hasta``` encontar aquel que cumple con lo pedido. Puede ocurrir que se recorra todo el vector.

<table>
<tr>
<td> Recorrido Total </td> <td> Recorrido Parcial </td><td> Recorrido Parcial 2 </td>
</tr>
<tr>
<td>
 
```Pas
var
    v:vector;
    i:integer;
begin
    for i:=1 to dimF do
       writeln(v[i]);
end.
```
</td>
<td>
 

```Pas
var //(Seguro Existe)
    v:vector;
    i:integer;
begin
    i:=1;
    while (v[i] <> 0) do
    begin
       writeln(v[i]);
       i:=i+1;
    end;
end.
```
 
</td>
 <td>
 

```Pas
var //(Puede no Existir)
    v:vector;
    i:integer;
begin
    i:=1;
    while (i <= dimF) and (v[i] <> 0) do
    begin
       i:=i+1;
    end;
    if (i <= dimF ) then
       writeln ('Existe');
    else
       writeln ('No Existe');
end.
```
 
</td>
</tr>
 
</table>

Cargar_Datos
=============

La operacion de ```Cargar Datos``` en un vector consiste en incorporar un elemento a continuacion del otro desde la posición inicial en forma consecutiva.
- ***Carga Total*** Consiste en guardar cada elemento en una posición del vector.
- ***Carga Parcial*** Esta operación debe controlar que la cantidad de elementos que se cargan no supere la dimensión física.

<table>
<tr>
<td> Carga Total </td> <td> Carga Parcial </td>
</tr>
<tr>
<td>
 
```Pas
procedure Carga_Total(var v:vector);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
       readln(v[i]);                    
    end;
end.
```
</td>
<td>
 

```Pas
procedure Carga_Parcial(var v;vector;var dimL);
var
    numero:integer;
begin
    dimL:=0;
    readln(numero);
    while (numero <> 0) and (dimL < dimF) do
    begin
       dimL:=dimL+1;
       v[dimL]:=nummero;
       readln(numero);                 
    end;
end.
```
 
</td>
</tr>
 
</table>

Agregar_al_final
================

```Pas
Procedure Agregar_Al_Final(var v:vector;var dimL:integer;elemeto:integer);
begin
   if (dimL < dimF) then 
   begin
      dimL:=dimL + 1; 
      v[dimL]:=elemento;
   end;
end.
```
Insertar_un_elemento
====================

La operación de insertar un elemento en un vector consiste en incorporar el elemento en una posición determinada o de acuerdo a un orden impuesto por sus datos (ej: ordenada de mayor a menor).

- ***Posición Determinada*** Consiste en guardar cada elemento en una posición del vector.
  - Verificar la posición a insertar.
  - Verificar espacio en el vector.
  - Abrir el vector (a partir de la dimL)
  - Aumentar la dimL



```Pas
procedure Posicion_Determinada (var v:vector; var dimL:integer;elemento,pos:integer);
var
   i:integer;
begin
    if (dimL < dimF) and ((pos >= 1) and (pos <= dimL)) then
    begin
         for i:=dimL to downto pos to
            v[i + 1] := v[i];
         v[pos]:=elemento;
         dimL:=dimL+1;
    end;
end;
```
- ***Manteniendo Un Orden*** Esta operación requiere verificar el espacio disponible, buscar la posición correspondiente manteniendo el orden y luego insertar el elemento en el vector.
  - Verificar espacio en el vector
  - Determinar posición  donde se inserta.
  - Insertar elemento en la posición determinada. 
```Pas
//Insertar un elemento en un vector ordenado de menor a mayor
procedure Manteniendo_un_Orden (var v:vector; var dimL:integer;elemento:integer);
var
    pos:integer;
begin
    if (dimL < dimF) then
    begin
        pos:=BuscarPosicion(elemento,v,dimL);
        Insertar(v,dimL,pos,elemento);
    end;
end;
//__________________________________________________________________________________
Function BuscarPosicion (x:integer;v:vector;dimL:integer):integer;
var
    pos:=Integer;
begin
    pos:=1; 
    while (pos <= dimL) and (x > v[pos]) do
        pos:=pos + 1;
    BuscarPosicion:=pos;
end;
//__________________________________________________________________________________
Procedure Insertar (var v:vector; var dimL:integer; pos: Indice; elem:integer);
var 
    i: indice;
begin
    for i:= dimL downto pos do 
        v [i + 1] := v [i] ;
    v [pos] := elem; 
    dimL := dimL + 1;
End;
 ```
 
Borrar_Elementos  
================

La operación Borrar un elemento en un vector consiste en eliminar un elemento determinado o bien eliminar un elemento que ocupa una posición determinada.
- ***En posición determinada*** Se debe verificar que la posición sea valida.
  - Validar la posición a eliminar.
  - Desplazar elementos (A partir de la siguiente posición).
  - Abrir el vector (a partir de la dimL)
  - Disminuir la dimL

```Pas
Procedure BorrarPos (var v: vector; var dimL: integer; pos: posicion);
var 
    i: integer; 
Begin
    exito := false;
    if (pos >=1 and pos <= dimL) then 
    begin
        for i:= pos + 1 to dimL  do
            v [ i - 1 ]  :=  v [ i ] ;
        dimL := dimL - 1 ;         
   end;
End;

```

- ***Elemento determinada*** Hay que verificar que exista el elemento.
  - Buscar la posición del elemento a borrar.
  - Si el elemento esta entonces ----> Borrar el elemento.

```Pas
Procedure BorrarElem (var v: vector;  var dimL: integer; elem: integer;  var exito: boolean);
var 
    pos: indice;
begin
    exito:= false;
    pos:= BuscarPosElem (elem, v, dimL);
    if (pos <> 0) then 
    begin
        BorrarPos (v, dimL, pos);
        exito:= true;
   end;
end;
//__________________________________________________________________________________
Function BuscarPosElem (x:integer; v:vector; dimL: integer): integer;
var 
    pos:integer; 
    exito: boolean;
Begin
    pos:=1; 
    exito:= false;
    while (pos <= dimL) and (not exito) do 
    begin
        if (x = v[pos]) then
            exito:= true
        else
            pos:=pos+1;
    end;
    if (exito = false) then 
        pos:=0;
    BuscarPosElem:= pos;
end; 
//__________________________________________________________________________________
Procedure BorrarPos (var v:vector; var dimL:integer; pos:integer);
var 
    i: integer; 
Begin
    for i:= pos + 1  to   dimL  do
        v [ i - 1 ]  :=  v [ i] ;
    dimL := dimL - 1 ;         
End;

```
Buscar_elemento
================
El proceso de ubicar información particular en una colección de datos es conocido como método de busqueda.
- ***Busqueda Lineal o Secuencial*** Almacenados sin ningun orden.
  - Se aplica cuando los elementos no tienen orden.
  - Requiere excesivo consumo de tiempo en la localización del elemento.
  - Numero medio de compareciones (dimL + 1) / 2. 
  - Es ineficiente a medida que el tamaño del arreglo crece.
  
- ***En arreglos ordenados*** Almacenados ordenados por algun criterio
   - ***Secuencial Optimizado*** 
     - Se aplica cuando los elementos tienen orden.
     - La busqueda comienza desde el pricipio y se avanza por la estructura de manera secuencial y asi hasta que encuentro el número buscado o hasta que encuentro uno mayor.
 
```Pas
leer(auto);
while (auto.marca <> 'ZZZ') do 
begin
   marcaActual := auto.marca
   while ( (auto.marca <> 'ZZZ') AND (marcaActual = auto.marca) ) do 
   begin
      leer(auto);
   end;
end;
```
