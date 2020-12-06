{8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7:
varios). Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en
las cuales el número de cuenta destino posea menos dígitos pares que impares.

}
program JugamosConListas;
type
    cadena15=string[15];
    cadena40=string[40];
    rangoAnio=1900..2021;
    F=record
        dia:1..31;
        mes:1..11;
    end;
    transeferencia =record   
        numOrigen:integer;
        dniOrigen:integer;
        numDestino:integer;
        dniDestino:integer;
        fecha:F;
        hora:integer;
        monto:real;
        codMotivo:1..7;
    end;
    Lista=^nodo;
    Nodo= record
        Datos:transeferencia;
        sig:Lista;
    end; 
    vector_contador = array [1..7] of integer;
//___________________________________________________
procedure ordenarTerceros(var terceros:lista;T:transeferencia);
var
    ant,nue,act:Lista;
begin
    new(nue);
    nue^.Datos:=T;
    act:=terceros;
    ant:=terceros;
    while (act <> nil) and (act^.Datos.numOrigen < T.numOrigen) do
    begin
        ant:=act;
        act:=act^.sig;  
    end;
    if (ant = act)then
    begin
        L:=nue;
    end
    else
    begin
        ant^.sig:=nue;  
    end;
    nue^.sig:=act;
end;
//___________________________________________________
procedure InformarMasAlto(VC:vector_contador;var alto:integer);
var
    i:integer;
begin
    for i:=1 to 7 do
    begin
        if VC[i]>alto then
        begin
            alto:=VC[i];
        end;
    end;
end;
//___________________________________________________
function LeerDigitos(numero:integer): Boolean;
var
    dig:integer;
    par:integer;
    impar:integer;
begin
    par:=0;
    impar:=0;
    while numero <> 0  do
    begin
        dig:=numero mod 10;
        if ((dig mod 2)= 0) then
        begin
            par:=par+1;
        end
        else
            begin
                impar:=impar+1;
            end;
    end;
    if par>impar then
    begin
        LeerDigitos:=true;  
    end;
end;
//___________________________________________________
procedure RecorrerLista(L:Lista);
var
    terceros:Lista;
    MontoTransT:Real;
    VC:vector_contador;
    tipo:integer;
    alto:integer;
    cumple:Boolean;
    cantC:integer;
begin
    cantC:=0;
    alto:=-1;
    terceros:=nil;
    while L <> nil do
    begin
        MontoTransT:=0;
        if (L^.Datos.dniOrigen<>L^.Datos.dniDestino) then
        begin
            ordenarTerceros(terceros,L^.Datos);
            MontoTransT:=MontoTransT+L^.Datos.monto;
        end;
        tipo:=L^.Datos.codMotivo;
        VC[tipo]:=VC[tipo]+1;
        if (L^.Datos.fecha.mes = 7) then
        begin
            cumple:=LeerDigitos(L^.Datos.numOrigen);
            if (cumple) then
            begin
                cantC:=cantC+1;
            end;
        end;
        L:=L^.sig;  
    end;
    InformarMasAlto(VC,alto);
end;
//___________________________________________________
var
    L:lista;
    
begin
    L := nil;
    //CargarLista(L); // Se dispone
    RecorrerLista(L);
    
end.
