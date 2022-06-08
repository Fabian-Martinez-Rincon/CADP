{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de Informática 
de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de nacimiento. 
Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}
program ocho;
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
procedure CargarAlumnos(var v:vector_Alumnos;var alumno_mayor:alumno;alumno_segundo_mayor:alumno);
var
    i:rango;
    alum:alumno;
    DNI_pares:integer;
begin
    DNI_pares:=0;
    for i:=1 to dimF do
    begin
        LeerAlumno(alum);
        alumnos_mayores(alum,alumno_mayor,alumno_segundo_mayor);
        digPares(alum,DNI_pares);
        v[i]:=alum;
        
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
begin
    alumno1.anio_nacimiento:=-1;
    alumno2.anio_nacimiento:=-1;

    CargarAlumnos(v,alumno1,alumno2);
    imprimirVector(v);
end.
