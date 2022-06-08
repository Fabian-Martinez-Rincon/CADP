{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto se
lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa el código -1, que no
debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

type 
    cadena15 = String[15];
    producto = record
        codigo:integer;
        descripcion:cadena15;
        stock_actual:integer;
        stock_minimo:integer;
        precio:integer;
    end;
    lista = ^nodo;
    nodo = record
        dato:producto;
        sig:lista;
    end;
//___________________________________________________
procedure LeerProducto(var p:producto);
begin
    Write('Codigo: '); ReadLn(p.codigo);
    if (p.codigo <> -1) then
    begin
        Write('Descripcion: '); ReadLn(p.descripcion);
        Write('Stock Actual: '); ReadLn(p.stock_actual);
        Write('Stock Minimo: '); ReadLn(p.stock_minimo);
        Write('Precio: '); ReadLn(p.precio);
    end;
end;
//___________________________________________________
procedure ordenarLista(var l:lista;p:producto);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=p;
    nue^.sig:=l;
    l:=nue;
end;
//___________________________________________________
procedure cargarLista(var l:lista);
var
    p:producto;
begin
    LeerProducto(p);
    while (p.codigo <> -1) do
    begin
        ordenarLista(l,p);
        LeerProducto(p);
    end;
end;
//___________________________________________________
procedure contarDigitosPares(Codigo:integer;var cont_P:integer);
var
    dig:integer;
begin
    dig:=0;
    while Codigo <> 0 do
    begin
        dig:= Codigo mod 10;
        if ((dig mod 2) = 0) then
        begin
            cont_P:=cont_P+1;
        end;
        Codigo:=Codigo div 10;
    end;
end;
//___________________________________________________
procedure dosMas(codigo:integer;precio:integer;var codMas1,precioMas1,codMas2,precioMas2:Integer);
begin
    if (precio<precioMas1) then
    begin
        precioMas2:=precioMas1;
        codMas2:=codMas1;
        precioMas1:=precio;
        codMas1:=codigo;
    end
    else
        begin
            if (precio < precioMas2) then
            begin
                precioMas2:=precio;
                codMas2:=codigo;
            end;
        end;
end;
//___________________________________________________
procedure A(l:lista);
var
    cantidad:integer;
    total:integer;
    porcentaje:real;
    digitosPares:integer;
    codMas1:integer;
    codMas2:integer;
    precioMas1:integer;
    precioMas2:integer;
begin
    codMas1:=0;
    codMas2:=0;
    precioMas1:=999;
    precioMas2:=999;
    porcentaje:=0;
    total:=0;
    cantidad:=0;
    while (l <> nil) do
    begin
        
        if (l^.dato.stock_actual < l^.dato.stock_minimo) then
        begin
            cantidad:=cantidad+1;
        end;
        total:=total+1;

        digitosPares:=0;
        contarDigitosPares(l^.dato.codigo,digitosPares);
        if (digitosPares = 3) then
        begin
            WriteLn(l^.dato.descripcion);
        end;

        dosMas(l^.dato.codigo,l^.dato.precio,codMas1,precioMas1,codMas2,precioMas2);

        l:=l^.sig;
    end;
    porcentaje:=(cantidad / total)*100;
    WriteLn('El porcentaje de productos con stock por debajo es',porcentaje);
end;
//___________________________________________________
var
    l:lista;
begin
    l:=Nil;
    cargarLista(l);
    A(l);
end.