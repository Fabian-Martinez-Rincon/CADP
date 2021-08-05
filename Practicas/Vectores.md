<h1 align="center"> 📚Arreglos </h1>
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
   * [Insertar Elementos](#insertar_elementos)
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
=============
