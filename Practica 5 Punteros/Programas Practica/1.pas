//1) Indicar los valores que imprime el siguiente programa en Pascal.
program punteros;
type
 cadena = string[50];
 puntero_cadena = ^cadena;
var
 pc: puntero_cadena;
begin
 writeln(sizeof(pc), ' bytes');  //4
 new(pc);
 writeln(sizeof(pc), ' bytes'); //4
 pc^:= 'un nuevo nombre';
 writeln(sizeof(pc), ' bytes');  //4
 writeln(sizeof(pc^), ' bytes');  //51   es la cantidad que tiene el string + 1
 pc^:= 'otro nuevo nombre distinto al anterior';
 writeln(sizeof(pc^), ' bytes');  //51
end.
