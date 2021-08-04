program cosa;
const
    dimFPostre = 3;
    dimFPedidos = 2;
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
        nomPostre:cadena;
        ingredientes:listaPostre;
    end;
    Vpostre = array [rangoPostre] of postre;

    pedido = record
        codigo:rangoPostre;
        cliente:cadena;
        direccion:integer;
    end;
    orden = record
        nombreOrd:cadena;
        direccion:integer;
    end;
    Vpedidos = array [rangoPedidos] of pedido;
    Vpedidos_Ordenado = array [rangoPedidos] of orden;
    vecesPedido = array [rangoPostre] of integer;
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
    
    writeln('Nombre Ingrediente: ');   readln(i.nombre);
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
        writeln(i,': Postre: '); readln(VecPostres[i].nomPostre);
        LeerIngredientes(VecPostres[i].ingredientes);
        
    end;
end;
//_____________________________________________________
procedure ImprimirIngredientes(I:listaPostre);
begin
   
    while I <> nil do
    begin
        writeln('Ingrediente: ',I^.datos.nombre);
        writeln('Cantidad: ',I^.datos.cantidad);
        I:=I^.sig;
    end;
end;
//_____________________________________________________
procedure LeerPedidos(var Ped:Vpedidos);
var
    i:rangoPedidos;
begin
    for i:=1 to dimFPedidos do
    begin
        writeln('Pedido : ',i);
        writeln('Codigo: ');readln(Ped[i].codigo);
        writeln('Cliente: ');readln(Ped[i].cliente);
        writeln('Direccion: ');readln(Ped[i].direccion);
    end;
end;
//_____________________________________________________
procedure ImprimirMenu(VecPostres:Vpostre;VecPedidos:Vpedidos);
var
    i:rangoPedidos;
begin
    for i:=1 to dimFPedidos do
    begin
        writeln('__________________');
        writeln(i,': Postre: ',VecPostres[VecPedidos[i].codigo].nomPostre); 
        ImprimirIngredientes(VecPostres[VecPedidos[i].codigo].ingredientes);
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
procedure MasUsadoPorPostre(VecPostres:Vpostre;VecPedidos:Vpedidos);
var
    i:rangoPedidos;
    MasUsado:cadena;
    cantMax:integer;
begin
    for i:=1 to dimFPedidos do
    begin
        cantMax:=-1;
        writeln('__________________');
        Maximo(VecPostres[VecPedidos[i].codigo].ingredientes,MasUsado,cantMax); 
        writeln('El ingrediente que mas usa en el postre ',VecPostres[VecPedidos[i].codigo].nomPostre,' Es : ',MasUsado);
        writeln('Y su cantidad es: ',cantMax);
    end;
end;
//_____________________________________________________
procedure OrdenarPedidos(var VecOrdenado:Vpedidos_Ordenado;VecPedidos:Vpedidos;VecPostres:Vpostre);
var
    i:rangoPedidos;
begin
    for i:=1 to dimFPedidos do
    begin
        VecOrdenado[i].nombreOrd:=VecPostres[VecPedidos[i].codigo].nomPostre;
        VecOrdenado[i].direccion:=VecPedidos[i].direccion;
        //Trate de hacerlo en un programa separado pero no me funciono
    end;
end;
//_____________________________________________________
procedure ImprimirOrden(VecOrdenado:Vpedidos_Ordenado);
var
    i:rangoPedidos;
begin
    for i:=1 to dimFPedidos do
    begin
        writeln('Nombre: ',VecOrdenado[i].nombreOrd);
        writeln('Direccion: ',VecOrdenado[i].direccion);
    end;
end;
//_____________________________________________________
var
    VecPostres:Vpostre;
    VecPedidos:Vpedidos;
    VecOrdenado:Vpedidos_Ordenado;
begin
    CargarPostres(VecPostres);//Se dispone pero lo hice para probarlo :/
    LeerPedidos(VecPedidos);
    ImprimirMenu(VecPostres,VecPedidos);
    MasUsadoPorPostre(VecPostres,VecPedidos);
    //Funca
    OrdenarPedidos(VecOrdenado,VecPedidos,VecPostres);
    ImprimirOrden(VecOrdenado);//No pude hacer que se imprimar ordenado
    //Parte2

     
end.