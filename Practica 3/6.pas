{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de los
microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.), cantidad de
cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en nanómetros (nm) de los
transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de forma consecutiva por marca de
procesador y la lectura finaliza al ingresar un procesador con 0 cores(que no debe procesarse). Se pide implementar un
programa que lea información de los microprocesadores de la empresa importadora e informe:
o Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
o Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
o Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al
menos 2 Ghz.

}
program tres;
type
    str20=string[20];
    procesador=record
    marca:str20;
    linea:str20;
    cant_cores:integer;
    velocidad_reloj:integer;
    tamanio_transistores:integer;
end;
    
//____________________________________________________________________________________
procedure leer_procesador(var procesadorF:procesador);
begin
    writeln('Ingrese marca (Intel, AMD, NVidia, etc): ');
    readln(procesadorF.marca);
    writeln('Ingrese linea (Xeon, Core i7, Opteron, Atom, Centrino, etc.): ');
    readln(procesadorF.linea);
    writeln('Ingrese cantidad de nucleos (1, 2, 4, 8): ');
    readln(procesadorF.cant_cores);
    writeln('Ingrese velocidad del reloj (medida en Ghz): ');
    readln(procesadorF.velocidad_reloj);
    writeln('Ingrese tamanio en nanometros (nm) de los transistores (14, 22, 32, 45, etc.) ');
    readln(procesadorF.tamanio_transistores);
    
end;
//____________________________________________________________________________________
procedure Informar_mayor_core(microprocesadorF:procesador);
var
    Dos_cores:integer;
begin
    Dos_cores:=2;
    if (microprocesadorF.cant_cores>Dos_cores) and (microprocesadorF.tamanio_transistores<22) then
    begin
        WriteLn(microprocesadorF.marca);
        WriteLn(microprocesadorF.linea);
    end;
end;
//____________________________________________________________________________________
var
    microprocesador:procesador;
    marca_mayor_procesador1:str20;
    marca_mayor_procesador2:str20;
begin
    marca_mayor_procesador1:='';
    marca_mayor_procesador2:='';
    leer_procesador(microprocesador);
    while microprocesador.cant_cores <> 0  do
    begin
        leer_procesador(microprocesador);
        Informar_mayor_core(microprocesador);
    end;
    
end.

