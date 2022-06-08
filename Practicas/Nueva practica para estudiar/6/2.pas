program ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
        nodo = record
        dato: persona;
        sig: lista;
    end;
procedure leerPersona(p: persona);
begin
    read(p.dni);
    if (p.dni <> 0)then begin
    read(p.nombre);
    read(p.apellido);
    end;
end;
{Agrega un nodo a la lista}
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo;
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
        end;
end;
procedure imprimirInformacion(var l: lista);
begin
    while (l <> nil) do begin
    writeln('DNI: ', l^.dato.dni, 'Nombre:',
    l^.nombre, 'Apellido:', l^.apellido);
    l:= l^.sig;
    end;
end;
{Programa principal}