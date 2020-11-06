//2) Indicar los valores que imprime el siguiente programa en Pascal.
program punteros;
type
    cadena = string[9]; 
    producto = record
    codigo: integer;    //2 bytes
    descripcion: cadena;  //9+1 bytes
    precio: real;   //4 bytes
end;
puntero_producto = ^producto;
 
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes');  //4
    writeln(sizeof(prod), ' bytes'); //24
    {new(p);
    writeln(sizeof(p), ' bytes'); //4
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes'); //24
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');  //24
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');  //24}
end.
