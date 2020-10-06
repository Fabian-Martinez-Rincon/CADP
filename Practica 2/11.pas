
{11. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se lee: nro de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con nro de inscripción 1200, que debe procesarse. Se pide calcular e informar:
o Apellido de los dos alumnos con nro de inscripción más chico.
o Nombre de los dos alumnos con nro de inscripción más grande.
o Porcentaje de alumnos con nro de inscripción par.
 }

program EjerciciosAdd;

procedure Inscripcion_Par( numerosF:LongInt;var Numeros_Paresf:integer);
begin
    if((numerosF mod 2 )=0) then
        begin
            Numeros_Paresf:=Numeros_Paresf+1;
        end;
end;

//_________________________________________________________________________________________
procedure Inscripcion_Chico(numero_inscripcion2:integer;var Numero_Mas_Bajo2:integer;var Numero_Segundo_MasBajo2:integer;nombre2:string;var Nombre_Mas_Bajo2:string;var Nombre_SegundoMas_Bajo2:string);
begin
  if (numero_inscripcion2<Numero_Mas_Bajo2)then
				begin
					Numero_Segundo_MasBajo2:=Numero_Mas_Bajo2;   
					Numero_Mas_Bajo2:=numero_inscripcion2;
                    Nombre_SegundoMas_Bajo2:=Nombre_Mas_Bajo2;
                    Nombre_Mas_Bajo2:=nombre2;

				end
			else
				begin 
					if(numero_inscripcion2<Numero_Segundo_MasBajo2) then
						begin
							Numero_Segundo_MasBajo2:=numero_inscripcion2;
							Nombre_SegundoMas_Bajo2:=nombre2;
						end
				end;
end;
//_________________________________________________________________________________________
procedure Inscripcion_MasGrande(numero_inscripcion2:integer;var Numero_Mas_Bajo2:integer;var Numero_Segundo_MasBajo2:integer;nombre2:string;var Nombre_Mas_Bajo2:string;var Nombre_SegundoMas_Bajo2:string);
begin
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
				end;
end;
//_________________________________________________________________________________________
var 
    numero_inscripcion:LongInt;
    Numeros_Pares:integer;
    //apellido:String;
    nombre:String;
    Cantidad_Alumnos:integer;
    porcentaje:Real;
    Numero_Mas_Bajo:integer;
    Numero_Segundo_MasBajo:integer;
    Nombre_Mas_Bajo:string;
    Nombre_SegundoMas_Bajo:string;
    Numero_Mas_Alto:integer;
    Numero_Segundo_MasAlto:integer;
    Nombre_Mas_Alto:string;
    Nombre_SegundoMas_Alto:string;
begin   
    Cantidad_Alumnos:=0;
    Numeros_Pares:=0;
    porcentaje:=0;
    Numero_Mas_Bajo:=9999;
    Numero_Segundo_MasBajo:=9999;
    Numero_Mas_Alto:=-1;
    Numero_Segundo_MasAlto:=-1;

    repeat
    begin
        Cantidad_Alumnos:=Cantidad_Alumnos+1;
        readln(numero_inscripcion);
        readln(nombre);
        //readln(apellido);
        Inscripcion_Chico(numero_inscripcion,Numero_Mas_Bajo,Numero_Segundo_MasBajo,nombre,Nombre_Mas_Bajo,Nombre_SegundoMas_Bajo);

        Inscripcion_MasGrande(numero_inscripcion,Numero_Mas_Alto,Numero_Segundo_MasAlto,nombre,Nombre_Mas_Alto,Nombre_SegundoMas_Alto);

        Inscripcion_Par(numero_inscripcion,Numeros_Pares);
    end;
    until (numero_inscripcion = 1200);
    porcentaje:=(Numeros_Pares / Cantidad_Alumnos)*100;
    writeln('La cantidad de alumnos es: ', Cantidad_Alumnos);
    writeln('La cantidad de alumnos pares es: ', Numeros_Pares);
    writeln('El porcentaje de los alumnos pares es: ', porcentaje:2:2);
    writeln('El nombre con nro de inscripccion mas bajo es: ', Nombre_Mas_Bajo);
    writeln('El segundo nombre con nro de inscripccion mas bajo es: ', Nombre_SegundoMas_Bajo);
    writeln('Nombre del alumno con nro de inscripcion mas alto es: ', Nombre_Mas_Alto);
    writeln('El segundo nombre con nro de inscripccion mas alto es: ', Nombre_SegundoMas_Alto);
    
end.
//______________________________________________________________________________________________