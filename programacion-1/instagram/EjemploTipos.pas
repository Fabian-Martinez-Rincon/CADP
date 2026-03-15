program EjemploTipos;
var
    edad: integer; altura: real;
    esMayor: boolean;letra: char;
    nombre: string;
begin
    edad := 20;
    altura := 1.75;
    esMayor := true;
    letra := 'F';
    nombre := 'Fabian';

    writeln('Integer: ', edad);
    writeln('Real: ', altura:0:2);
    writeln('Boolean: ', esMayor);
    writeln('Char: ', letra);
    writeln('String: ', nombre);
end.