program Raro;
const
    dimFacu = 17;
    dimCate = 5;
type
    codigoFacultad = 1..dimFacu;
    rangoCate = 1..dimCate;
    docente = record
        dni:integer;
        apellido:string;
        nombre:string;
        codFacu:codigoFacultad;
        codCate:rangoCate;
        area:string;
        cantAnios:integer;
    end;
    categorias = array [rangoCate] of integer;

    lista = ^nodo;
    nodo  = record
        datos:docente;
        sig:lista;
    end;
//______________________________________________________
procedure LeerDocente(var d:docente);
begin
    writeln('Dni: ');readln(d.dni);
    if (d.dni <> -1) then
    begin
        writeln('Apellido: ');readln(d.apellido);
        writeln('Nombre: ');readln(d.nombre);
        writeln('CodFacu: ');readln(d.codFacu);
        writeln('codCare: ');readln(d.codCate);
        writeln('Area: ');readln(d.area);
        writeln('Anios: ');ReadLn(d.cantAnios);  
    end;
    
end;
//______________________________________________________
procedure insertarPorAnios(var L:lista;d:docente);
var
    act,ant,nue:lista;
begin
    new(nue);
    nue^.datos:=d;
    act:=L;
    ant:=L;
    while (act <> nil) and (act^.datos.cantAnios < d.cantAnios) and (act^.datos.codCate < d.codCate) do
    begin
        ant:=act;
        act:=act^.sig;
    end;
    if (ant = act) then
    begin
        L:=nue;
    end
        else
            begin
                ant^.sig:=nue;
            end;
        nue^.sig:=act;
end;
//______________________________________________________
procedure LeerYAlmacenar(var L:lista);
var
    d:docente;
begin
    LeerDocente(d);
    while d.dni <> -1 do
    begin
        insertarPorAnios(L,d);
        LeerDocente(d);
    end;
end;
//______________________________________________________
procedure Imprimir2(L:lista;Tabla:categorias);
var
    puntTotal:real;
begin
    
    while L <> nil do
    begin
        writeln('DNI: ',L^.datos.dni);
        writeln('Apellido: ',L^.datos.apellido);
        writeln('Nombre: ',L^.datos.nombre);
        writeln('CodFacu: ',L^.datos.codFacu);
        puntTotal:=(L^.datos.cantAnios)*Tabla[L^.datos.codCate];
        writeln('El puntaje total es : ',puntTotal);
        L:=L^.sig;  
    end;
end;
//______________________________________________________
var
    L:lista;
    Tabla:categorias;
begin
    L:=Nil;
    CargarTabla(Tabla);//Se dispone
    LeerYAlmacenar(L);
    //Imprimir(L);
    Imprimir2(L,Tabla);
end.