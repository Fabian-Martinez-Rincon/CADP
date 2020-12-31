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
    dimF=10;    
type
    str50=String[50];
    
    vector= array [1..dimF] of str50;       //510 con dimF=10
    //str50 (50B+1B=51B) * dimF(10)=510
var
    ciudad:vector;
    i:integer;
begin
    WriteLn('El tamanio de memoria que se requiere es de: ',SizeOf(ciudad));
    for i:=1 to dimF do
    begin
        readln(ciudad[i]);    
    end;
end.