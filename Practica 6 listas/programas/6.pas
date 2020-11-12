{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto se
lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa el código -1, que no
debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.
}
program JugamosConListas;
type
    str20=string[20];
    producto = record
        codigo:integer;
        descripcion:str20;
        stock_actual:integer;
        stock_minimo:integer;
        precio:real;
    end;
    lista = ^nodo;
    nodo = record
    num : producto;
    sig : lista;
end;
//________________________________________________________________________________________________________
procedure armarNodo(var L: lista; v: producto);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

//________________________________________________________________________________________________________
procedure LeerProducto(var productoF:producto);
begin
    with productoF do
    begin
        WriteLn('Codigo:'); ReadLn(codigo);
        if (codigo <> -1) then
        begin
        WriteLn('Descripcion:'); ReadLn(descripcion);
        WriteLn('stock actual:'); ReadLn(stock_actual);
        WriteLn('stock minimo:'); ReadLn(stock_minimo);  
        WriteLn('Precio:'); ReadLn(precio);
        end;  
    end;
end;
//________________________________________________________________________________________________________
procedure minimos(ListaF:lista;var porcentajeF:Real);
var
    contMinimo:integer;
    cantElementos:integer;
begin
    contMinimo:=0;
    cantElementos:=0;
    while (ListaF <> Nil) do
    begin
        if((ListaF^.num.stock_actual)<(ListaF^.num.stock_minimo))then
        begin
            contMinimo:=contMinimo+1;
        end;
        cantElementos:=cantElementos+1;
        ListaF:=ListaF^.sig;
    end;
    porcentajeF := (contMinimo/cantElementos)*100;
end;
//________________________________________________________________________________________________________
procedure imprimirNodo(ListaF:lista);
begin
  while (ListaF <> NIL) do begin
        writeln (ListaF^.num.codigo) ;
        writeln (ListaF^.num.descripcion);
        writeln (ListaF^.num.stock_actual);
        writeln (ListaF^.num.stock_minimo);
        writeln (ListaF^.num.precio:2:2) ;
        ListaF:= ListaF^.sig
    end;
end;
//________________________________________________________________________________________________________
procedure digPares(ListaF:lista);
var
 dig: integer;
 par:integer;
 codigo:integer;
begin
    codigo:=ListaF^.num.codigo;
    par:=0;
    while (codigo <> 0) do begin
        dig:= codigo mod 10;
        if((dig mod 2)= 0) then
            begin
                par:=par+1;
                codigo := codigo DIV 10;
            end 
            else
                codigo := codigo DIV 10;
    end;
    if (par>=3)then
    begin
        WriteLn('La descripcion del codigo: ',ListaF^.num.codigo,' Es: ',ListaF^.num.descripcion);
        par:=0;
    end
    else 
    begin
        par:=0;
    end;
       
    
    
end;

//________________________________________________________________________________________________________
procedure Productos_economicos(ListaF:lista;var cod_menor1:Real;var cod_menor2:Real);
begin
    while ListaF <> Nil do
    begin
    if(ListaF^.num.precio<cod_menor1) then
				begin
					cod_menor2:=cod_menor1;
					cod_menor1:=ListaF^.num.precio;
				end
			else
				begin
					if(ListaF^.num.precio<cod_menor2) then
						begin
							cod_menor2:=ListaF^.num.precio;
						end
				end;
        ListaF:= ListaF^.sig;            
    end;
end;
//________________________________________________________________________________________________________
procedure todo(ListaF:lista);
begin
    while ListaF <> NIL do
    begin
        digPares(ListaF);
        ListaF:= ListaF^.sig;
    end;
    
end;
//________________________________________________________________________________________________________
var
    ListaP : lista;
    prod:producto;
    porcentaje:real;
    codigo_economico1:Real;
    codigo_economico2:Real;
begin
    codigo_economico1:=9999;
    codigo_economico2:=9999;
    porcentaje:=0;
    ListaP := nil;
    writeln('Ingrese un producto');
    LeerProducto(prod);
    while (prod.codigo <> -1) do
       begin
        armarNodo(ListaP, prod);
        writeln('Ingrese un producto');
        LeerProducto(prod);
    end;
    //imprimirNodo(ListaP);
    minimos(ListaP,porcentaje);//A
    WriteLn(porcentaje:2:2);
    //B
    todo(ListaP);
    //C
    Productos_economicos(ListaP,codigo_economico1,codigo_economico2);
    WriteLn('El codigo mas economico es: ', codigo_economico1:4:3);
    WriteLn('El segundo codigo mas economico es: ', codigo_economico2:4:3);
    
end.
