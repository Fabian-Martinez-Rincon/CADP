{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por  las críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por código de película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como parámetro (el mismo puede no existir).
}
program JugamosConListas;
type
    cadena15=string[15];
    pelicula =record   
        codPeli:integer;
        titulo:integer;
        Codigo:-1..8;
        puntuajeProm:real;
    end;
    critica= record
        DNI:integer;
        apellido:cadena15;
        nombre:cadena15;
        CodigoC:-1..8;
        puntuajeC:real;
    end;
    Lista=^nodo;
    Nodo= record
        Datos:critica;
        sig:Lista;
    end; 
    vector_contador = array [1..7] of integer;

//___________________________________________________
procedure LeerCritica(var C:critica);
begin
    writeln('DNI');readln(C.DNI);
    writeln('Apellidp');readln(C.apellido);
    writeln('Nombre');readln(C.nombre);
    writeln('Codigo');readln(C.CodigoC);
    writeln('Puntuaje');readln(C.puntuajeC);
end;
//___________________________________________________
procedure CargarCritica(L:lista);
var
    C:critica;
begin
    LeerCritica(C);
    while C.CodigoC <> -1 do
    begin
        LeerCritica(C);  
    end; 
end;
//___________________________________________________
var
    L:lista;
    
begin
    L := nil;
    CargarCritica(L);
    
end.
