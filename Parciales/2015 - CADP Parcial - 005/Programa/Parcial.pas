program CADPParcial;
type
    cadena=string[40];
    docente=record
        dni:integer;
        apellido:cadena;
        nombre:cadena;
        codFacu:1..17;
        codCate:1..5;
        area:cadena;
        aniosInvestic:integer;
    end;
    lista=^nodo;
    nodo=record
        dato:docente;
        sig:lista;
    end;
    categoria = array [1..5] of integer;
    vector_facu=array [1..17] of integer;
//_________________________________________________________
procedure CargarCategoria(var C:categoria);
var
    i:integer;
begin
    for i:=1 to 5 do
    begin
        c[i]:=i*10;
    end;
end;
//_________________________________________________________
procedure LeerDocente(var d:docente);
begin
    ReadLn(d.dni);
    ReadLn(d.apellido);
    ReadLn(d.nombre);
    ReadLn(d.codFacu);
    ReadLn(d.codCate);
    ReadLn(d.area);
    ReadLn(d.aniosInvestic);
end;
//_________________________________________________________
procedure agregarAdelante(var L:lista;d:docente);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=d;
    nue^.sig:=L;
    L:=nue;
end;
//_________________________________________________________
procedure CargarLista(var L:lista);
var
    d:docente;
begin
    LeerDocente(d);
    while (d.dni <> 0) do
    begin
        agregarAdelante(L,d);
        LeerDocente(d);
    end;
end;
//_________________________________________________________
procedure informarDocente(L:lista;C:categoria);
var
    punTotal:integer;
begin
    punTotal:=L^.dato.aniosInvestic*c[L^.dato.codCate];
    WriteLn(L^.dato.dni);
    WriteLn(L^.dato.apellido);
    WriteLn(L^.dato.nombre);
    WriteLn(punTotal);
end;
//_________________________________________________________
procedure inicializarVF(var VF:vector_facu);
var 
    i:integer;
begin
    for i:=1 to 17 do 
    begin
        VF[i]:=0;  
    end;
end;
//_________________________________________________________
procedure codigoMaximo(VF:vector_facu;var codMax:integer);
var
    i:integer;
    mayor:integer;
begin
    mayor:=-1;
    for i:=1 to 17 do
    begin
        if VF[i]> mayor then
        begin
            mayor:=VF[i];
            codMax:=i;
        end;
    end;
end;
//_________________________________________________________
function cumpleAmbas (dni:integer):Boolean;
var 
    par:integer;
    impar:integer;
    dig:integer;
begin
    par:=0;
    impar:=0;
    while dni <> 0 do
    begin
        dig:= dni mod 10;
        if ((dig mod 2) = 0) then
        begin
            par:=par+1;
        end
        else
            begin
                impar:=impar+1;
            end;
        dni:= dni div 10;
    end;
    if (par = impar) then
    begin
        cumpleAmbas:=true;
    end
    else
        begin
            cumpleAmbas:=false;  
        end;
end;
//_________________________________________________________
procedure Informardocentes2(L:lista);
var
    parEimpar:Boolean;
begin
    parEimpar:=cumpleAmbas(L^.dato.dni);
    if (parEimpar) then
    begin
        WriteLn(L^.dato.dni);
        WriteLn(L^.dato.apellido);
        WriteLn(L^.dato.nombre);  
    end;
end;
//_________________________________________________________
procedure RecorrerLista(L:lista;c:categoria);
var
    VF:vector_facu;
    codMax:integer;
    contArea5:integer;
begin
    contArea5:=0;
    codMax:=-1;
    inicializarVF(VF);
    while L <> nil do
    begin
        informarDocente(L,c);
        if (L^.dato.codCate = 5) and (L^.dato.area = 'Ingenieria de Software') then
        begin
            contArea5:=contArea5+1;
        end;
        if (L^.dato.codCate = 2) then
        begin
            VF[L^.dato.codFacu]:=VF[L^.dato.codFacu]+1;
        end;
        Informardocentes2(L);
        L:=L^.sig;
    end;
    codigoMaximo(VF,codMax);
end;

//_________________________________________________________
var
    c:categoria;
    L:lista;
begin
    L:=Nil;
    CargarCategoria(C);
    CargarLista(L);
    RecorrerLista(L,c);
end.