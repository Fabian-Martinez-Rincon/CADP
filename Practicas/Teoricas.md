
<h1 align="center"> 💻Preguntas Teoricas </h1>
<div align="center">
<img src="https://media.giphy.com/media/l4JA1COQqiZB6/giphy.gif"/>
 </div>
<br>

## 📚Final 1.
### 1) Practica:
Un comercio dispone de las ventas realizadas para sus productos. De cada venta se conoce Numero 
de Producto(1..300), Cantidad Vendida y Nombre de Producto. Ademas el comercio cuenta con una 
tabla con el precio por unidad de cada uno de los 300 productos. Se pide calcular el nombre con el 
cual el comercio obtuvo la menor ganancia. 
Notas: las ventas estan ordenadas por numero de producto. Un producto pudo ser vendido 0, 1 o 
mas veces.

### 2) Eficiencia:
1. Defina concepto de eficiencia.
2. Explique como se procede si lo que se desea es calcular la memoria empleada en una solución. ¿Y si se desea calcular el tiempo de ejecución?.
3. Respecto a la solución planteada en el punto 1, y desde el punto de vista de la eficiencia en tiempo ¿Es conveniente que las ventas esten ordenadas por nro de producto?- Justifique detalladamente.

### 3) Estructura de Datos:
1. Defina concepto.
2. Plantee y explique las distintas clasificaciones de las Estructura de Datos.
3. Plantee detalladamente la operacion de Insersion de un elemento en la estructura de datos lista enlazada y vector. Analice distintas propuestas.

### 4) Parametros:
1. Defina el concepto de parametro en el contexto de la modurarización.
2. Que tipos de parametros conoce. Describa en que se clasifica cada tipo.
3. ¿Por qué cree que es util para el programador contar con los parametros para escribir soluciones 
modularizadas?.

## 📚Final 2.
#### 1) Practica: Realice un módulo que lee números enteros entre 0 y 100 y devuelva un vector que contenga la cantidad de ocurrencias de los valores leídos. La lectura finaliza cuando se lee el valor 0.
- Ejemplo: Si se leen valores: 1,20,55,7,1,7,0 entonces el vector resultante deberá contener la información necesaria para saber que:
- Valor 1 cantidead de ocurrencias 2
- Valor 20 cantidad de ocurrencias 1
- Valore 55 cantidad de ocurrencias 1 
- Valor 7 cantidad de ocurrencias 2

### 2) Modularización.
1. Defuba ek cibceoti de Modularización y sus principales ventajas.
2. Explique las diferencias entre variable global, variable locas, parámetro por valor y parámetro por referencias.

### 3) Estructuras de Datos.
1. Defina y caracterice el tipo de dato Lista Enlazada. Especifique una representación posible en Pascal.
2. Describa detalladamente el problema de eliminar todas las ocurrencias de un valor en la estructura mencionada, teniendo en cuenta que la misma puede estar ordenada o no.

### 4) Eficiencia
1. Defina el concepto de eficiencia.

## 📚Final 3.
### 1) Práctica.
Una inmobiliaria de la ciudad de La Plata necesita un programa para administrar información sobre los inmuebles que tuvo alquilados en el 2016. Para ello se dispone de la información  sobre inmuebles. (1: monoambiente, 2: departamente, 3: casa, 4: local), DNI del dueño, DNI del inquilino y precio del alquiler. La lectura finaliza cuando se lee el inmueble con codigo 999. La informacion está almacenada ***de manera ordenada por DNI del nueño***.
1. Para cada dueño la cantidad de inmuebles que tuvo alquilados con precio de alquiler superior a 5000.
2. El precio de alquiler promedio de aquellos inmuebles tipo departamento.

### 2) Estructuras de Datos.
1. Definición de estructuras de datos. Esplique los distintos criterios de clasificación.
2. Realice un cuadro con los criterios de clasificación ubicando a las estructuras de datos vistas en el curso.
3. Implemente la operación agregar un elemento en un arreglo y en una lista.

### 3) Modularización y parámetros.
1. Defina el concepto de módulo. Qué módulos reconoce el lenguaje Pascal y cuándo usaria cada uno.
2. ¿Todo procedimiento se puede escribir como una function? Muestre con un ejemplo.
3. Defina alcance de una variable. Un parámentro, ¿qué alcance tiene?

### 4) Eficiencia.
1. Defina el concepto de eficiencia.
2. Describa detalladamente que se tiene en cuenta para analizar la eficiencia de un algoritmo.
3. ¿Toda la solución correcta es eficiente? Justifique.
4. ¿Las estructuras de datos elegidas determinan que una solución se eficiente? Justifique.
5. Analice la eficiencia en tiempo de ejecución de sus soluciones del ejercicio 2c.

## 📚Final 4.

### 1) Práctica.
1. Implemente un módulo que recibe una lista de números enteros ordenada de menor a mayor (Pueden aparecer repetidos) y devuelva otra lista en la cual aparezca cada número de la lista de entrada junto con la cantidad de repeticiones del mismo.
2. Implemente el programa que contenga dicho módulo con su invocación.

### 2) Modularización.
1. Defina el concepto de modularización. Describa sus principales ventajas.
2. Detalle al menos tres diferencias entre los módulos: Procedure y function.
3. ¿Siempre se puede transformar un módulo function en un módulo tipo procedure? Justifique detalladamente y ejemplifique su respuesta.

### 3) Eficiencia.
1. Defina el concepto de eficiencia.
2. Describa detalladamente como medir la eficiencia.
3. ¿Un programa correcto asegura la eficiencia? Justifique su respuesta.
4. ¿Un programa bien documentado asegura eficiencia? Justifique su respuesta.
5. ¿Un programa modularizado asegura eficiencia? Justifique su respuesta.

### 4) Estructuras de Datos.
1. Defina el concepto de estructura de datos y explique las distintas clasificaciones.
2. Defina y diferencie las estructuras de datos: Registro, vector y lista enlazada.
3. Implemente la operación agregar en el vector y la operación agregar atrás de una lista enlazada.
4. Realice un análisis del tiempo de ejecucion de las operaciones implementadas en el c)

## 📚Final 5.
### 1) Práctica: Implementar un programa que:
1. Genere una lista de nombres de personas. Los nombres se leen de teclado hasta que se ingresa el nombre "ZZZ"
2. Leer un nombre de teclado y elimine eficientemente todas las ocurrencias de ese nombre que aparecen en la lista generada en a).

#### 2) Señale y justifique los errores del procedimiento "INSERTAR" cuyo objetivo es insertar un elemento, en una posición determinada de un vector.
```Pas
procedure INSERTAR (var V:vector; dimL:integer; dato:integer; pos:integer);
begin
    if ((dimL+1) <= dimF) then begin
        for i:= dimL to pos do v[i+1];
        v[i]:=dato;
        dimL:=dimL+1;
    end;
end;  
```
#### 3) Explique brevemente cual es la importancia de que el lenguaje permita tipos de datos definidos por el usuario.
#### 4) ¿Qué diferencia existe entre un lenguaje "fuertemente" tipado con uno "dinamicamente" tipado?
#### 5) Explique brevemente el riesgo de utilizar variables globales para la comunicación entre módulos.
