{Leer la edad de un estudiante e informar 
1 si pertenece al preescolar (edad menor a 7),
2 a primaria (entre 7 y 12),
3 a secundaria (entre 13 y 18) 
y 4 a universitario (mayor que 18).
}

program ClasificacionEdad;
var
    edad: integer;
begin
    writeln('Ingrese la edad del estudiante:');
    readln(edad);

    if edad < 7 then
        writeln('1')  // Preescolar
    else if (edad >= 7) and (edad <= 12) then
        writeln('2')  // Primaria
    else if (edad >= 13) and (edad <= 18) then
        writeln('3')  // Secundaria
    else
        writeln('4'); // Universitario
end.
