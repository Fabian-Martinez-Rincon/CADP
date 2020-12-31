{6) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener una longitud máxima 50 caracteres.
a)Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño de memoria
que requiere la estructura.
b) Dado que Pascal no permite manejar estructuras de datos estáticas que superen los 64 Kb, pensar en utilizar un
vector de punteros a palabras, como se indica en la siguiente estructura:
Type Nombre = String[50];
 Puntero = ^Nombre;
 ArrPunteros = array[1..2500] of Puntero;
Var
Punteros: ArrPunteros;

b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
b.2) Escribir un módulo que permita reservar memoria para los 2.500 nombres. ¿Cuál es la cantidad de memoria
reservada después de ejecutar el módulo?
b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}
program puntero6;
 const
    dimF=2500;    
Type
    Nombre = String[50];
    Puntero = ^Nombre;
    ArrPunteros = array[1..dimF] of Puntero;
    cosa=^ArrPunteros;
Var
    Punteros: ArrPunteros;
    cosa2:cosa;
begin
    WriteLn('El tamanio de memoria que se requiere es de: ',SizeOf(Punteros)); //comienza con 10.000 (la dimF*B(puntero))
    //2500*4
    new (cosa2);
    WriteLn('El tamanio de memoria que se requiere es de: ',SizeOf(cosa2)); //4B
    
end.