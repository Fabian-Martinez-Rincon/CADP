{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.

}

program Ejercico11;
type
    str20=string[20];    
    dispositivo=record
        version:integer;
        Tamanio:integer;
        memoria:integer;
    end;
    Lista=^nodo;
    nodo=record
        Datos:dispositivo;
        sig:Lista; 
    end;
//____________________________________________________
procedure ABYC(L:Lista);
var
    dispVersion:integer;
    CantMas3M5P:integer;
    cant_dispositivos:integer;
    Tamanio_total:integer;
    aux:integer;
    promedio:real;
begin
    promedio:=0;
    cant_dispositivos:=0;
    CantMas3M5P:=0;
    Tamanio_total:=0;
    aux:=0;
    while L<>nil do
    begin
        aux:=L^.Datos.version;
        dispVersion:=0;
        while (L <> nil) and (aux=L^.Datos.version) do //Me fijo si se mantiene en la misma version
        begin
            cant_dispositivos:=cant_dispositivos+1;
            dispVersion:=dispVersion+1;
            if (L^.Datos.memoria > 3) and (L^.Datos.Tamanio>=5) then //B
            begin
                CantMas3M5P:=CantMas3M5P+1;
            end;
            Tamanio_total:=Tamanio_total+L^.datos.Tamanio;//Calculo el tamaño total para despues calcular el promedio
            L:=L^.sig;
        end;
        WriteLn('La cantidad de dispositivos para esta version son: ', dispVersion);
        L:=L^.sig;
    end;
    WriteLn('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas son: ',CantMas3M5P);
    if cant_dispositivos <> 0 then
    begin
        promedio:=Tamanio_total/cant_dispositivos;
        WriteLn('El promedio es',promedio);
    end;
end;
//____________________________________________________
var
    L:Lista;
    
begin
    L:=nil;
    CargarInfo(L); //Se dispone
    ABYC(L);
    
end.
