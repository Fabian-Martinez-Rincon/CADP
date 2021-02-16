{Una concesionaria de la ciudad de La Plata necesita un programa para administrar
información de ventas de autos efectuadas en febrero de 2020. Para ello, se debe leer la
información de las ventas realizadas. De cada venta se lee: código de venta, modelo de
auto, DNI del cliente al que se vendió el auto, día de la venta (1..28). La información de las ventas se lee de manera ordenada por modelo de auto y finaliza cuando se ingresa el modelo ‘ZZZ’ (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada modelo de auto, la cantidad de veces que fue vendido. Esta estructura debe quedar ordenada por modelo de auto.
B) Calcular e informar el día del mes en que se realizaron más ventas a clientes con DNI impar.
C) Calcular e informar el porcentaje de ventas con código par}

program Concesionaria;
type
    cadena20=string[20];
    venta = record
        codVenta:integer;
        modelo:cadena20;
        dniCliente:integer;
        diaVenta:1..28;
    end;
    lista=^nodo;
    nodo=record
        datos:venta;
        sig:lista;
    end;
    //____________________________________________
    estructura = record
        modelo:cadena20;
        VecesVendido:integer;
    end;
    listaM=^nodoM;
    nodoM=record
        datosM:estructura;
        sigM:listaM;
    end;
    vector_contador= array [1..28] of integer;
//________________________________________________
procedure leerVenta(var V:venta);
begin
    writeln('Modelo: '); ReadLn(V.modelo);
    if (V.modelo <> 'ZZZ') then
    begin
        writeln('Codigo Venta: '); ReadLn(V.codVenta);
        writeln('Dni cliente: '); ReadLn(V.dniCliente);
        writeln('Dia de venta (1..28): '); ReadLn(V.diaVenta);  
    end;
end;
//________________________________________________
procedure Insertar(var L:lista;V:venta);
var
    ant,act,nue:lista;
begin
    new(nue);
    nue^.datos:=V;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.datos.modelo<V.modelo) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant= act) then
    begin
       L:=nue;   
    end
    else
        begin
            ant^.sig:=nue;  
        end;
    nue^.sig:=act;
end;
//________________________________________________
procedure agregarAtras(var LN:listaM;vendidos:integer;modelo:cadena20);
var  act, nue : listaM;
begin 
 new (nue);
 nue^.datosM.modelo:= modelo;
 nue^.datosM.VecesVendido:=vendidos;
 nue^.sigM := NIL;
 if LN <> Nil then begin
                 act := LN ;
                 while  (act^.sigM <> NIL ) do act := act^.sigM ;
                 act^.sigM := nue ;
               end
               else
                 LN:= nue;
end;
//________________________________________________
procedure ImprimirListaNueva(LN:listaM);
begin
    WriteLn('_________');
    while LN <> nil do
    begin
        WriteLn('Modelo: ',LN^.datosM.modelo);
        WriteLn('Veces vendido: ',LN^.datosM.VecesVendido);
        LN:=LN^.sigM;
    end;
end;
//________________________________________________
procedure inicializarVector (var VC:vector_contador);
var
    i:integer;
begin
    for i:=0 to 28 do
    begin
        VC[i]:=0;
    end;
end;
//________________________________________________
function esPar(dni:integer):Boolean;
var
    cumple:Boolean;
    dig:integer;
begin
    cumple:=False;
    while (dni <> 0) and (cumple = False)  do
    begin
        dig:= dni mod 10;
        if ((dig mod 2) = 1) then
        begin
            cumple:=true;
        end;
    end;

end;
//________________________________________________
procedure cargarLista(var L:lista);
var
    V:venta;
    cantVendidos:integer;
    actual:cadena20;
    LN:listaM;
    VC:vector_contador;
    clientePar:Boolean;
    PorcentajePar:real;
    cantcod:integer;
    cantPares:integer;
    ventasPar:Boolean;
begin
    cantPares:=0;
    cantcod:=0;
    PorcentajePar:=0;
    LN:=nil;
    clientePar:=False;
    leerVenta(V);
    inicializarVector(VC);
    while V.modelo <> 'ZZZ' do
    begin
        cantcod:=cantcod+1;
        clientePar:=esPar(V.dniCliente);
        if (clientePar)then
        begin
            VC[V.diaVenta]:=VC[V.diaVenta]+1;
        end;
        ventasPar:=esPar(V.codVenta);
        if (ventasPar)then
        begin
            cantPares:=cantPares+1;
        end;
        Insertar(L,V);
        cantVendidos:=0;
        actual:=V.modelo;
        while (V.modelo <> 'ZZZ') and (actual=V.modelo) do
        begin
            cantVendidos:=cantVendidos+1;
            leerVenta(V);
        end;
        if V.modelo <> 'ZZZ' then
        begin
            WriteLn('Lo que le sumo es: ', cantVendidos);
            agregarAtras(LN,cantVendidos,V.modelo);  
        end;
        PorcentajePar:=(cantPares/cantcod)*100;
        ImprimirListaNueva(LN);
    end;
end;
//________________________________________________
procedure imprimirLista(L:lista);
begin
    while L<>Nil do
    begin
        WriteLn('codigo venta: ',L^.datos.codVenta);
        WriteLn('Modelo: ',L^.datos.modelo);
        WriteLn('dni cliente: ',L^.datos.dniCliente);
        WriteLn('Dia Venta: ',L^.datos.diaVenta);
        L:=L^.sig;
    end;
end;
//________________________________________________
var
    L:lista;
begin
    L:=niL;
    cargarLista(L);
    imprimirLista(L);
end.