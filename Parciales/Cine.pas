program Concesionaria;
type
    cadena20=string[20];
    pelicula= record
        titulo:cadena20;
        duracion:integer;
        categoria:1..4;
    end;
    vectorPelis= array [1..10] of pelicula;
//______________________
    espectador= record
        dni:integer;
        apeynom:cadena20;
        codPeli:1..10;
    end;
    lista=^nodo;
    nodo=record
        datos:espectador;
        sig:lista;
    end;
    vectorContador=array [1..4] of integer;
//________________________
    apellidosYNombres=cadena20;

    listaM=^nodo2;
    nodo2=record
        datos2:apellidosYNombres;
        sig2:listaM;
    end;
//________________________
procedure LeerEspectador(var E:espectador);
begin
    ReadLn(E.dni);
    if E.dni <> -1 then
    begin
        ReadLn(E.apeynom);
        ReadLn(E.codPeli);
    end;
end;
//__________________________________________
procedure AgregarAlFinal (var L: lista; E: espectador); 
var  act, nue : lista;

begin 
 new (nue);
 nue^.datos:= E;
 nue^.sig := NIL;
 if L <> Nil then begin
                 act := L ;
                 while  (act^.sig <> NIL ) do act := act^.sig ;
                 act^.sig := nue ;
               end
               else
                 L:= nue;
end;

//__________________________________________
procedure CargarEspectadores(var L:lista);
var
    E:espectador;
begin
    LeerEspectador(E);
    while E.dni <> -1 do
    begin
        AgregarAlFinal(L,E);
        LeerEspectador(E);
    end;
end;
//__________________________________________
procedure inicializarVC(var VC:vectorContador);
var
    i:integer;
begin  
    for i:=0 to 4 do
    begin
        VC[i]:=0;
    end;
end;
//__________________________________________
procedure CatMasElegidas(VC:vectorContador;var catmax1,catmax2 : integer);
var
    max1:integer;
    max2:integer;
    i:integer;
begin
    max1:=-1;
    max2:=-1;
    for i:=1 to 4 do
    begin
        if VC[i]>max1 then
        begin
            max2:=max1;
            catmax2:=catmax1;
            max1:=VC[i];
            catmax1:=i;
        end
        else
            begin
                if (VC[i]>max2)then
                begin
                    max2:=VC[i];
                    catmax2:=i;
                end; 
            end;
    end;
end;
//__________________________________________
procedure agregarAdelante (var LN:listaM;apeynom:cadena20);
var
    nue:listaM;
begin
    new(nue);
    nue^.datos2:=apeynom;
    nue^.sig2:=LN;
    LN:=nue;
end;
//__________________________________________
function esPar(dni:integer):Boolean;
var
    cumple:boolean;
    dig:integer;
begin
    cumple:=true;
    while (dni <> 0) and (cumple=true) do
    begin
        dig:=dni mod 10;
        if ((dig mod 2)<>0) then
        begin
            cumple:=false;
        end;
        dni:=dni div 10;
    end;
    esPar:=cumple;
end;
//__________________________________________
procedure RecorrerLista(L:lista);
var
    cont90:integer;
    VP:vectorPelis;
    VC:vectorContador;
    categoriaMax1:integer;
    categoriaMax2:integer;
    dniPar:Boolean;
    LN:listaM;//La lista del punto B.3
begin
    inicializarVC(VC);
    LN:=Nil;
    cont90:=0;
    while L<>nil do
    begin
        if (VP[L^.datos.codPeli].duracion <= 90) then //B.1
        begin
            cont90:=cont90+1;
        end;
        VC[VP[L^.datos.codPeli].categoria]:=VC[VP[L^.datos.codPeli].categoria]+1; //B.2
        //___________________________________________B.3
        dniPar:=esPar(L^.datos.dni);
        if (dniPar) then
        begin
            agregarAdelante(LN,L^.datos.apeynom);
        end;
        //___________________________________________
        L:=L^.sig;
    end;
    CatMasElegidas(VC,categoriaMax1,categoriaMax2); //B.2
end;
//__________________________________________
procedure EliminarDni(var L:lista;dni:integer;var exito:Boolean);
var
    ant, act:lista;
begin
    exito:=false;
    act:=L;
    while (act <> nil) and (act^.datos.dni<dni) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if act <> nil then 
    begin
        exito:=true;
        if (act = L) then
        begin
            L:=act^.sig;
        end   
        else
            begin
                ant^.sig:=act^.sig;
            end;    
        dispose(act);
    end;
end;
//__________________________________________
var
    VC:vectorPelis;
    L:lista;
    dni:integer;
    exito:Boolean;
begin
    //CargarPelis(VC);//Se dispone
    CargarEspectadores(L);
    RecorrerLista(L);
    ReadLn(dni);
    EliminarDni(L,dni,exito);
end.