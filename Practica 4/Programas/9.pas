{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}

 program Vectores;
 const
 dimF=400;
 
 type
    str20=string[20];
    
    alumno = record
    DNI:integer;
    apellido:str20;
    nombre:str20;
    anio_nacimiento:integer;
    end;
    vector =  Array [1..dimF] of alumno;

//_________________________________________________________________________________
procedure alumnos_mayores(alumnoF:alumno;alumno_mayorF:alumno;alumno_segundo_mayorF:alumno);
begin
    if(alumnoF.anio_nacimiento<alumno_mayorF.anio_nacimiento) then
				begin
					alumno_segundo_mayorF:=alumno_mayorF;
					alumno_mayorF:=alumnoF;
				end
			else
				begin
					if(alumnoF.anio_nacimiento<alumno_segundo_mayorF.anio_nacimiento) then
						begin
							alumno_segundo_mayorF:=alumnoF;
						end
				end;
end;
//_________________________________________________________________________________
procedure digPares(alumno1:alumno;var DNI_pares:integer);
var
 dig: integer;
 impar:integer;
begin
    impar:=0;
    while (alumno1.DNI <> 0) do begin
    dig:= alumno1.DNI mod 10;
    if((dig mod 2)= 0) then
    
    else
        impar:= impar +1;
        alumno1.DNI := alumno1.DNI DIV 10;
    end;
    if (impar>=1)then
        begin
        DNI_pares:=0;
        end
        else 
        DNI_pares := DNI_pares + 1
end;

//_________________________________________________________________________________
procedure leer_datos (var alumnoF:alumno);
    begin
        with alumnoF do
        begin
            WriteLn('Ingrese DNI');
            ReadLn(DNI);
            if (DNI<>-1) then
            begin
                WriteLn('Ingrese apellido');
                ReadLn(apellido);
                WriteLn('Ingrese nombre');
                ReadLn(nombre);
                WriteLn('Ingrese anio de nacimiento');
                ReadLn(anio_nacimiento);
            end;
        end;
    end;

//_________________________________________________________________________________________
procedure leer_alumnos(var arreglo_alumnos:vector;var dimL:integer;alumnoF:alumno;var DNI_pares:integer;alumno_mayor,alumno_segundo_mayor:alumno);
var
    i:integer;
begin
    i:=1;
    leer_datos(alumnoF);
    while ((i < dimF) and  (alumnoF.DNI<>-1)) do
    begin
        digPares(alumnoF,DNI_pares);
        alumnos_mayores(alumnoF,alumno_mayor,alumno_segundo_mayor);
        arreglo_alumnos[i]:=alumnoF;
        leer_datos(alumnoF);
    end;
    dimL:=i;
end;
//_________________________________________________________________________________


var
    arreglo_alumnos:vector;
    dimL:integer;
    alumno1:alumno;
    alumno_mayor:alumno;
    alumno_segundo_mayor:alumno;
    DNI_pares:integer;
    promedio:real;
begin
    
    dimL:=1;
    DNI_pares:=0;
    alumno_mayor.anio_nacimiento:=-1;
    alumno_segundo_mayor.anio_nacimiento:=-1;
    leer_alumnos(arreglo_alumnos,dimL,alumno1,DNI_pares,alumno_mayor,alumno_segundo_mayor);
    
    promedio:=DNI_pares/dimL;
    writeln('EL promedio de los alumnos con los digitos del dni completamente pares son : ', promedio);
    WriteLn('B) Dos alumnos con mayor edad: ');
    
end.