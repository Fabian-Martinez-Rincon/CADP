{La plataforma YouTube está analizando algunos de sus principales canales de video. Para ello, YouTube cuenta con una tabla con el nombre de las 60 categorías que utilizan para clasificar los videos (Música, Educación y Ciencia, Hogar, Deportes, etc.).
De cada video se conoce su título, nombre del canal donde fue publicado, duración en segundos, año de publicación, cantidad de visualizaciones y código de categoría a la que pertenece el video (1..60).
Realizar un programa que:
A. Invoque a un módulo que lea la información de los videos hasta ingresar un video de duración -1 ( que no debe procesarse) y devuelva en una estructura de datos adecuada, para el canal “Paulina Cocina”, la siguiente información:
- Nombre del canal
- Año de publicación del video más reciente
- Cantidad de videos publicados
- Cantidad total de visualizaciones entre todos los videos.
- Detalle con Título, nombre de la categoría y duración de todos los videos con más de 1.000 visualizaciones
B. Invoque a un módulo que reciba la estructura generada en A) e imprima Nombre del canal y el título de cada video con más de 1000 visualizaciones.}

program YouTube;
type
    cadena20=string[20];
    categorias= array [1..60] of cadena20;
    video= record
        titulo:cadena20;
        nombre:cadena20;
        duracion:integer;
        anioPublicacion:1..2021;
        cantViews:integer;
        codCat:1..60;
    end;
    lista=^nodo;
    nodo=record
        datos:video;
        sig:lista;
    end;
    //____________________________A
    mil=record
        Titulo:cadena20;
        nombreCat:cadena20;
        duracion:integer;
    end;
    listaN=^nodo2;
    nodo2 = record
        datos2:mil;
        sig2:listaN;
    end;
    Paula=record
        nombre:cadena20;
        anioPubliclacion:1..2021;
        cantVideos:integer;
        cantViews:integer;
        ListaViews:listaN;
    end;
    
//______________________________________
procedure LeerVideo(var V:video);
begin
    writeln('Titulo: ');        ReadLn(V.titulo);
    writeln('Nombre: ');        ReadLn(V.nombre);
    writeln('Duracion: ');      ReadLn(V.duracion);
    if (V.duracion <> -1) then
    begin
        writeln('Anio publicado: ');ReadLn(V.anioPublicacion);
        writeln('Cantidad Views: ');ReadLn(V.cantViews);
        writeln('Categoria (1..60): ');     ReadLn(V.codCat);  
    end;
    
end;
//______________________________________
procedure AgregarAdelante(var LP:listaN;titulo:cadena20;categoria:cadena20;duracion: integer);
var
    nue:listaN;
begin
    new(nue);
    nue^.datos2.Titulo:=titulo;
    nue^.datos2.nombreCat:=categoria;
    nue^.datos2.duracion:=duracion;
    nue^.sig2:=LP;
    LP:=nue;
end;
//______________________________________
procedure LeerPaula(V:video;var P:Paula);
var
    VC:categorias;
begin
    P.nombre:=V.nombre;
    P.anioPubliclacion:=V.anioPublicacion;
    P.cantVideos:=P.cantVideos+1;
    P.cantViews:=P.cantViews+V.cantViews;
    if V.duracion > 1000 then
    begin
        AgregarAdelante((P.ListaViews),V.titulo,VC[V.codCat],V.duracion);
    end;
end;
//______________________________________
procedure ImprimirPaula(P:Paula);//B
begin
    WriteLn('Nombre del canal: ',P.nombre);
    while (P.ListaViews) <> Nil do
    begin
        WriteLn('Titulo: ',(P.ListaViews)^.datos2.Titulo);
        (P.ListaViews):=(P.ListaViews)^.sig2;
    end;
end;
//______________________________________
procedure procesarInfo(var L:lista);
var
    V:video;
    P:Paula;
begin
    P.ListaViews:=nil;
    LeerVideo(V);
    while V.duracion <> -1 do
    begin
        if (V.nombre = 'Paulina Cocina') then
        begin
            LeerPaula(V,P);
        end;
        LeerVideo(V); 
    end;
    ImprimirPaula(P);//B
end;
//______________________________________
var
    L:lista;
begin
    L:=nil;
    procesarInfo(L);
end.