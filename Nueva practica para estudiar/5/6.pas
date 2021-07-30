{6) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener una 
longitud máxima 50 caracteres. 
a)Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño de memoria 
que requiere la estructura. 
b) Dado que Pascal no permite manejar estructuras de datos estáticas que superen los 64 Kb, pensar en utilizar un 
vector de punteros a palabras, como se indica en la siguiente estructura:}
Type Nombre = String[50];
 Puntero = ^Nombre;
 ArrPunteros = array[1..2500] of Puntero; // 127.500 bytes
Var
Punteros: ArrPunteros;
{b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
b.2) Escribir un módulo que permita reservar memoria para los 2.500 nombres. ¿Cuál es la cantidad de memoria 
reservada después de ejecutar el módulo?
b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}
