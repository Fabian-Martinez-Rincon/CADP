program finalCADP;
type
    rango = 1..300;    
    cadena20 = string[20];
    venta = record
        nroProd : rango;
        cantVendida: integer;
        nomProducto:cadena20;

    end;
    precios = array [rango] of real;
    venta2 = record
        precio:real;
        nombre:cadena20;
    end;
    totalPrecio= array[rango] of venta2;
    listaVentas = ^nodo;
    nodo = record
        dato:venta;
        sig:listaVentas;
    end;


//____________________________________________________
procedure CargarPrecios(var p:precios);
var
    i:integer;
begin
    for i:=1 to 300 do
    begin
        p[i]:=i;
    end;
end;
//____________________________________________________
procedure calcularMinimo(preTotal:totalPrecio;var menor:cadena20);
var
    i:integer;
    minimo:integer;
begin
    minimo:=9999;
    for i:=1 to 300 do
    begin
        if (preTotal[i].precio < minimo ) then
        begin
            minimo:=preTotal[i].precio;
            menor:=preTotal[i].nombre;
        end;
    end;
end;

//____________________________________________________
procedure CalcularMenor(p:precios; L:listaVentas;var menorPrecio:cadena20);
var
    precioTotal:integer;
    actual:integer;
    preTotal:totalPrecio;
begin
    InicializarPrecios(preTotal);//Se dispone
    precioTotal:=0;
    while (L <> nil) do
    begin
        actual:=L^.dato.nroProd;
        precioTotal:=0;
        while (L<>Nil) and (actual:=L^.dato.nroProd) do
        begin
            precioTotal:=L^.dato.cantVendida*p[L^.dato.nroProd];
            preTotal[L^.dato.nroProd].precio:=preTotal[L^.dato.nroProd].precio+precioTotal;
            preTotal[L^.dato.nroProd].nombre:=L^.dato.nomProducto;
            L:=L^.sig;
        end;
    end;
    calcularMinimo(preTotal,menorPrecio);
end;
//____________________________________________________
var
    p:precios;
    menorPrecio:cadena20;
    L:listaVentas;
begin
    L:=nil;
    CargarVentas(L);//Se dispone
    CargarPrecios(p);//Se dispone
    CalcularMenor(p,L,menorPrecio);
    WriteLn('El nombre del menor producto es: ', menorPrecio);
end.