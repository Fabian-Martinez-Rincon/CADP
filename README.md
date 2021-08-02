[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/FabianMartinez1234567/CADP)
[![GitHub stars](https://img.shields.io/github/stars/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP)
# Pascal
Aca esta la carpeta de cadp, con todos los ejercicios de todas las practicas 
### Teniendo en cuenta la tabla, calcular la memoria estatica, dinamica y el tiempo de ejecución.
| Tipo de tato     | Memoria | -|   -|-|   -|
| ---      | ---       | --- |--- |--- |--- |
| Char | 1 bytes         |Real| 8 bytes| String  |Longitud + 1 bytes|
| Integer |  6 bytes|  Boolean| 1 bytes  |Puntero|4 bytes|


```Pascal
program Ejemplo;
type
  cadena35 = string[35];
  empleado = record
    dirCorreo: cadena35;
    edad: integer;
    sueldo:real;
  end:
  
  punt = empleado^;
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
    if (emp.edad < 40) and () and () then
      exp.sueldo:= exp.sueldo + 7000;
    new(aux); 
    aux^.dato := emp;
    aux^.sig: := l;
    l := aux;    
  end;
end.
  
```
## Resolución
La tabla del inicio puede variar dependiendo la pc o los profesores que te toquen ya que en este caso es teorico.


### - Memoria Fisica.
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
 emp:empleado;  (35 + 1b) + 6b + 8b = 50 bytes 
 i:integer; 6b
 ```
  
 ```Dimension Fisica``` = ```v + l,aux + emp + i```
 
 ```Dimension Fisica``` = ```2000b + 8b + 50b + 6b```

```Dimension Fisica``` = ```2064b``` 

### - Memoria Dinamica
La memoria dinamica se empieza a calcular a partir del primer ```new();```
