{program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin // Te tira un error ya que es necesario que alla un new antes de poder usarlo
    new(pc);
    pc^:= 'un nuevo texto';
    
    writeln(pc^);
end.}

{program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes');
    writeln(pc^);
    dispose(pc);
    writeln(sizeof(pc^), ' bytes');
    //pc^:= 'otro nuevo nombre'; // Tira error ya que al liberar la memoria, lo unico que tenemos que 
    //Hacer es volver a guardar la memoria

end.}

{program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);
    cambiarTexto(pc);
    writeln(pc^);
end.
}
{program punteros;
type
 cadena = string[50];
 puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
 new(pun);
 pun^:= 'Otro texto';
end;
var
 pc: puntero_cadena;
begin
 new(pc);
 pc^:= 'Un texto';
 writeln(pc^);
 cambiarTexto(pc);
 writeln(pc^);
end.
}
