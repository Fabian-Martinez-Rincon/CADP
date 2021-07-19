{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, 
para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente información: título 
de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios. 
Realizar un programa que lea y almacene esta información. Una vez finalizada la lectura, el programa debe 
procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
program once;
const 
    dimF = 200;
type    
    cadena10 = string[10];
    rango = 1..dimF;
    foto = record
        titulo:cadena10;
        autor:cadena10;
        cant_likes:integer;
        cant_clics:integer;
        comentarios:integer;
    end;
    vector_fotos = array [rango] of foto;
    vector_contador = array [rango] of integer;
//________________________________________________
procedure leerFoto(var f:foto);
begin
    write('Titulo: '); readln(f.titulo);
    write('Autor: '); readln(f.autor);
    write('cantidad likes: '); readln(f.cant_likes);
    write('cantidad clics: '); readln(f.cant_clics);
    write('cantidad comentarios: '); readln(f.comentarios);
end;
//________________________________________________
procedure cargarFotos(var v:vector_fotos);
var
    f:foto;
    i:rango;
begin
    for i:=1 to dimF do
    begin
        leerFoto(f);
        v[i]:=f;
    end;
end;
//________________________________________________
procedure inicializarContador(var c:vector_contador);
var 
    i:rango;
begin
    for i:=1 to dimF do
    begin
        c[i]:=0;
    end; 
end;
//________________________________________________
procedure abc(v:vector_fotos;var titulomas:cadena10;var cantmas:integer;var cantArt:integer;contador:vector_contador);
var
    i:rango;
begin
    for i:=1 to dimF do
    begin
        if (v[i].cant_clics>cantmas) then
        begin
            cantmas:=v[i].cant_clics;
            titulomas:=v[i].titulo;
        end;
        if (v[i].titulo = 'Art Vandelay') then
        begin
            cantArt:=cantArt+v[i].cant_likes;
        end;
        contador[i]:=contador[i]+v[i].comentarios;
    end;
end;

//________________________________________________
var
    v:vector_fotos;
    tituloMas:cadena10;
    cantMas:integer;
    CantArtVandelay:integer;
    contador:vector_contador;
begin
    tituloMas:='';
    cantMas:=-1;
    inicializarContador(contador);
    cargarFotos(v);
    abc(v,tituloMas,cantMas,CantArtVandelay,contador);

end.