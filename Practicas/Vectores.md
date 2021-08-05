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

- ***Manteniendo Un Orden*** Esta operación requiere verificar el espacio disponible, buscar la posición correspondiente manteniendo el orden y luego insertar el elemento en el vector.
  - Verificar espacio en el vector
  - Determinar posición  donde se inserta.
  - Insertar elemento en la posición determinada. 

<table>
<tr>
<td> Posición Determinada </td> <td> Manteniendo un Orden </td>
</tr>
<tr>
<td>
 
```Pas
procedure Posicion_Determinada 
(var v:vector; var dimL:integer;elemento,pos:integer);
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
</td>
<td>
 

```Pas
procedure InsertarElemOrd (var v:vector; var dimL:integer;elemento:integer);
var
    pos:integer;
begin
    if (dimL < dimF) then
    begin
        pos:=BuscarPosicion(elemento,v,dimL);
        Insertar(v,dimL,pos,elemento);
    end;
end;
```
</td>
</tr>
 
 <tr><td></td>
 <td>
  
 ```Pas
procedure BuscarPosicion (x:integer;v:vector;dimL:integer):integer;
var
    pos:=Integer;
begin
    pos:=1;
    while (pos <= dimL) and (x > v[pos]) do
        pos:=pos + 1;
    BuscarPosicion:=pos;
end;
 ```
 </td>
 </tr>
 
 <tr><td></td>
 <td>
  
 ```Pas
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
 </td>
 </tr>
 
</table>
