program estudiando;
const
    dimF = 10;
type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;
    vector = array [1..10] of integer;
//_________________________________________________________
procedure AgregarLista(var L:lista;num:integer);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=num;
    nue^.sig:=L;
    L:=nue;
end;
//_________________________________________________________
procedure DosMaximos(num:integer;nombre:string;var num1,num2:integer;var nombre1,nombre2:string);
begin
    if (num>num1) then
    begin
        num2:=num1;
        nombre2:=nombre1;
        num1:=num;
        nombre1:=nombre;
    end
    else
        begin
            if (num > num2) then
            begin
                num2:=num;
                nombre2:=nombre;
            end;
        end;
end;
//_________________________________________________________
procedure AgregarLista2(var L:lista;num:integer);
var
    uno,dos:lista;
begin
    new(dos);
    dos^.dato:=num;
    dos^.sig:=Nil;
    if L <> nil then
    begin
        uno:=L;
        while uno^.sig <> nil do
        begin
            uno:=uno^.sig;
        end;
        uno:=dos;
    end
        else
            L:=nue;
end;
//_________________________________________________________
procedure AgregarVector(var v:vector;var dimL:integer;num:integer);
var
    i:integer;
begin
    if dimL<dimF then
    begin
        dimL:=dimL+1;
        v[dimL]:=num;
    end;
end;
//_________________________________________________________
procedure AgregarLista3(var ult,L:lista;num:Integer);
var
    uno:lista;
begin
    new(uno);
    uno^.dato:=num;
    uno^.sig:=nil;
    if (L <> Nil) then
    begin
        ult^.sig:=nue;
    end
        else
            L:=nue;
    ult:=nue;
end;
//_________________________________________________________
procedure InsertarVector(var v:vector;var dimL:integer;pos:integer;elemento:integer);
var
    i:integer;
begin
    if ((dimL<dimF) and (pos >= 1) and (pos<=dimL)) then
    begin
        for i:=dimL downto pos do
        begin
            v[i+1]:=v[i];
        end;
        v[pos]:=elemento;
        dimL:=dimL+1;
    end;
end;
//_________________________________________________________
procedure digitosPares (numero:integer;Espar:Boolean);
var
    par,impar,dig:integer;
begin
    par:=0;
    impar:=0;
    dig:=0;
    Espar:=true;
    while numero <> 0 do
    begin
        dig:= numero mod 10;
        if ((dig mod 2) = 0) then
        begin
            par:=par+1;
        end 
            else
                impar:=impar+1;
        numero:=numero div 10;
    end;
    if (impar>=1) then
    begin
        Espar:=False
    end;
end;
//_________________________________________________________
function EstaOrdenada(l:lista):Boolean;
var
    mayor:integer;
    cumple:Boolean;
begin
    mayor:=-1;
    cumple:=true;
    while (l <> nil) and (cumple) do
    begin
        if (l^.dato>mayor) then
        begin
            mayor:=l^.dato;
        end
            else
                cumple:=false;
        l:=l^.sig;
    end;
    EstaOrdenada:=cumple;
end;
//_________________________________________________________
procedure insertarLista(var l:lista;num:integer);
var
    uno,dos,tres:lista;
begin
    new(uno);
    uno^.dato:=num;
    dos:=l;
    tres:=l;
    while (dos <> nil) and (dos^.dato<num) do
    begin
        tres:=dos;
        dos:=dos^.sig;
    end;


    
    if (dos = tres) then
    begin
        l:=uno;
    end
        else
            tres^.sig:=uno;

    uno^.sig:=dos;
end;
//_________________________________________________________

begin

  
end.