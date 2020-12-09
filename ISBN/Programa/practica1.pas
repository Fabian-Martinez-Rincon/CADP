program ParcialISB;
const
    dPri=1;
    dFin=5;
type 
    dias=dPri..dFin;
    prestamo = record
        nroP:integer;
        ISBN:INTEGER;
        nroS:integer;
        diaP:dias;
    end;
    vector=array [dias] of integer;
    estructura = record
        ISBN:integer;
        cantidad:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos:estructura;
        sig:lista;
    end;
//__________________________________________
procedure inicializarCD(var CD:vector);
var 
    i:dias;
begin
    for i:=dPri to dFin do
    begin
        CD[i]:=0;
    end;
end;
//__________________________________________
procedure LeerP(var P:prestamo);
begin
    writeln('ISBN: ');ReadLn(P.ISBN);
    if P.ISBN <> -1 then
    begin
        writeln('nro Prestamo: ');ReadLn(P.nroP);
        writeln('nro Socio: ');ReadLn(P.nroS);
        writeln('dia: ');ReadLn(P.diaP);  
    end;  
    
end;
//__________________________________________
procedure agregarAtras (var L:lista;E:estructura);
var
    act,nue:lista;
begin
    new(nue);
    nue^.datos:=E;
    nue^.sig:=nil;
    if L=nil then
    begin
        L:=nue;
    end
    else
        begin
            act:=L;
            while act^.sig <> nil do
            begin
                act:=act^.sig;
            end;
            act^.sig:=nue;
        end;

end;
//__________________________________________

procedure leerYProcesar(var L:lista;var CD:vector; var cumplen,cantP:integer);
var
    P:prestamo;
    E:estructura;
begin
    LeerP(P);
    while P.ISBN <> -1 do
    begin
        E.ISBN:=P.ISBN;
        E.cantidad:=0;
        while (E.ISBN = P.ISBN) do
        begin
            E.cantidad:=E.cantidad+1;
            cantP:=cantP+1;
            CD[P.diaP]:=CD[P.diaP]+1;
            if (P.nroP mod 2 = 1) and (P.nroS mod 2 = 0 ) then
            begin
                cumplen:=cumplen+1;
            end;
            agregarAtras(L,E);
            LeerP(P);
              
        end;
        WriteLn('nro: ',E.ISBN,' Se repitio: ',E.cantidad);
    end;
end;
//__________________________________________
procedure menosPrestamos(CD:vector;var diaMin:dias);
var
    i:dias;
    menor:integer;
begin
    menor:=9999;
    for i:=dPri to dFin do
    begin
        if CD[i]<menor then
        begin
            menor :=CD[i];
            diaMin:=i;
        end;
    end;
  
end;
//__________________________________________
var
    CD:vector;
    diaMin:dias;
    cumplen,cantP:integer;
    L:lista;
    porcentaje:real;
begin   
    porcentaje:=0;
    inicializarCD(CD);
    L:=nil;
    cantP:=0;
    cumplen:=0;
    leerYProcesar(L,CD,cumplen,cantP);
    menosPrestamos(CD,diaMin);
    WriteLn('El dia en el que se realizaron menos prestamos es: ', diaMin);
    porcentaje :=(cumplen / cantP) *100;
    WriteLn('el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par es: ', porcentaje);
end.