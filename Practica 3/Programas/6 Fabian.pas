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
        WriteLn('Esta marca tiene mas de dos nucleos y al menos transistores de 22nm',microprocesadorF.marca);
        WriteLn('Esta marca tiene mas de dos nucleos y al menos transistores de 22nm',microprocesadorF.linea);
    end;
end;
//____________________________________________________________________________________
procedure mayor_cant_procesadores(procesadorF3:procesador;var marca_mayor_procesador1F:str20;var marca_mayor_procesador2F:str20);
begin{ //No se a que se refiere con mayor calidad
  if (numero_inscripcion2>Numero_Mas_Bajo2)then
				begin
					Numero_Segundo_MasBajo2:=Numero_Mas_Bajo2;   
					Numero_Mas_Bajo2:=numero_inscripcion2;
                    Nombre_SegundoMas_Bajo2:=Nombre_Mas_Bajo2;
                    Nombre_Mas_Bajo2:=nombre2;

				end
			else
				begin 
					if(numero_inscripcion2>Numero_Segundo_MasBajo2) then
						begin
							Numero_Segundo_MasBajo2:=numero_inscripcion2;
							Nombre_SegundoMas_Bajo2:=nombre2;
						end
				end;}
end;
//____________________________________________________________________________________
procedure procesadores_multicore (procesadorF4:procesador;var contador_multi:integer);
begin
    if (procesadorF4.cant_cores>1) and (procesadorF4.velocidad_reloj>=2) and ((procesadorF4.marca='Intel') or (procesadorF4.marca='AMD')) then
    begin
        contador_multi:=contador_multi+1;
    end;
end;
//____________________________________________________________________________________
var
    microprocesador:procesador;
    marca_mayor_procesador1:str20;
    marca_mayor_procesador2:str20;
    contador_multicore:integer;
begin
    contador_multicore:=0;
    marca_mayor_procesador1:='';
    marca_mayor_procesador2:='';
    leer_procesador(microprocesador);

    while microprocesador.cant_cores <> 0  do
    begin
        leer_procesador(microprocesador);
        Informar_mayor_core(microprocesador);
        mayor_cant_procesadores(microprocesador,marca_mayor_procesador1,marca_mayor_procesador2);
        procesadores_multicore(microprocesador,contador_multicore);
    end;
    
end.

