//Indicar los valores que imprime el siguiente programa en Pascal.
program punteros;
type
    cadena10 = string[10];
    puntero1 = ^integer;
    puntero2 = ^Real;
    puntero3 = ^Boolean;
    puntero4 = ^cadena10;
    puntero5 = ^Char;
var
    p1: puntero1; //Integer 2 bytes
    p2: puntero2; //Real 8 bytes
    p3: puntero3; //Boolean 1 bytes
    p4: puntero4; //string 256 bytes o n + 1
    p5: puntero5; //Char 1 byte
begin
    writeln(sizeof(p1), ' bytes');
    new(p1);
    writeln(sizeof(p1), ' bytes');
    writeln(sizeof(p1^), ' bytes');
    writeln('________________');
    writeln(sizeof(p2), ' bytes');
    new(p2);
    writeln(sizeof(p2), ' bytes');
    writeln(sizeof(p2^), ' bytes');
    writeln('________________');
    writeln(sizeof(p3), ' bytes');
    new(p3);
    writeln(sizeof(p3), ' bytes');
    writeln(sizeof(p3^), ' bytes');
    writeln('________________');
    writeln(sizeof(p4), ' bytes');
    new(p4);
    writeln(sizeof(p4), ' bytes');
    writeln(sizeof(p4^), ' bytes');
    writeln('________________');
    writeln(sizeof(p5), ' bytes');
    new(p5);
    writeln(sizeof(p5), ' bytes');
    writeln(sizeof(p5^), ' bytes');

end.