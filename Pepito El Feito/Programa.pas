program cosa;
const
    dimFPostre = 3;
    dimFPedidos = 20;
type
    cadena = string [40];
    rangoPostre = 1..dimFPostre;
    rangoPedidos = 1..dimFPedidos;


    datosIng = record
        nombre:cadena;
        cantidad:integer
    end;
    
    listaPostre = ^nodo;
    nodo = record
        datos:datosIng;
        sig:listaPostre;
    end;

    postre = record
        nomPastelero:cadena;
        ingredientes:listaPostre;
    end;
    Vpostre = array [rangoPostre] of postre;

    pedido = record
        codigo:integer;
        cliente:cadena;
        direccion:integer;
    end;

    Vpedidos = array [rangoPedidos] of pedido;
//_____________________________________________________
procedure agregarAdelante(var LisIngre:listaPostre;i:datosIng);
var
    nue:listaPostre;
begin
    new(nue);
    nue^.datos:=i;
    nue^.sig:=LisIngre;
    LisIngre:=nue;
end;
//_____________________________________________________
procedure DatosIngrediente(var i:datosIng);
begin
    
    writeln('Nombre Producto: ');   readln(i.nombre);
    writeln('Cantidad');            readln(i.cantidad);
end;
//_____________________________________________________
procedure LeerIngredientes(var LisIngre:listaPostre);
var
    ingrediente:datosIng;
begin
    DatosIngrediente(ingrediente);
    while (ingrediente.cantidad <> -1) do
    begin
        agregarAdelante(LisIngre,ingrediente);
        DatosIngrediente(ingrediente);
    end;
end;

//_____________________________________________________
procedure CargarPostres(var VecPostres:Vpostre);
var
    i:rangoPostre;
begin
    writeln('Cambia al ingresar Cantidad = -1');
    for i:=1 to dimFPostre do
    begin
        writeln(i,': Pastelero: '); readln(VecPostres[i].nomPastelero);
        LeerIngredientes(VecPostres[i].ingredientes);
        
    end;
end;
//_____________________________________________________
procedure ImprimirIngredientes(I:listaPostre);
begin
   
    while I <> nil do
    begin
        writeln('Nombre: ',I^.datos.nombre);
        writeln('Cantidad: ',I^.datos.cantidad);
        I:=I^.sig;
    end;
end;
//_____________________________________________________
procedure ImprimirMenu(VecPostres:Vpostre);
var
    i:rangoPostre;
begin
    for i:=1 to dimFPostre do
    begin
        writeln('__________________');
        writeln(i,': Pastelero: ',VecPostres[i].nomPastelero); 
        ImprimirIngredientes(VecPostres[i].ingredientes);
    end;
end;
//_____________________________________________________
procedure Maximo(I:listaPostre;var MasUsado:cadena;var cantMax:integer);
begin
    while I <> nil do
    begin
        if (I^.datos.Cantidad>cantMax)then
        begin
            cantMax:=I^.datos.Cantidad;
            MasUsado:=I^.datos.nombre;
        end;
        I:=I^.sig;
    end;
end;
//_____________________________________________________
procedure MasUsadoPorPostre(VecPostres:Vpostre);
var
    i:rangoPostre;
    MasUsado:cadena;
    cantMax:integer;
begin
    for i:=1 to dimFPostre do
    begin
        cantMax:=-1;
        writeln('__________________');
        Maximo(VecPostres[i].ingredientes,MasUsado,cantMax); 
        writeln('El ingrediente que mas usa en el postre ',i,' Es : ',MasUsado);
        writeln('Y su cantidad es: ',cantMax);
    end;
end;
//_____________________________________________________
var
    VecPostres:Vpostre;
begin
    CargarPostres(VecPostres);
    ImprimirMenu(VecPostres);
    //Hasta aca funciona todo bien (No rompas nada Fabian)
    MasUsadoPorPostre(VecPostres);
end.