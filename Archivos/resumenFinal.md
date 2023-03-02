[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/FabianMartinez1234567/CADP)
[![GitHub stars](https://img.shields.io/github/stars/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/FabianMartinez1234567/CADP)](https://github.com/FabianMartinez1234567/CADP)
<h1 align="center"> 💻Resumen Final </h1>
<div align="center">
<img src="https://media.giphy.com/media/deaNFvbQh2zIOILdlU/giphy-downsized-large.gif"/>
 </div>
<br>

Este readme se baso en un word que rondaba por los grupos que me ayudo a aprobar el final de CADP. El chico no tiene github, asique no lo puedo recomendar :(. Con este repo y lo de tiempo en la primera pagina, estas sobrado para aprobar el final.

# Indice

- [Clase 1](#clase-1)
- [Clase 2](#clase-2)
- [Clase 3](#clase-3)
- [Clase 4](#clase-4)
- [Clase 6](#clase-6)
- [Clase 9](#clase-9)
- [Clase 10](#clase-10)
- [Clase 13](#clase-13)

---

# Clase 1

## Informatica 

Es la ciencia que estudia el análisis y resolución de problemas utilizando
computadoras.

- **`Ciencia:`** Se relaciona con una metodología fundamentada y racional para el estudio y resolución de los problemas(se vincula con la matemática y la ingeniería)
- **`Resolución:`**  se puede aplicar para diferentes áreas
- **`Computadora:`**  Máquina digital y sincrónica, con cierta capacidad de cálculo numérico y lógico controlado por un programa almacenado y con probabilidad de comunicación con el mundo exterior. Ayuda al hombre a realizar tareas repetitivas en menor tiempo y con mayor exactitud. **No razona ni crea soluciones**, sino que ejecuta una serie de órdenes que le proporciona el ser humano
- **`Objetivo:`** Es resolver problemas del mundo real utilizando una computadora (utilizando un software)

## Paradigmas

Tenemos distintos tipos de paradigmas, como Imperativo, Orientado a Objetos, Lógico, Funcional. Aca veremos el Imperativo.

## Pasos

Los pasos son detallados, pero lo principal que necesitamos seria **`1)` Poseer un problema**. Luego le siguen los siguientes en Orden

### `2)` Modelizar el problema

Qué acciones permitir, como realizarlas y qué efecto genera

- Pensar que acciones se van a permitir y que implica cada acción permitida
    - Define los mecanismos de interacción necesarios
    - Establece el efecto sobre la máquina y el usuario
    - Indica los informes necesarios
- **`Abstracción:`** Interpretar los problemas de mundo real(analizando sus aspectos
esenciales), para poder expresarlo en términos precisos
- **`Modelización:`**  A partir de la expresión de la abstracción, se busca simplificarlo buscando sus:
    - **`1)`** Aspectos Principales
    - **`2)`** Datos a Procesar
    - **`3)`** Contexto del Problema (este puede imponer restricciones)
- **`Especificación:`**  Determinar el objetivo del problema. Consiste en establecer unívocamente el contexto, las precondiciones y las poscondiciones

### `3)` Modularizar la solución

Descomponer el problema en partes más pequeñas para obtener una solución
- Reduce la complejidad
- Poder reutilizar módulos
- Distribuir el trabajo

### `4)` Realizar el programa

Se va diseñar su implementación: esto requiere escribir el programa y elegir los datos a representar.

<h4 align="center"> PROGRAMA = ALGORITMO + DATOS</h4>

- **`Programa:`**  Es un conjunto de instrucciones(que pueden ejecutarse sobre una computadora), que cumplen con una función específica
- **`Algoritmo:`**  Especificación rigurosa de la secuencia de pasos (instrucciones) a realizar sobre un autómata para alcanzar un resultado deseado en un tiempo finito.
    - Suponemos que empieza y termina (**tiempo finito**)
    - Se debe expresar en forma clara y unívoca (**especificación rigurosa**)
    - Si el **autómata** es una computadora, las instrucciones tiene que ser `entendibles` y ejecutables por la máquina. <br>
    Las **instrucciones** (que también se han denominado acciones) representan las operaciones que ejecutará la computadora al interpretar el programa.
- **`Datos:`** Es una representación de un objeto del mundo real mediante la cual podemos modelizar aspectos del problema que se quiere resolver con un programa sobre
una computadora. Puede ser constante o variable.



<table>
<tr>
<td> Para el desarrollador </td> <td> Para la Computadora </td>
</tr>
<tr>
<td>
 
- **`Operatividad:`** El programa debe realizar la función para la que fue concebido.
- **`Legibilidad:`** El código fuente de un programa debe ser fácil de leer y entender. Esto obliga a acompañar a las instrucciones con comentarios adecuados.
- **`Organización:`** El código de un programa debe estar descompuesto en módulos que cumplan las subfunciones del sistema.
- **`Documentados:`** Todo el proceso de análisis y diseño del problema y su solución debe estar documentado mediante texto y/o gráficos para favorecer la compresión, la modificación y la adaptación a nuevas funciones.
</td>
<td>
 
- Debe contener instrucciones válidas
- Deben terminar.
- No deben utilizar recursos inexistentes.

</td>

</tr>
 
</table>

### `5)` Utilizar la computadora

- La computadora es una máquina capaz de aceptar datos de entrada, efectuar con ellos
cálculos aritméticos y lógicos y dar información de salida (resultados), bajo control de un programa previamente almacenado en su memoria.
- **`Lenguaje de Programación:`**  Es un conjunto de instrucciones permitidas (las cuales están definidas por reglas semánticas y sintácticas), que se utilizan para expresar soluciones de problemas.

## TIPOS DE DATOS

Un tipo de dato es una clase de objetos de datos ligados a un conjunto de operaciones para
crearlos y manipularlos.

- Tienen un rango de valores posibles
- Tienen un conjunto de operaciones permitidas
- Tienen una representación interna (tipo de dato):
    <table>
    <tr><td>Simple</td><td>Compuesto</td></tr>
    <tr>
    <td>

    - Definido por el Lenguaje:
        - Numérico
        - Caracter
        - Booleano
    - Definido por el programador:
        - Subrango
        - Puntero
    </td>
    <td>

    - Definido por el lenguaje:
        - String
    - Definido por el programador:
        - Registro
        - Arreglos
        - Listas
    </td>
    </tr>
    </table>
- **`Definido por el programador:`** Permiten definir nuevos tipos de datos a partir de los tipos simples.
- **`Definido por el lenguaje:`** Son provistos por el lenguaje y tanto la representación como sus operaciones y valores son reservadas al mismo
- **SIMPLE:**  Aquellos que toman un único valor, en un momento determinado, de todos los permitidos para ese tipo
- **COMPUESTO:** Pueden tomar varios valores a la vez que guardan alguna relación lógica entre ellos, bajo un único nombre

### Numerico

Representa el conjunto de números que se pueden necesitar. Estos números pueden ser
enteros o reales.

- **`Entero`**
    - Tipo de dato simple y ordinal
    - Al tener una representación interna tienen un número máximo y otro mínimo
    - Operaciones
        - +, -, * , /, <, >, =, <=, =>, MOD(resto entero), DIV(cociente entero)
- **`Real`**
    - Tipo de dato simple (representa números con coma)
    - Al tener una representación interna, tienen un número mínimo y uno máximo
    - Operaciones
        - +, -, *, /, <, >, =, <=, =>

El orden de precedencia para la resolución es:
- **`1)`** operadores *, /
- **`2)`** operadores +, -
- **`3)`** operadores div y mod

En caso que el orden de precedencia natural deba ser alterado, es posible la utilización de paréntesis dentro de la expresión.

### Lógico

Representa datos que pueden tomar dos valores Verdadero (true) o falso (false)

- Es un tipo de dato simple y ordinal
- Operaciones
    - OR, AND, NOT
- Orden de Precedencia
    - **`1)`** NOT
    - **`2)`** AND
    - **`3)`** OR

### Carácter

Representa un conjunto finito y ordenado de caracteres que la computadora reconoce. Un dato de tipo carácter contiene sólo un carácter

- Tipo de dato simple y ordinal
- ‘a’, ‘b’, ‘@’
- Operaciones
    - =, <, >, <=, =>, <>

### Variable

Es una zona de memoria que tiene un contenido.La dirección inicial de esta zona se asocia con el nombre de la variable.

**Puede cambiar su valor durante el programa.**

### Constante

Es una zona de memoria que tiene un contenido.La dirección inicial de esta zona se asocia con el nombre de la variable.

**NO puede cambiar su valor durante el programa.**

`const Identificador = valor;`


- Los diferentes tipos de datos deben especificarse y a esta especificación dentro de un programa se la conoce como `declaración`.
- Algunos lenguajes exigen que se especifique a qué tipo pertenece cada una de las variables. Verifican que el tipo de los datos asignados a esa variable se correspondan con su definición. Esta clase de lenguajes se denomina `fuertemente tipados` (strongly typed).
- Otra clase de lenguajes, que verifica el tipo de las variables según su nombre, se denomina `auto tipados` (self typed).
- Existe una tercera clase de lenguajes que permiten que una variable tome valores de distinto tipo durante la ejecución de un programa. Esta se denomina `dinámicamente tipados` (dinamically typed).
- `Pre Condicion`
    - Lo que nosotros queremos que el programa haga
    - Es la información que se conoce como verdadera antes de iniciar el programa (ó módulo).
- `Post Condicion`
    - Como quedarian cada una de las variables después de ejecutarse el programa
    - Es la información que debería ser verdadera al concluir el programa (o módulo), si se cumplen adecuadamente los pasos especificados
- `Read (Lectura)` Se usa para tomar datos desde un dispositivo de entrada (por defecto desde teclado) y asignarlos a las variables correspondientes.
- `Write (Escritura)` Se usa para mostrar el contenido de una variable, por defecto en pantalla.

<h2 align="center"> 💻ESTRUCTURAS DE CONTROL </h2>

<table>
  <tr><td colspan="2">Secuencia</td></tr>
  <tr>
    <td colspan="2"> 
      Representada por una sucesión de operaciones (por ej. asignaciones), en la que el
      orden de ejecución coincide con el orden físico de aparición de las instrucciones.
    </td>
  </tr>
  <tr><td colspan="2">Decisión</td></tr>
  <tr>
    <td>
        En un algoritmo representativo de un
        problema real es necesario tomar
        decisiones en función de los datos del
        problema.
    </td>
      <td>
        <img width="2000px" src="https://user-images.githubusercontent.com/55964635/222421756-e50b5d86-71e2-4e76-92b3-0039541de0fb.png"/>
    </td>
  </tr>
  <tr><td colspan="2">Iteración</td></tr>
  <tr>
    <td colspan="2"> 

- Cuando quiero repetir una cantidad de veces que desconozco (xq depende de una
condición), una o un conjunto de acciones
- Pueden ser **`Pre-Condicionales`** o **`Post-Condicionales`**
    </td>
  </tr>
    <tr><td colspan="2">Pre-Condicionales(While)</td></tr>
  <tr>
    <td>

Evalúan la condición y si es verdadera se ejecuta el bloque de acciones. **Dicho bloque se pueda ejecutar 0, 1 ó más veces**. 
      Se ejecuta mientras sea verdadera. 
      (El valor inicial de la condición debe ser conocido o evaluable antes de la 
      evaluación de la condición)
    </td>
      <td>

![image](https://user-images.githubusercontent.com/55964635/222425025-738c1370-e762-47ea-93b7-da425bce7351.png)
    </td>
  </tr>
    <tr><td colspan="2">Post-Condicionales(Repeat-Until)</td></tr>
  <tr>
    <td>

  Ejecutan las acciones luego evalúan la condición y ejecutan las acciones mientras la condición es falsa. **Puede ejecutarse 1 o más veces.**
    </td>
      <td>

![image](https://user-images.githubusercontent.com/55964635/222425196-c944962f-60c8-4e32-a786-8bae17fc5cd5.png)
    </td>
  </tr>
  </tr>
    <tr><td colspan="2">Repetición</td></tr>
  <tr>
    <td>

Es una extensión natural de la
secuencia. Consiste en repetir N
veces un bloque de acciones. Este
número de veces que se deben
ejecutar las acciones es fijo y
conocido de antemano.

Índice:

- tipo ordinal
- No puede modificarse dentro del lazo.(se incrementa y decrementa automáticamente)
- Cuando el for termina la variable índice no tiene valor definido.

    </td>
      <td>

![image](https://user-images.githubusercontent.com/55964635/222426441-8bcfd9e2-1960-4fbe-9732-f13e3a1bea92.png)
    </td>
  </tr>
</table>



---

## Clase 2

---

## Clase 3

---

## Clase 4

---

## Clase 6

---

## Clase 9

---

## Clase 10

---

## Clase 13