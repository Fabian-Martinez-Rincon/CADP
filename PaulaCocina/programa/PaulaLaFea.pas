program Paula;
const   
    cantCategorias=60;
type
    cadena = string[40];
    rangoCategorias = 1..cantCategorias;
    categorias= array[rangoCategorias] of string;
    videoYoutube = record
        titulo:cadena;
        canal:cadena;
        duracion:integer;
        anioPublicacion:integer;
        cantVisualizaciones:integer;
        categoria:rangoCategorias;
    end;

    VideoCanal = record
        titulo:cadena;
        categoria:cadena;
        duracion:integer;
    end;
    lista = ^nodo;
    nodo = record
        datos:VideoCanal;
        sig:lista;
    end;

    canal = record
        nombre:cadena;
        anioMasReciente:integer;
        cantvideos:integer;
        cantVisualizaciones:integer;
        videos:lista;
    end;
//___________________________________________________________
procedure inicializarCategorias(var cat:categorias);
var
    i:integer;
begin
    for i:=1 to 60 do
    begin
        cat[i]:='e';
    end;
end;
//___________________________________________________________
procedure inicializarCanal(nombreCanal:cadena; var datos:canal);
begin
    datos.nombre:=nombreCanal;
    datos.anioMasReciente:=-1;
    datos.cantvideos:=0;
    datos.cantVisualizaciones:=0;
    datos.videos:=Nil;
end;
//___________________________________________________________
procedure LeerVideo (var v:videoYoutube);
begin
    ReadLn(v.duracion);
    if (v.duracion <> -1) then
    begin
        ReadLn(v.titulo);
        ReadLn(v.canal);
        ReadLn(v.anioPublicacion);
        ReadLn(v.cantVisualizaciones);
        ReadLn(v.cantVisualizaciones);
        ReadLn(v.categoria);
    end;
end;
//___________________________________________________________
procedure armarVideoCanal(v:videoYoutube;var vc:videoYoutube;cat:categorias);
begin
    vc.titulo:=v.titulo;
    vc.categoria:=cat[v.categoria];
    vc.duracion:=v.duracion;
end;
//___________________________________________________________
procedure agregarAdelante(dato:VideoCanal;var L:lista);
var
    nue:lista;
begin
    new(nue);
    nue^.datos:=dato;
    nue^.sig:=L;
    L:=nue;
end;
//___________________________________________________________
procedure armarCanal(nombre:cadena;var datos:canal;c:categorias);
var
    v:videoYoutube;
    vc:VideoCanal;
begin
    inicializarCanal(nombre,datos);
    leerVideo(v);
    while v.duracion <> -1 do
    begin
        if (v.canal = nombre) then //Si es igual a Paula Fea
        begin
            datos.cantvideos:=datos.cantvideos+1;
            datos.cantVisualizaciones:=datos.cantVisualizaciones+v.cantVisualizaciones;
            if (v.anioPublicacion>datos.anioMasReciente) then
            begin
                datos.anioMasReciente:=v.anioPublicacion
            end;
            if (v.cantVisualizaciones > 1000) then
            begin
                armarVideoCanal(v,vc,c);
                agregarAdelante(vc,datos.videos);
            end;
        end;
        LeerVideo(v);
    end;
end;
//___________________________________________________________
var
    datos:canal;
    cat:categorias;
begin
    inicializarCategorias (cat);//Se dispone
    armarCanal('Paulina Cosina',datos,cat);
    imprimirCanal(canal);
end.