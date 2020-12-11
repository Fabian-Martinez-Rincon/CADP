program repaso;
const   
    cant_act = 4;
    dimF = 1000;
type
    cadena = string [40];
    rango_act = 1..dimF;
    rango_clientes = 0..dimF;
    rango_edad = 14..90; 

    dias = 1..31;
    meses = 1..12;
    anios = 1900..3000;

    fecha = record
        d:dias;
        m:meses;
        a:anios;
    precios = array[rango_act] of real; //No lo vamos a usar pero lo declaramos igual
    
    cliente = record
        cod:integer;
        dni:integer;
        ape:cadena;
        nom:cadena;
        fe_ing:fecha;
        edad:rango_edad;
        act:rango_act;
    end;

    clientes = array [1..dimF] of cliente;


//____________________________________________________________
procedure LeerCliente(var c:Cliente);
begin
    readln(c.cod);
    if (c.cod <> -1) then
    begin
        readln(c.dni);
        readln(c.ape);
        readln(c.nom);
        with c.fe_ing do
        begin
            readln(d);
            readln(m);
            readln(a);
        end;
        readln(c.edad);
        readln(c.act);
    end;
end;
//____________________________________________________________
procedure cargar_clientesA(var cli:clientes;var dimL:rango_clientes;var SE:integer);
var
    c:cliente;
begin
    dimL:=0;
    SE:=0;
    LeerCliente(c);
    while (dimL < dimF) and (c.cod <> -1) do
    begin
        dimL:=dimL+1;
        cli[dimL]:=c;
        SE:=SE+cli[dimL].edad;
        LeerCliente(c);
    end;
end;
//____________________________________________________________
procedure cargarPrecios(var vp:precios);
var
    i:rango_act;
begin
    for i:=1 to cant_act do
    begin
        readln(vp[i]);
    end;
end;
//____________________________________________________________
var
    vec_pre:precios;
    cli:clientes;
    c:cliente;
    diml,pos:rango_clientes;
    a:anios;
    act:rango_act;
    suma,codigo,pro:integer;
    exito:boolean;
begin
    cargarPrecios(vec_pre);
    cargar_clientesA(cli ,diml,suma);//A
    
    if (diml > 0) then //B 
    begin
        pro:=suma div diml;
        MostrarClientesB(cli,diml,pro);
    end
    else
        begin
            writeln('No hay datos cargados');  
        end;
        

    codigo:=di[diml].cod; //C
    AsignarDatosClic(codigo,c);
    AgregarCli(di,diml,c,exito);
    if (exito) then writeln('Se agrego un cliente nuevo');
    else    writeln('No es posible agregar Cliente nuevo');
    
    
    readln(codigo);//D
    pos:=BuscoElemOrd(codigo,di,diml);
    if pos <> 0 then 
        writeln(di[pos].nom,di[pos].ape);
    else
        writeln('No se encontro el cliente');
    
    readln(a); //E
    informarE(di,diml,a);
    InsertarElemOrd(di,diml,c,exito);//F
    if exito then
        writeln('Se inserto el cliente con codigo 3300');
    else
        writeln('No hay suficiente');

    readln(codigo); //G
    BorrarElem(di,diml,codigo,exito);
    if exito then
        writeln('Se borro el cliente con codigo: ',codigo);
    else
        writeln('No se pudo borrar el cliente con  codigo:',codigo):
    
    BorrarTodosAct(di,diml,2 )//H
    

end.