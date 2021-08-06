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
1. Mientras la lista sea distina de nil va a pasar al siguiente nodo, es decir, a L se le va a asignar la dirección del siguiente nodo (en memoria dinamica)

Buscar_un_Elemento_en_una_Lista
===============================

Crear_una_Lista_Vacia
=====================
l:=nil;

Agregar_un_Elemento_al_Principio_de_la_Lista
============================================
1. EL modulo ```Agregar_Adelante``` va a recibir como parametros el puntero inicial de la lista y los datos que va a aguardar la lista.
2. En el módulo ```Agregar_Adelante``` se crea una variable de tipo lista.
3. Se pide espacio en memoria dinamica ```NEW```.
4. En el campo dato de dicha variable se le asigna el dato pasado por parámetro.
5. Y en el campo siguiente la dirección de la lista pasada por parámetro.
6. Dicho nodo ```L``` de tipo lista, se le asignara lo cargado en la variable local al módulo. El nodo que se crea ira por delande del último.
7. Retorna al programa principal o moduló que lo invoco.

Agregar_un_Elemento_al_Final_de_la_Lista
========================================

Eliminar_un_Elemento_de_la_Lista
================================

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
