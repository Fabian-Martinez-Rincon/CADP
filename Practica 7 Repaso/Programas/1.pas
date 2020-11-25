{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La
lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse. Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
}
program JugamosConListas;
type
    str20=string[20];
    genero=1..5;
    persona=record
        dni:integer;
        apellido:str20;
        nombre:str20;
        edad:integer;
        codigo:genero;

    end;
    
    listaEspera = ^nodo;
    nodo = record
        datos : cliente;
        sig : listaEspera;
    end;
//______________________________________________________________________

var
    
begin
    L := nil;
    
   
    
end.
