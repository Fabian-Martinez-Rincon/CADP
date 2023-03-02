[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/FabianMartinez1234567/CADP)
[![GitHub stars](https://img.shields.io/github/stars/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP)
<h1 align="center"> 💻CADP </h1>
<div align="center">
<img src="https://media.giphy.com/media/1C8bHHJturSx2/giphy.gif"/>
 </div>
<br>

***Aca esta la carpeta de cadp, con todos los ejercicios de todas las practicas***

- [Resumen Final](/Archivos/resumenFinal.md)
- [Preguntas de verdadero o falso](/Archivos/README-VoF.md)
- [Preguntas Teoricas](/Practicas/Teoricas.md)
- [Ejemplos de memorias y tiempo](/Archivos/Ejemplos-Memorias_Tiempos.md)
- [Eliminar Ocurrencias vector ordenado](/Parciales/Sergio/Parcial_Sergio.md)
- [Vectores](/Practicas/Vectores.md)
- [Listas](/Practicas/Listas.md)


### 1) Teniendo en cuenta la tabla, calcular la memoria estatica, dinamica y el tiempo de ejecución.

<table>
 <tr>
  <td> Problema </td> <td> Tabla </td>
  </tr>
 <tr>
 <td>
<div>
 
```Pascal
program Problema;
type
  cadena35 = string[35];
  empleado = record
    dirCorreo: cadena35;
    edad: integer;
    sueldo:real;
  end;
  
  punt = ^empleado;
  vector = array [1..500] of punt;
  
  lista = ^nodo;
  nodo = record
    dato: empleado;
    sig: lista;
  end;
  
var
  v:vector;
  l,aux:lista;
  emp:empleado;
  i:integer;
begin
  l:=nil;
  for i:=1 to 10 to 
  begin
    read(emp.dirCorreo, emp.edad, emp.sueldo);
    if (emp.edad < 40) and (emp.sueldo < 40000) then
      exp.sueldo:= exp.sueldo + 7000;
    new(aux); 
    aux^.dato := emp;
    aux^.sig: := l;
    l := aux;    
  end;
end.
  
```  
 </div>
</td>
<td>
 
| Tipo de Dato | Memoria |
| ------------- | ------------- |
| Char  | 1 byte  |
| Integer  | 6 byte  |
| Real  | 8 byte  |
| Boolean  | 1 byte  |
| String  | Longitud + 1 byte  |
| Puntero  | 4 byte  |
 
 
</td>

</tr>
</table>

## Resolución
La tabla del inicio puede variar dependiendo la pc o los profesores que te toquen ya que en este caso es teorico.


### 💾🧍‍♂️ Memoria Estatica.
Es la suma de las variables declaradas en el `Var` del programa principal.
En este ejemplo seria: 
```Pascal
var
  v:vector;
  l,aux:lista;
  emp:empleado;
  i:integer;
```
Hacemos los calculos:
``` 
v:vector; 500 * 4b (Al ser un puntero, siempre vale lo que nos marca en la tabla, aunque apunte a otras variables)
2000 bytes
l,aux:lista; 4b + 4b = 8 bytes
emp:empleado; 
i:integer;
```
Recordemos que:
```Pascal
empleado = record
  dirCorreo: cadena35;    (35 + 1b)
  edad: integer;   6b
  sueldo:real;    8b
end:
 ```
 Nos quedaria: 
 
 ```
 v:vector; 2000b
 l,aux:lista; 8 bytes
 emp:empleado;  (35 + 1b) + 6b + 8b = 50 bytes 
 i:integer; 6b
 ```
  
 ```Dimension Fisica``` = ```v + l,aux + emp + i```
 
 ```Dimension Fisica``` = ```2000b + 8b + 50b + 6b```

```Dimension Fisica``` = ```2064 bytes``` 

### 💾🏃 Memoria Dinamica.
La memoria dinamica se empieza a calcular a partir del primer ```new();```, en caso de no encontrarse en el programa no tendriamos que hacer ninguna operación. Y asi como se suma memoria dinamica con el ```new();``` se restaria (Libera) con el ```Dispose();```

```Pascal
for i:=1 to 10 to 
  begin
    read(emp.dirCorreo, emp.edad, emp.sueldo);
    if (emp.edad < 40) and (emp.sueldo < 40000) then
      exp.sueldo:= exp.sueldo + 7000;
    new(aux); <-------------------------- Aux fue decladaro como lista y lista es un puntero a nodo
    aux^.dato := emp;
    aux^.sig: := l;
    l := aux;    
  end;
```
Recordemonos que:

```Pascal
lista = ^nodo;
  nodo = record
    dato: empleado; 50 bytes (Ya lo calculamos arriba)
    sig: lista; 4 bytes (Puntero)
  end;  50b + 4b = 54 bytes
```
Concluimos que el ```new(aux); es 54 bytes``` y al estar dentro de un for que va hasta 10, lo que tenemos que hacer es: 

```Memoria Dinamica``` = ```54b * 10``` 

```Memoria Dinamica``` = ```540 bytes``` 

### ⌚💀🔪 Tiempo de Ejecución.
| Codigo | Tiempo (ut) |
| ------------- | ------------- |
| readln();   | 0ut  |
| writeln();  | 0ut  |
| else  | 0ut + contenido  |
| x := 0;  | 1ut  |
| x := y;  | 1ut  |
| new();  | 0ut  |
| Dispose();  | 0ut  |
| l:=nil;  | 1ut  |
| x := y (+,-,*,/,mod,div) x;  | 2ut  |
| if () then  | (1ut por op.elem) + contenido (<,>,<>,=,or,and,not,/,*,+,-) |
| for i:=1 to n  | ((3*n+2)ut) + (n * contenido)  |
| while() do  | (n + 1ut por op.elem) + (n * contenido)  |repeat until
| repeat until() | Ni idea  |
| case ():  | Ni idea :D (HELP!)  |

Ya sabiendo lo anterior, solo nos quedaria hacer las operaciones
```Pascal
begin
  l:=nil;  1ut
  for i:=1 to 10 to   (3*10+2) 
  begin
    read(emp.dirCorreo, emp.edad, emp.sueldo);   0ut
    if (emp.edad < 40) and (emp.sueldo < 40000) then   (1ut + 1ut + 1ut) 
      exp.sueldo:= exp.sueldo + 7000;   2ut
    new(aux); 1ut
    aux^.dato := emp; 1ut
    aux^.sig: := l; 1ut
    l := aux;    1ut
  end;
end.
```
Nos quedaria: 

```Tiempo de ej``` = ```1ut + ((3*10+2) + (((1ut + 1ut + 1ut) + 2ut) + 1ut + 1ut + 1ut + 1ut) * 10)``` 

```Tiempo de ej``` = ```1ut + ((3*10+2) + (((3ut) + 2ut) + 4ut)*10)``` 

```Tiempo de ej``` = ```1ut + ((32ut) + (9ut)*10)``` 

```Tiempo de ej``` = ```1ut + ((32ut) + 90ut)``` 

```Tiempo de ej``` = ```1ut + (122ut)``` 

```Tiempo de ej``` = ```123ut``` 



### 2) Cual de las dos opciones consume menos memoria total (Memoria estatica +  Memoria dinamica).

<table>
 <tr>
  <td> A </td> <td> B </td><td> Tabla </td>
  </tr>
 <tr>
 <td>
  

```Pas 
program opcion_A;
type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;
var
    l,nue:lista;
    i:integer;
begin
    l:=Nil;
    for i:=l to 6 do begin
        new(nue);
        nue^.dato:=i;
        nue^.sig:=l;
        l:=nue;
    end;
end. 
  ```  
  </td>
  
<td>
   
```Pas
program opcion_B;
type
    vector = array [1..10] of integer;
var
    v:vector;
    i,dimL:integer;
begin
    dimL:=0;
    for i:=1 to 6 do begin
        dimL:=dimL + 1;
        v[i]:=i;
    end;
end.
```  
</td>
<td>
 
| Dato | Memoria |
| ------------- | ------------- |
| Char  | 1 byte  |
| Integer  | 6 byte  |
| Real  | 8 byte  |
| Boolean  | 1 byte  |
| String  | Long + 1 byte  |
| Puntero  | 4 byte  |
 
 
</td>

</tr>
</table>

A)

<table>
<tr>
<td> Memorias </td> <td> Resultado </td>
</tr>
<tr>
<td> Memoria Estatica:

```Pas
var
    l,nue:lista; 4b + 4b = 8bytes
    i:integer; 6bytes
``` 

</td>
<td>

Memoria Estatica = ```14 bytes```

</td>
 </tr>
 <tr>
 <td>
  Memoria Dinamica:

```Pas
begin
    l:=Nil; 
    for i:=l to 6 do begin
        new(nue); 4bytes + (6bytes) = 10 bytes
        nue^.dato:=i; 
        nue^.sig:=l; 
        l:=nue; 
    end;
    6 * 10b
end. 
```  
  </td>
 
 <td>
  
Memoria Dinamica = ```(6*10)```

Memoria Dinamica = ```60 bytes```

Memoria Total = ```60b + 14b``` = ```74 bytes```
  
 </td>
</tr>
</table>

B)

<table>
<tr>
<td> Memorias </td> <td> Resultado </td>
</tr>
<tr>
<td>
Memoria Estatica:

```Pas
var
    v:vector; 10*6 = 60 b
    i,dimL:integer; 6 + 6  = 12 b
```
</td>
<td>
 
Memoria Estatica = ```72 bytes```
 
</td>
</tr>
<tr>
<td>
Memoria Dinamica:

```Pas
begin
    dimL:=0;
    for i:=1 to 6 do begin
        dimL:=dimL + 1;
        v[i]:=i;
    end;
end.
```
</td>
<td>
Memoria Dinamica = No tiene :D
</td>
 </tr>
</table>



Justificación:
- El ***A*** es el que ocupa menos memoria ya que en el B con tan solo la memoria estatica, este supera al A en memoria total
