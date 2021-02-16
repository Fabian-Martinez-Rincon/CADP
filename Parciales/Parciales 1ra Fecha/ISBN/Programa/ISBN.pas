program ISBN;
const 
    dIni=1;
    dFin=31;
type
    subrDia=dIni..dFin;
    rPrestamo = record
        nro_p:integer;
        ISBN:integer;
        nro_s:integer;
        dia:subrDia;
    end;
    rinfo = record
        ISBN:integer;
        cantidad:integer;
    end;
    lInfo=^nodoInfo;
    nodoInfo=record
        dato:rinfo;
        sig:lInfo;
    end;
    vCantidadDia = array [subrDia] of integer;
//________________________________________________________________
procedure inicializarCantidades(var v:vCantidadDia);
var
    i:subrDia;
begin
    for i:=dIni to dFin do
        v[i]:=0;
end;
//________________________________________________________________
procedure LeerPrestamo (var p:rPrestamo);
begin
    write('ISBN: ');ReadLn(p.ISBN);
    if (P.ISBN <> -1) then
    begin
        write('nro P: ');ReadLn(p.nro_p);
        write('nro S: ');ReadLn(p.nro_s);
        write('dia: ');ReadLn(p.dia);
    end;
end;
//________________________________________________________________
procedure verificarMin(var cant_min:integer;var dia_min:subrDia;cant:integer;dia:subrDia);
begin
    if (cant < cant_min) then
    begin
        cant_min:=cant;
        dia_min:=dia;
    end;
end;    
//________________________________________________________________
procedure calcularMin (v:vCantidadDia;var dia_min:subrDia);
var
    cant_min:integer;
    i:subrDia;
begin
    cant_min:=9999;
    for i:=dIni to dFin do
    begin
        verificarMin (cant_min,dia_min,v[i],i);
    end;
  
end;
//________________________________________________________________
function porcentaje (cant,tot:integer):real;
begin
    porcentaje :=cant*100/tot;
end;
//________________________________________________________________
procedure agregarAtras(var l:lInfo;info:rinfo);
var 
    act,nue:lInfo;
begin
    new(nue);
    nue^.dato:=info;
    nue^.sig:=Nil;
    if (l = Nil) then
    begin
      l:=nue;
    end
    else
        begin
            act:=l;
            while (act^.sig <> Nil) do
            begin
                act:=act^.sig;
            end;
            act^.sig:=nue;
        end;

end;
//________________________________________________________________
procedure leer_y_procesar(var l:lInfo; var v:vCantidadDia;var cant,total:integer);
var
    p:rPrestamo;
    info:rinfo;
begin
    LeerPrestamo(P);
    while (p.ISBN <> -1) do
    begin
        info.ISBN:=p.ISBN;
        info.cantidad:=0;
        while (p.ISBN = info.ISBN) do
        begin
            info.cantidad:=info.cantidad+1;
            v[p.dia]:=v[p.dia]+1;
            if (p.nro_p mod 2 = 1) and (p.nro_s mod 2 = 0) then
                cant:=cant+1;
            total:=total+1;
            LeerPrestamo(p);
            agregarAtras(l,info);
        end;
        WriteLn('nro: ',info.ISBN,' Se repitio: ',info.cantidad);
    end;
end;
//________________________________________________________________
var
    lista_info:lInfo;
    vector_cant:vCantidadDia;
    dia_min:subrDia;
    cant_cumplen,total_prestamos:integer;
begin
    lista_info:=Nil;
    inicializarCantidades(vector_cant);
    cant_cumplen:=0;
    total_prestamos:=0;
    leer_y_procesar(lista_info,vector_cant,cant_cumplen,total_prestamos);
    calcularMin(vector_cant,dia_min);
    WriteLn('El dia en el que se realizaron menos prestamos es: ', dia_min);
    WriteLn('El porcentaje de prestamos que poseen nro. de prestamo par y nro de socio par es: ', porcentaje (cant_cumplen,total_prestamos));
    
end.
