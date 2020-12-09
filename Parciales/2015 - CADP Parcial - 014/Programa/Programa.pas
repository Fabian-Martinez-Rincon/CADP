program Parcial;
Type
    cadena=string[40];
    proyecto = record
        nroInterno:integer;
        descripcion:cadena;
        anioInicia:1..2021;
        anioFin:1..2021;
        codLenguaje:1..5;
        cantPersonas:integer;
        cantHoras:integer;
    end;
    lenguajeCosto = array [1..5] of integer;
    lista=^nodo;
    nodo=record
        datos:proyecto;
        sig:lista;
    end;
    vector_contador=array[1..5] of integer;
//____________________________________________
procedure LeerP(var P:proyecto);
begin
    readln(P.nroInterno);
    readln(P.descripcion);
    readln(P.anioInicia);
    readln(P.anioFin);
    readln(P.codLenguaje);
    readln(P.cantPersonas);
    readln(P.cantHoras);
end;
//____________________________________________
procedure agregarAdelante(var L:lista;P:proyecto);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=P;
    nue^.sig:=L;
    L:=nue;
end;
//____________________________________________
procedure LeerInfo(var L:lista);
var 
    P:proyecto;
begin
    LeerP(P);
    while  (P.nroInterno <> 0) do
    begin
        agregarAdelante(L,P);
        LeerP(P);
    end;
end;
//____________________________________________
procedure inicializarVC (var VC:vector_contador);
var
    i:integer;
begin
    for i:=1 to 5 do
    begin
        VC[i]:=0;
    end;
end;
//____________________________________________
procedure dosMaximos(VC:vector_contador;var Lmax1,Lmax2:integer);
var
    i:integer;
    mayor1:integer;
    mayor2:integer;
begin
    mayor1:=-1;
    mayor2:=-1;
    for i:=1 to 5 do
    begin
        if VC[i]>mayor1 then
        begin
            mayor2:=mayor1;
            Lmax2:=Lmax1;
            mayor1:=VC[i];
            Lmax1:=i;
        end
        else
            begin
                if VC[i]>mayor2 then
                begin
                    mayor2:=VC[i];
                    Lmax2:=i;
                end;
            end;
    end;
end;
//____________________________________________
function esIpar(interno:integer):Boolean;
var
    impar:integer;
    dig:integer;
    cumple:Boolean;
begin
    impar:=0;
    cumple:=False;
    while (interno <> 0) and (cumple=False) do
    begin
        dig:=interno mod 10;
        if ((dig mod 2) = 1) then
        begin
            impar:=impar+1;
            if (impar >= 3) then
            begin
                cumple:=true;
            end;
        end;
        interno:=interno div 10;  
    end;
    esIpar:=cumple;
end;
//____________________________________________
procedure RecorrerLista(L:lista;LV:lenguajeCosto);
var
    VC:vector_contador;
    lenMax1:integer;
    lenMax2:integer;
    costTotal:integer;
    cantPython:integer;
    proyectosImpares:integer;
    cumpleImpar:Boolean;
begin
    proyectosImpares:=0;
    cantPython:=0;
    lenMax1:=-1;
    lenMax2:=-1;
    inicializarVC(VC);
    while L <> nil do
    begin
        costTotal:=0;
        VC[L^.datos.codLenguaje]:=VC[L^.datos.codLenguaje]+1;
        if (2000<=L^.datos.anioInicia) and (L^.datos.anioInicia <=2014) then
        begin
            costTotal:=L^.datos.cantHoras*LN[L^.datos.codLenguaje];
        end;
        WriteLn('El costo total es: ', costTotal);
        if (L^.datos.codLenguaje = 3) and(( L^.datos.anioFin - L^.datos.anioInicia) < 1) then
        begin
            cantPython:=cantPython+1;
        end;
        cumpleImpar = esIpar(L^.datos.nroInterno);
        if (cumpleImpar) then
        begin
            proyectosImpares:=proyectosImpares+1;
        end;
        L:=L^.sig;
    end;
    dosMaximos(VC,lenMax1,lenMax2);
    WriteLn('La cantidad de proyectos en los que el numero interno tiene al menos 3 digitos impares es: ', proyectosImpares);
end;
//____________________________________________
var
    LC:lenguajeCosto;
    L:lista;
begin
   //cargarLC(LC);//Se dispone
    LeerInfo(L);
    RecorrerLista(L,LC);
end.