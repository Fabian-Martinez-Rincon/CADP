{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les entregará
el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el promedio obtenido
durante toda su carrera.
Implementar un programa que:
a. Lea la información de los todos egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados que
recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor a menor).}

program cosa;
type
    vector = array [1..4] of Char;
    
    lista=^puntero;
    puntero = record
        dato:String;
        sig:lista;
    end;
var
    v:vector;
    l:lista;
begin
    l:=Nil;
    writeln(sizeof(v), ' bytes');
    writeln(sizeof(l), ' bytes');
end.