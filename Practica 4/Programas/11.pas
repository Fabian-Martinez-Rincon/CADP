{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de comentarios de usuarios.
Realizar un programa que lea y almacene esta información. Una vez finalizada la lectura, el programa debe
procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}

 program Vectores;
 const
 dimF=200;
 
 type
    str20=string[20];
    publicacion = record
    titulo: str20;
    autor: str20;
    cant_megustas:integer;
    cant_clics:integer;
    cant_comentarios:integer;
    end;
    vector =  Array [1..dimF] of publicacion;

//_________________________________________________________________________________
procedure Leer_Publicacion(var fotosF:publicacion);
begin
    with fotosF do begin
      readln(titulo);
      ReadLn(autor);
      ReadLn(cant_megustas);
      ReadLn(cant_clics);
      ReadLn(cant_comentarios);
    end;
end;
//_________________________________________________________________________________
procedure Leer_todo(var todas_fotosF:vector;var fotosF2:publicacion;dimL:integer);
var
i:integer;
begin
    for i:=1 to dimF do
    begin
        Leer_Publicacion(fotosF2);
        todas_fotosF[i]:=fotosF2;
    end;
    dimL:=i;
end;
//_________________________________________________________________________________
procedure Mas_vistas(todas_fotosF:vector;mayor_clics:publicacion);
var
i:integer;
begin
    for i:=1 to dimF do
    begin
        if (todas_fotosF[i].cant_clics>mayor_clics.cant_clics) then
        begin
            mayor_clics:=todas_fotosF[i];
        end;
    end; 
end;
//_________________________________________________________________________________
procedure Total_megustas(todas_fotos:vector;var cant_megustas:integer;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        if todas_fotos[i].autor= 'Art Vandelay' then
        begin
            cant_megustas:=cant_megustas+todas_fotos[i].cant_megustas;  
        end;
    end;
end;
//_________________________________________________________________________________
procedure cant_coment_publicidad(todas_fotos:vector;dimL:integer);
//queria que cuando lea el primer se compare con todo el arreglo hasta que sea verdad 
//pero no me salio
var
    i:integer;
    j:integer;
begin
    j:=1;
    for i:=1 to dimL do
    begin
        while j<dimL do
        begin
            if ((j<>i) and (todas_fotos[i]=todas_fotos[j])) then
            begin
                todas_fotos[i].cant_comentarios:=todas_fotos[i].cant_comentarios+todas_fotos[j].cant_comentarios
            end;
                j:=j+1;
        end;  
    end;
end;
//_________________________________________________________________________________
var
    todas_fotos:vector;
    fotos:publicacion;
    mayor_clics:publicacion;
    cant_megustas:integer;
    dimL:integer;
begin
    dimL:=1;
    cant_megustas:=0;
    mayor_clics.cant_clics:=-1;
    Leer_todo(todas_fotos,fotos,dimL);

    writeln('A_____________');
    Mas_vistas(todas_fotos,mayor_clics);
    WriteLn('El titulo con mayor clics es: ', mayor_clics.cant_clics);

    writeln('B_____________');
    Total_megustas(todas_fotos,cant_megustas,dimL);
    WriteLn('La cantidad de megustas de Art Vandelay es: ',cant_megustas);

    writeln('C_____________'); 
    cant_coment_publicidad(todas_fotos,dimL);

end.