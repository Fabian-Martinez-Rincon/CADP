[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/FabianMartinez1234567/CADP)
[![GitHub stars](https://img.shields.io/github/stars/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP)
<h1 align="center"> 💻EJEMPLOS </h1>
<div align="center">
<img src="https://media.giphy.com/media/xT5LMBAKDg2uNd1NW8/giphy.gif"/>
 </div>
<br>

### EJEMPLO 1) Teniendo en cuenta la tabla, calcular la memoria estatica, dinamica y tel tiempo de ejecución.
| Tipo de dato | Memoria |
| ------------- | ------------- |
| Char  | 1 byte  |
| Integer  | 6 byte  |
| Real  | 8 byte  |
| Boolean  | 1 byte  |
| String  | Longitud + 1 byte  |
| Puntero  | 4 byte  |

```Pascal
program Ejercicio5;
const 
  dimF = 100;
type
  rango = 1..dimF;
  vector = array [rango] of ^real;
var
  v:vector;
  dimL,i:integer;
 begin
  dimL:=50;
  for i:=1 to dimL do
  begin
    new(v[i]);
    read(v[i]^);
  end;
  for i:=1 to 25 do 
    v[i]:=nil;
  for i:=26 to 50 do
    dispose(v[i]);
end.
```
### 💾🧍‍♂️ Memoria Estatica.
```Pascal
var
  v:vector;  100 * 4 = 400 Es un vector de punteros
  dimL,i:integer; 6 + 6 = 12
```

```Memoria estatica``` = ```400 + 12```

```Memoria estatica``` = ```412```

### 💾🏃 Memoria Dinamica.
```Pascal
 begin
  dimL:=50;
  for i:=1 to dimL do
  begin
    new(v[i]); (4(nodo) + 8(real)) * dimL
    read(v[i]^);
  end;
  for i:=1 to 25 do 
    v[i]:=nil;
  for i:=26 to 50 do
    dispose(v[i]); -((4(nodo) + 8(real)) * 25)
end.
```
Resultado:

```Memoria Dinamica``` = ```((4(nodo) + 8(real)) * dimL)``` + ``` -(((4(nodo) + 8(real)) * 25)```

```Memoria Dinamica``` = ```((4(nodo) + 8(real)) * 100)``` + ``` -(((4(nodo) + 8(real)) * 25)```

```Memoria Dinamica``` = ```(12 * 100)``` + ``` -(12 * 25)```

```Memoria Dinamica``` = ```(1200)``` - ``` (300)```

```Memoria Dinamica``` = ```900```

Memoria Total = ```Memoria Estatica + Memoria Dinamica```

Memoria Total = ```412 + 900```

Memoria Total = ```1312```

### ⌚💀🔪 Tiempo de Ejecución.

```Pascal
 begin
  dimL:=50;  + 1ut
  for i:=1 to dimL do  (3*100 + 2)
  begin
    new(v[i]);  + 1ut
    read(v[i]^);
  end; 
  = (3*100 + 2) + (100 * 1ut) 
  = 302ut + 100ut 
  = 402ut
  for i:=1 to 25 do  (3*25 + 2)
    v[i]:=nil; + 1ut
  = (3 * 25 + 2) + (25 * 1ut) 
  = 102ut
  for i:=26 to 50 do (3 * 25 + 2)
    dispose(v[i]); + 1ut
  = (3 * 25 + 2) + (25 * 1ut) 
  = 102ut
end.
```
Resultado = ```1ut + 402ut + 102ut + 102ut ```

Resultado = ``` 607ut ```
</table>
