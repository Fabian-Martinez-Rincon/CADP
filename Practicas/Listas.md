<h1 align="center">🧾Listas </h1>
<div align="center">
<img src="https://media.giphy.com/media/bt0dOM6pZjSY8/giphy.gif"/>
 </div>
<br>

Indice
=================

   * [Recorrer una Lista](#recorrer_una_lista)
   * [Buscar un Elemento en una Lista](#buscar_un_elemento_en_una_lista)
   * [Crear una Lista Vacia](#crear_una_lista_vacia)
   * [Agregar un Elemento al Principio de la Lista](#agregar_un_elemento_al_principio_de_la_lista)
   * [Agregar un Elemento al Final de la Lista](#agregar_un_elemento_al_final_de_la_lista)
   * [Eliminar un Elemento de la Lista](#eliminar_un_elemento_de_la_lista)
   * [Insertar un Nuevo Elemento en una Lista Ordenada](#insertar_un_nuevo_elemento_en_una_lista_ordenada)
   * [Corte de control](#Corte_de_Control)

Recorrer_Una_Lista
==================
 - Mientras la lista sea distina de nil va a pasar al siguiente nodo, es decir, a L se le va a asignar la dirección del siguiente nodo (en memoria dinamica)

```Pas
procedure Recorrido(l:lista);
begin
    while (l <> nil) do
    begin
        writeln(l^.dato);
        l:=l^.sig;
    end;
end;
```
Buscar_un_Elemento_en_una_Lista
===============================
Desordenada
-----------
- A la función booleana se le va a pasar por parámetros ```L``` de tipo lista y el elemento a buscar.
- Para buscar un elemento vamos a necesitar una variable de tipo booleana para determinar si se pudo encontrar o no ese elemento.
- Primero vamos a inicializar la variable booleana en falso y luego la lista se va a recorrer desde el nodo inicial.
- Mientras ```L``` no llegue al final de la lista y el elemento no se encuentre, se avanzaría una posición en el nodo de la lista, en el caso contrario cambiamos el valor de la variable booleana a ```TRUE``` para confirmar que se encontro el elemento.
- En el caso de que se haya avanzado en la lista hasta el final y no se haya encontrado el elemento, la función retorna false.

Ordenada
--------
- A la función booleana se le va a pasar por parámetro ```L``` de tipo lista y el elemento a buscar.
- Para buscar un elemento vamos a necesitar una variable de tipo booleana para determinar si se pudo o no encontrar ese elemento.
- Primero vamos a inicializar la variable booleana en falso luego la lista se va a recorrer desde el nodo inicial.
- Mientras ```L``` no llegue al final de la lista y el elemento actual de la lista sea menor/mayor (segun el caso) al que estamos buscando se avanzaría una posición en la lista.
- Una vez que una de las dos condiciones no se cumpla, se evalua si no se llegó al final de la lista y se encontró el elemento que se estaba buscando, se modifica el booleano a true.
- En el caso de que se haya avanzado en la lista hasta el final y no se haya encontrado el elemento, la funcion retornara false.

<table>
<tr>
<td> Desordenada </td> <td> Ordenada </td>
</tr>
<tr>
<td>

 ```Pas
function buscar (l:lista; x:integer):boolean;
var 
    encontre: boolean;
begin
    encontre:=false;
    while (l <> nil) and (not encontre) do
    begin
        if (x = l^.dato) then
            encontre:=true;
        else
            encontre:=false;
    end;
    buscar:=encontre;
end;
```
</td>
<td>

```Pas
function buscar (l:lista; x:integer):boolean;
var //Ordenada De menor a mayor
    encontre: boolean;
begin
    encontre:=false;
    while (l <> nil) and (not encontre) and (x > l^.dato) do
    begin
        if (x = l^.dato) then
            encontre:=true;
        else
            encontre:=false;
    end;
    buscar:=encontre;
end;
```
 
</td>
</tr>
 </table>

Crear_una_Lista_Vacia
=====================
```Pas
begin
    l:=nil;
end.
```

Agregar_un_Elemento_al_Principio_de_la_Lista
============================================
- EL modulo ```Agregar_Adelante``` va a recibir como parametros el puntero inicial de la lista y los datos que va a aguardar la lista.
- En el módulo ```Agregar_Adelante``` se crea una variable de tipo lista.
- Se pide espacio en memoria dinamica ```NEW```.
- En el campo dato de dicha variable se le asigna el dato pasado por parámetro.
- Y en el campo siguiente la dirección de la lista pasada por parámetro.
- Dicho nodo ```L``` de tipo lista, se le asignara lo cargado en la variable local al módulo. El nodo que se crea ira por delande del último.
- Retorna al programa principal o moduló que lo invoco.

Agregar_un_Elemento_al_Final_de_la_Lista
========================================

Eliminar_un_Elemento_de_la_Lista
================================
1. En el módulo se usan dos variables auxiliares que ayudaran a recorrer la lista: ```Actual``` y ```Anterior```
2. Se igual la variable auxiliar ```Anterior```al primer puntero de la lista ```Actual``` al siguiente elemento de la lista para poder recorrer dicha lista sin modificar los enlases.
3. Se recorre la lista con la condición que actual sea distinta de ```Nil``` (y el dato actual sea distinto al buscado en el caso de que se sepa que el dato se encuentra en la lista)
4. Una vez que 'se sale del while' , es necesario saber por que lo hizo (solo en el caso donde no se sepa si el elemento esta en la lista. Si se sabe, no es necesario preguntar porque ya siempre sale porque encontro el elemento). En el caso que lo haya hecho porque se encontro el elemento se vuelve a preguntar si el nodo se trata del primero o de los siguientes para luego hacer el nuevo enlace
5. Se hace ```Dispose``` del elemento actual

Insertar_un_Nuevo_Elemento_en_una_Lista_Ordenada
================================================

Corte_de_control
================
```Pas
Procedure CorteDeControl(var l:info;var v:vCantidadDia;var cant, total:integer);
var
    p:rPrestamos;
    info: rinfo;
begin
    LeerPrestamo(p);
    while (p.ISBN <> -1) do
    begin
        info.ISBN:=p-ISBN;
        info.cantidad:=0;
        while (p.ISBN = info.ISBN) do
        begin
            info.cantidad:=info.cantidad+1;
            v[p.dia]:=v[p.dia]+1;
            if (p.nro_p mod 2 = 1) and (p.nro_s mod 2 = 0) then
                cant := cant + 1;
            leerPrestamo(p);
        end;
        agregarAtras(l,info);
    end;
end;
```
