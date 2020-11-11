{2. Dado el siguiente código, identificar los 9 errores.}
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
    read(p.dni); //Error 1 no podemos leer el espacio de memoria, falta el ^
    if (p.dni <> 0)then 
    begin
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
    while (p.dni <> 0) do
    begin //error 2 Falta un incremento de posicion ya que se queda en un bucle infinito
        agregarAdelante(l,p);
    end;
end;

procedure imprimirInformacion(var l: lista);
    begin
    while (l <> nil) do
    begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido); //error 4 y 5 estan mal declaradas
        l:= l^.sig;
    end;
end;

procedure agregarAdelante(l:lista;p:persona);
var
    aux: lista;
begin //Error 3 Falta el new para el aux
    aux^.dato:= p;
    aux^.sig:= l;
    l:= aux;
end;

var
    l:lista;
begin
    generarLista(l);
    imprimirInformacion(l);
end.
