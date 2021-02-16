{
}
program Parcial;
type
    cadena15=string[15];
    pelicula = record
        titulo: cadena15;
        duracion:integer;
        categoria:1..4;
    end;
    VectorPeli= array [1..10] of pelicula;
    espectador= record
        dni:integer;
        apellido:cadena15;
        nombre:cadena15;
        cod_peli:1..10;
        categoria:1..4;
    end;
    lista=^nodo;
    nodo=record
        Datos:espectador;
        sig:lista;
    end;
    vector_contador= array [1..4] of integer;
    nueva=record
        apellido:cadena15;
        nombre:cadena15;
    end;
    listaDos=^nodoDos;
    nodoDos=record
        DatosDos:nueva;
        sigDos:listaDos;
    end;
//___________________________________________________
procedure LeerEspectador(var E:espectador);
begin
    ReadLn(E.dni);
    if (E.dni <> -1)then
    begin
        ReadLn(E.apellido);
        ReadLn(E.nombre);
        ReadLn(E.cod_peli);
        ReadLn(E.categoria);
    end;
end;
//___________________________________________________
procedure OrdenarAtraz(var L:lista;E:espectador);
var  
    act, nue : lista;
begin 
 new (nue);
 nue^.Datos:= E;
 nue^.sig := NIL;
 if L <> Nil then 
 begin
    act := L ;
    while  (act^.sig <> NIL ) do 
        act := act^.sig ;
        act^.sig := nue ;
    end
    else
        L:= nue;
end;
//___________________________________________________
procedure CargarLista(var L:lista);
var
    E:espectador;
begin
    LeerEspectador(E);
    while E.dni <> -1 do
    begin
        OrdenarAtraz(L,E);
        LeerEspectador(E);
    end;
end;
//___________________________________________________
procedure inicalizarVC (var VC:vector_contador);
var 
    i:integer;
begin
    for i:=1 to 4 do
    begin
        VC[i]:=0;
    end;
end;
//___________________________________________________
procedure actualizarMaximos (VC:vector_contador;var categoria1,categoria2:Integer);
var 
    i:integer;
    maximo1:integer;
    maximo2:integer;
begin
    maximo1:=-1;
    maximo2:=-1;
    for i:=1 to 4 do
    begin
        if VC[i]> maximo1 then
        begin
            maximo2:=maximo1;
            categoria2:=categoria1;
            maximo1:=VC[i];
            categoria1:=i;
        end
        else
            begin
                if (VC[i]>maximo2)then
                begin
                    maximo2:=VC[i];
                    categoria2:=i;
                end;  
            end;
    end;
end;
//___________________________________________________
function DNIPar (dni:integer):Boolean;
var
    dig:integer;
    Cumple:boolean;
begin
    Cumple:=True;
    while (dni <> 0) and (Cumple=True) do
    begin
        dig:=dni mod 10;
        if ((dig mod 2) = 1) then
        begin
            Cumple:=false;
        end;
        dni:=dni div 10;  
    end;
   DNIPar:=Cumple;
end;
//___________________________________________________
procedure OrdenarLN(var LN:listaDos;apellido:cadena15;nombre:cadena15);
var
    nue:listaDos;
begin
    New(nue);
    nue^.DatosDos.apellido:=apellido;
    nue^.DatosDos.nombre:=nombre;
    nue^.sig:=LN;
    LN:=nue;
end;
//___________________________________________________
procedure RecorrerLista(L:lista);
var 
    VP:VectorPeli;
    contEspect:integer;
    VC:vector_contador;
    categoria1:Integer;
    categoria2:integer;
    cumple:boolean;
    LN:listaDos;
begin
    LN:=Nil;
    inicalizarVC(VC);//Se dispone
    contEspect:=0;
    while L <> nil do
    begin
        if (VP[L^.Datos.categoria].duracion >=90)then
        begin
            contEspect:=contEspect+1;
        end;
        VC[L^.Datos.categoria]:=VC[L^.Datos.categoria]+1;
        cumple := DNIPar (L^.Datos.dni);
        if (cumple) then
        begin
            OrdenarLN(LN,L^.Datos.apellido,L^.Datos.nombre);
        end;
        L:=L^.sig;
    end;
    WriteLn('La cantidad de espectadores que eligen peliculas de al menos 90 minutos son: ', contEspect);
    actualizarMaximos(VC,categoria1,categoria2);
    WriteLn('Las dos categorias mas elegidas por los espectadores son: ', categoria1,categoria2);

end;
//___________________________________________________
procedure EliminarDNI(var L:lista;dni:integer;var E:Boolean);
var 
    ant, act:lista;
begin   
    E:=false;
    act:=L;
    while (act <> nil) and (act^.Datos.dni <> dni) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> Nil) then
    begin
        exito:=true;
        if (act=L) then L:=act^.sig;
        else    ant^.sig:=act^.sig;
        dispose(act);
    end;

end;
//___________________________________________________
var
    L:lista;
    dniEliminar:integer;
    exito:Boolean;
begin
    L:=nil;
    CargarLista(L);
    RecorrerLista(L);
    ReadLn(dniEliminar);
    EliminarDNI(L,dniEliminar,exito);
    
end.
