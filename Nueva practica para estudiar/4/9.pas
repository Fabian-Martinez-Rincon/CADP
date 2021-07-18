{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a lo 
sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}
program nueve;
const
    dimF = 3;
type
    rango = 1.. dimF;
    cadena10 = string[10];
    alumno = record
        nro_inscripcion:integer;
        dni:integer;
        apellido:cadena10;
        nombre:cadena10;
        anio_nacimiento:integer;
    end;
    vector_Alumnos = array [rango] of alumno;
//________________________________________________________
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
    while (alumno1.DNI <> 0) do
    begin
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
//________________________________________________________
procedure LeerAlumno(var alum:alumno);
begin
    write('numero inscripcion: ');ReadLn(alum.nro_inscripcion);
    write('dni: ');ReadLn(alum.dni);
    write('apellido: ');ReadLn(alum.apellido);
    write('nombre: ');ReadLn(alum.nombre);
    write('anio nacimiento: ');ReadLn(alum.anio_nacimiento);
end;
//________________________________________________________
procedure CargarAlumnos(var v:vector_Alumnos;var alumno_mayor:alumno;alumno_segundo_mayor:alumno;var dimL:rango);
var
    alum:alumno;
    DNI_pares:integer;
begin
    DNI_pares:=0;
    ReadLn(alum.dni);
    while ((dimL < dimF) and (alum.dni<>-1)) do 
    begin
        LeerAlumno(alum);
        alumnos_mayores(alum,alumno_mayor,alumno_segundo_mayor);
        digPares(alum,DNI_pares);
        v[dimL]:=alum;
        dimL:=dimL+1;
    end;
end;
//________________________________________________________
procedure imprimirVector (v:vector_Alumnos);
var
    i:rango;
begin
    for i:=1 to dimF do
    begin
        WriteLn('Alumno: ',i);
        WriteLn(v[i].nro_inscripcion);
        WriteLn(v[i].dni);
        WriteLn(v[i].apellido);
        WriteLn(v[i].nombre);
        WriteLn(v[i].anio_nacimiento);
    end;
end;
//________________________________________________________

var
    v:vector_Alumnos;
    alumno1:alumno;
    alumno2:alumno;
    dimL:integer;
begin
    alumno1.anio_nacimiento:=-1;
    alumno2.anio_nacimiento:=-1;
    dimL:=0;
    CargarAlumnos(v,alumno1,alumno2,dimL);
    imprimirVector(v);
end.
