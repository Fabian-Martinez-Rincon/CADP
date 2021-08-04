//b) program punteros;
type
    cadena = string[50]; //51 bytes
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes'); //Si le saco el dispose muestra 51 bytes
    writeln(pc^);
    dispose(pc);
    new(pc); //Se genera un bucle infinito porque no reservamos memoria y se rompe todo
    pc^:= 'otro nuevo nombre';
    writeln(sizeof(pc^), ' bytes');
    writeln(pc^);
end.
