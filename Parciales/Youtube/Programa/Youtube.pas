{La plataforma YouTube está analizando algunos de sus principales canales de video. Para
ello, YouTube cuenta con una tabla con el nombre de las 60 categorías que utilizan para
clasificar los videos (Música, Educación y Ciencia, Hogar, Deportes, etc.).
De cada video se conoce su título, nombre del canal donde fue publicado, duración en
segundos, año de publicación, cantidad de visualizaciones y código de categoría a la que
pertenece el video (1..60).
Realizar un programa que:
A. Invoque a un módulo que lea la información de los videos hasta ingresar un video de
duración -1 ( que no debe procesarse) y devuelva en una estructura de datos adecuada,
para el canal “Paulina Cocina”, la siguiente información:
- Nombre del canal
- Año de publicación del video más reciente
- Cantidad de videos publicados
- Cantidad total de visualizaciones entre todos los videos.
- Detalle con Título, nombre de la categoría y duración de todos los videos con más de
1.000 visualizaciones
B. Invoque a un módulo que reciba la estructura generada en A) e imprima Nombre del
canal y el título de cada video con más de 1000 visualizaciones.}

program Concesionaria;
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
    Paula=record
        nombre:cadena20;
        anioPubliclacion:1..2021;
        cantVideos:integer;
        cantViews:integer;
        ListaViews:listaN;
    end;
    listaN=^nodo2;
    nodo2 = record
        
    end;
//______________________________________
procedure procesarInfo(var L:lista);
var
    V:video;
begin
    LeerVideo(V);
    while V.duracion <> -1 do
    begin

    end;
end;
//______________________________________
var
    L:lista;
begin
    L:=nil;
    procesarInfo(L);
end.