program Caro;
type
    depas = 1..3500;
    cadena30 = string[30];
    departamento = record
        superficie:integer;
        montoTotal:integer;
        Localidad:cadena30;
    end;
    ArrayDepart = array[depas] of departamento;
    ListaDepa = ^nodo;
    nodo = record
        datos:departamento;
        sig:ListaDepa;
    end;
//____________________________________________________________
procedure agregarAdelante(var L:ListaDepa; Depa:departamento);
var
    nue:ListaDepa;
begin
    New(nue);
    nue^.datos:=Depa;
    nue^.sig:=L;
    L:=nue;
end;
//____________________________________________________________
procedure RecorrerVec(V:ArrayDepart;var L:ListaDepa);
var
    i:depas;
    actual:cadena30;
    superficieTotal:integer;
begin
    for i:=1 to 3500 do
    begin
        superficieTotal:=0;
        actual:=V[i].Localidad;
        while (i<=3500) and (actual=V[i].Localidad) do
        begin
            superficieTotal:=superficieTotal+V[i].montoTotal;
            if (V[i].montoTotal>40000) and (V[i].montoTotal<80000) and ((V[i].Localidad = 'La Plata') or (V[i].Localidad = 'Mar del Plata') or (V[i].Localidad = 'Bahia Blanca')) then
            begin
                agregarAdelante(L,V[i]);
            end;
            i:=i+1;
        end;
        writeln(superficieTotal);
    end;
end;
//____________________________________________________________
var
    vector:ArrayDepart;
    L:ListaDepa;
begin
    L:=nil;
    //CargarArray(vector); //Se dispone
    RecorrerVec(vector,L);
end.