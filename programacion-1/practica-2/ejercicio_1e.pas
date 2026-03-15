{Leer el año de nacimiento de una persona e informar la generación a la que pertenece: 
“B”  si es  Baby Boomer (1946-1964);
“X” si es  Generación X  (1965-1980); 
“M” si es Millennials (1981-1996),
y “Z” si es Generación Z (1997-presente) 
y “A” si es anterior a 1946.}

program GeneracionPersona;
var
    anioNacimiento: integer;
    generacion: char;
begin
    writeln('Ingrese el año de nacimiento:');
    readln(anioNacimiento);

    if anioNacimiento < 1946 then
        generacion := 'A'
    else if (anioNacimiento >= 1946) and (anioNacimiento <= 1964) then
        generacion := 'B'
    else if (anioNacimiento >= 1965) and (anioNacimiento <= 1980) then
        generacion := 'X'
    else if (anioNacimiento >= 1981) and (anioNacimiento <= 1996) then
        generacion := 'M'
    else
        generacion := 'Z';

    writeln('La generación es: ', generacion);
end.