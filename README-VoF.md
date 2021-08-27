[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/FabianMartinez1234567/CADP)
[![GitHub stars](https://img.shields.io/github/stars/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP)
<h1 align="center"> 💻Preguntas de V o F </h1>
<div align="center">
<img src="https://media.giphy.com/media/l4JA1COQqiZB6/giphy.gif"/>
 </div>
<br>

## 📚VERDADERO FALSO.

#### 1) Suponga que un programa declara un tipo cadena que es un ```string[1]``` y una variable ```ST:cadena```. La variable ST puede ser utilizada como variable de decision en un case.
- ***VERDADERO*** - funciona como un char

```Pas 
program Uno;
type
	cadena = string[1];
var
    ST:cadena;
begin
    ST := 'A';
    case (ST) of 
        'A' : writeln('Imprime A');  //Entra en 'A'
        'B': writeln('Imprime B');
        else writeln('No funciona');
    end;
end.


```

#### 2) Siendo ```meses``` un tipo de subrango de enteros de 1 a 12, un modulo funcion puede retornar un valor de tipo ```meses```. 
- ***VERDADERO*** - un subrango de enteros(char tambien) es un tipo de dato simple

```Pas
program Dos;
type
	meses = 1..12;
//_______________________________________________
function Cambiar(p:meses):meses;
begin
	p:=10;
	Cambiar:=p;
end;
//_______________________________________________
var
    prueba:meses;
begin
	prueba:=2;
	WriteLn('Prueba: ',prueba); // 2
	prueba:=Cambiar(prueba);
	WriteLn('Prueba: ',prueba); // 10
end.
```

#### 3) Una estructura de control FOR siempre se ejecuta al menos una vez. 
- ***VERDADERO*** - la asignacion inicial del indice siempre ocupa una unidad de tiempo, por lo tanto, siempre se ejecuta una vez / porque se trata de una estructura repetitiva


#### 4) Un arreglo de a lo sumo 4 elementos de tipo caracter ocupa la misma cantidad de memoria estatica que una lista de caracteres sin elementos, es decir una lista vacía. 
- ***VERDADERO*** - puntero = 4 bytes / vector de 4 char = 4 bytes





#### 5) Un modulo cuyo objetivo es modificar el contenido de todos los elementos de una lista de enteros siempre debe recibir el puntero inicial de la lista como parametro por referencia. 
- ***FALSO*** ya que por valor tambien se pueden modificar el contenido de todos los elementos, en cambio si queremos pasarlo por referencia, tenemos que guardar el puntero inicial en una variable aux

```Pas
program PUNTEROS;
type

  l = ^nodo;
  nodo = record
    num:integer;
    sig:l;
  end;
//__________________________________
procedure armarNodo(var lis:l;num:Integer);
var
    nue:l;
begin
    new(nue);
    nue^.num:=num;
    nue^.sig:=lis;
    lis:=nue;
end;
//__________________________________
Procedure cargarLista (var lis:l);
var
    n:integer;
Begin
    ReadLn(n);
    while n <> 0 do
    begin
        armarNodo(lis,n);
        ReadLn(n);
    end;
End;
//__________________________________
procedure Imprimir(lis:l);
begin
    while lis <> nil do
    begin
        WriteLn(lis^.num);
        lis:=lis^.sig;
    end;
end;

//__________________________________
Procedure modificarLista (  lis:l);

Begin
    while lis <> Nil do
    begin
        lis^.num:=lis^.num+1;
        lis:=lis^.sig;
    end;
End;
//__________________________________

Var
   lis: l;
begin
   lis:=Nil;
   cargarLista(lis);
   WriteLn('_______________');
   modificarLista(lis);
   WriteLn('_______________');
   Imprimir(lis);
end.
```

#### 6) Un proceso que no utiliza paramentros no puede comunicarse con el programa principal. 
- ***FALSO*** - A pesar de que estar desaconsejado por la catedra, se pueden usar variables globales


#### 7) Se puede usar un real en el siguiente codigo.
- ***FALSO*** - Solo se puede usar un tipo de dato ordinal en el indice de un case
```Pas
program Siete;
var
    num:Real; //Solo entero
begin
    readln(num);
    case (num) of 
        1..20 : writeln('menor de 20');
        21..50: writeln('entre 21 y 50');
        else writeln('mayor de 100');
    end;
end.

```
#### 8) Todas las operaciones permitidas para variables de tipo entero tambien son permitidas para variables de tipo real. 
- ***FALSO*** - MOD y DIV son operaciones reservadas solo para variables de tipo entero

```Pas
program ocho;
var
    	num1:Real;
	num2:Real;
begin
	num1:=10;
	num2:=5;
	Writeln(num1 div num2); // No se puede :D
	Writeln(num1 mod num2); // No se puede :D
end.

```

#### 9) Siempre es posible reemplazar un FOR por un WHILE y viceversa. 
- ***FALSO***  - FOR -> WHILE se puede, pero WHILE -> FOR no, dado que no se sabe cuantas veces se va a ejecutar el bloque de instrucciones de un WHILE


#### 10) En la tecnica de correccion de DEBUGGING es necesario analizar los casos limites del problema. 
- ***FALSO*** La tecnica que se encarga de corregir los casos limite es el testing, el debuggin se encarga de añadir estructuras como el ```write();``` para saber en que linea esta el error


#### 11) En un procedimiento una estructura de datos vector pasada como parametro siempre ocupa mas memoria que una estructura de tipo lista pasada como parametro 
- ***FALSO*** - En caso de que el arreglo se pase por valor, se copiaria todo el arreglo, en este caso si ocuparia mas memoria que una lista con igual elementos. Pero si el vector es pasado por referencia, es pasado solo la dirección que en este caso serian 4bytes y ocuparia lo mismo que un puntero.


#### 12) Un modulo funcion puede retornar un tipo de dato puntero. 
- ***VERDADERO*** Ya que un puntero es un tipo de dato simple

```Pas
program doce;
type
    puntero = ^string;
//________________________________________
function Cambiar(nombre:string):puntero;
begin
    nombre:='Prueba 2';
    new(Cambiar);
    Cambiar^:=nombre;
end;
//________________________________________
var
    nombre:puntero;
begin
    nombre:=nil;
    new(nombre);
    nombre^:='Prueba 1';
    writeln(nombre^); //Prueba 1
    writeln(Cambiar(nombre^)^); //Prueba 2
end.
```

#### 13) Un modulo cuyo objetivo es buscar un elemento en un arreglo de números enteros ordenados de mayor a menor debe recorrer la estructura mientras el elemento a procesar sea distinto al buscado. 
- ***FALSO*** - Para buscar un elemento en un vector ordenado se debe utilizar una busqueda lineal optimizada o una dicotomica. Una busqueda lineal optimizada no usaria <>, una busqueda dicotomica no recorre el vector, y la unica busqueda que utiliza <> es la lineal. la lineal no se usa en vectores ordenados.
- ***FALSO*** Tenes dos condiciones no una, ya que se puede ejecutar infinitamente, la primera es que mientras el numero sea MayorIgual se ejecuta y la otra condicion es mientras no se pase de la dimensión Logica

```Pas
Function BuscoPosElemOrd (x:integer;v:Vector;dimL:integer):integer;
var 
    pos:integer;
Begin
    pos:=1;
    while (pos <= dimL) and (x < v[pos]) do
        pos:=pos+1;
    if ( pos > dimL ) or (x < v [pos]) then //Si me pase de la DimL del vector reincicio la posición
        pos:=0;                               //y si el elemento es mas chico que el menor numero del vector, tambien reinicio.
    BuscoPosElemOrd:= pos;
End; 
```

#### 14) Un programa que utiliza solo variables globales no requiere modularizacion.
- ***VERDADERO*** - Un programa para que funcione no es necesario la modulación pero La catedra recomienda el uso de modulos porque facilita la reutilizacion de codigo, aumenta la legibilidad, favorece el mantenimiento y facilita el crecimiento de los sistemas.


#### 15) Una diferencia entre la operacion insertar un elemento en la posicion en un vector e insertar un elemento en una posicion en una lista es que no hay que validar la posicion correspondiente.
-  ***FALSO*** - siempre se debe verificar que existe la posicion en una lista
- La lista no es indexada

#### 16) Un programa que compila es correcto.
- ***FALSO*** - un programa puede ser ineficiente, no puede resolver los problemas que se le pide o puede tener errores logicos y aun asi compilar


#### 17) El acceso a un dato de una estructura de datos lineal solo es posible a traves de un recorrido secuencial. 
- ***FALSO*** - un vector, que es una estructura lineal, puede ser accedido de forma directa

#### 18) La técnica de corrección debugging se aplica en el momento del diseño de una solución.

#### 19) Una función puede devolver un tipo de dato registro, real, booleano, integer, entre otros.

#### 20) Un procedimiento puede contener un tipo de dato declarado internamente.

#### 21) Suponga que ustede debe elegir una estructura para representar la siguiente situación. Se desea almacenar en una estructura la información de los alumnos de CADP. De cada alumno se conoce apellido nombre y su promedio. Se sabe que a lo sumo habrá 800 alumnos.
- Cada semana el profesor quiere subir al entorno ***Ideas*** un listado ordenado por el promedio de los alumnos. En qué estructura de las vistas en el curso le convendria haber almacenado los alumnos? Justifique.
- Suponga que ahora el profesor quiere agregar al final de la estructura nuevos alumnos y quiere implementar un módulo que sea eficiente en cuanto a tiempo de ejecución. Elegiría la misma estructura? Justifique.
