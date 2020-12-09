program PaulaMe;
const
    cantCate=60;
type    
    cadena=string [40];
    rangoCat = 1..cantCate;
    categorias = array [rangoCat] of cadena;
    video = record
        titulo:cadena;
        nombre:cadena;
        duracion:integer;
        anioPublic:integer;
        cantVisu:integer;
        cat:rangoCat;
    end;
    videoC = record
        titulo:cadena;
        nomCat:cadena;
        duracion:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos : videoC;
        sig:lista;
    end;
    Paula = record
        nombre:cadena;
        anioReciente:integer;
        cantVid:integer;
        viewsTotal:integer;
        detalle:lista;
    end;
//______________________________________________________
procedure iniCategorias(var vc:categorias);
var
    i:integer;
begin
    for i:=1 to cantCate do
    begin
        vc[i]:='Bolas';        
    end;
end;
//______________________________________________________
procedure LeerVideo(var v:video);
begin
    writeln('Duracion: ');            ReadLn(v.duracion);
    if (v.duracion <> -1) then
    begin
        writeln('Titulo: ');        ReadLn(v.titulo);
        writeln('Nombre: ');        ReadLn(v.nombre);
        writeln('Anio Publicado: ');ReadLn(v.anioPublic);
        writeln('Visitas: ');       ReadLn(v.cantVisu);
        writeln('nro Categoria: '); ReadLn(v.cat);
    end;
end;
//______________________________________________________
procedure inicializarPaula (var P:Paula;nombre:cadena);
begin
    P.nombre:=nombre;
    P.anioReciente:=-1;
    P.cantVid:=0;
    P.viewsTotal:=0;
    P.detalle:=nil;
end;

//______________________________________________________
procedure ArmarVideo(v:video;var vP:videoC;C:categorias);
begin
    vP.titulo:=v.titulo;
    vP.nomCat:=C[v.cat];
    vP.duracion:=v.duracion;
end;
//______________________________________________________
procedure agregarAdelante (vp:videoC;var L:lista);
var 
    nue:lista;
begin
    new(nue);
    nue^.datos:=vp;
    nue^.sig:=L;
    L:=nue;
end;
//______________________________________________________
procedure LeerInfo(nombre:cadena;var P:Paula;vc:categorias);
var 
    v:video;
    vP:videoC;
begin
    LeerVideo(v);
    inicializarPaula(P,nombre);
    while (v.duracion <> -1) do
    begin
        if (v.nombre = nombre) then
        begin
            P.nombre:= nombre;
            if (v.anioPublic>P.anioReciente) then
            begin
                P.anioReciente:=v.anioPublic;
            end;
            P.cantVid:=P.cantVid+1;
            P.viewsTotal:=P.viewsTotal+v.cantVisu;
            if (v.cantVisu > 1000) then
            begin
                ArmarVideo(v,vP,vc);
                agregarAdelante(vP,P.detalle);
            end;

        end;
        LeerVideo(v);
    end;
end;
//______________________________________________________
procedure ImprimirCanal (P:Paula);
begin
    WriteLn('Nombre del Canal: ',P.nombre);
    WriteLn('Año de publicación del video más reciente: ',P.anioReciente);
    WriteLn('Cantidad de videos publicados: ',P.cantVid);
    WriteLn('Cantidad total de visualizaciones entre todos los videos.: ',P.viewsTotal);
    WriteLn('Datos de los videos que tienen mas de 1k views: ');
    while (P.detalle) <> Nil do
    begin
        WriteLn('Titulo: ',(P.detalle)^.datos.titulo);
        WriteLn('categoria: ',(P.detalle)^.datos.nomCat);
        WriteLn('duracion: ',(P.detalle)^.datos.duracion);
        (P.detalle):=(P.detalle)^.sig;
    end;
end;
//______________________________________________________
var
    vc:categorias;
    P:Paula;
begin
    
    iniCategorias(vc);
    LeerInfo('Paula Cosina', P,vc);
    ImprimirCanal(P);
end.