{7. Realizar un programa que resuelva los siguientes incisos:
a) Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando
se lee el nombre ‘ZZZ’, que no debe procesarse.
b) Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c) Lea un nombre y lo inserte en la posición 4 del vector.
d) Lea un nombre y lo agreguvar e al vector.
No:vectordaciones necesariarvar
    contador:integer;
}

 program Vectores;
 const
 dimF=50;
 
 type
 str20=string[20];
  vector =  Array [1..dimF] of str20;
 

//_________________________________________________________________________________________
procedure leer_alumno(var arreglo_alumnos:vector;dimL:integer);
var
    contador:integer;
    nombre:str20;
begin
    contador:=0;
    ReadLn(nombre);
    while ((contador<dimF) and (arreglo_alumnos[contador]<>'ZZZ')) do
    begin
        contador:=contador+1;
        ReadLn(nombre);
        arreglo_alumnos[contador]:=nombre;
      
    end;
    dimL:=contador;
end;
//_________________________________________________________________________________________
procedure Sustituir_primero(var arreglo_alumnos:vector);
var 
    sustituto:str20;
begin
    ReadLn(sustituto);
    arreglo_alumnos[1]:=sustituto;
end;
//_________________________________________________________________________________________
procedure Sustituir_cuarto(var arreglo_alumnos:vector);
var 
    sustituto:str20;
begin
    ReadLn(sustituto);
    arreglo_alumnos[4]:=sustituto;
end;
//_________________________________________________________________________________________
procedure agregar(var arreglo_alumnos:vector;var dimL:integer);
var 
    nombre:str20;
begin
    readln(nombre);
    dimL:=dimL+1;
    arreglo_alumnos[dimL]:=nombre;
end;
//_________________________________________________________________________________________

var
    arreglo_alumnos:vector;
    dimL:integer;
begin
    dimL:=0;
    WriteLn('A)___________');
    leer_alumno(arreglo_alumnos,dimL);
    WriteLn('B)___________');
    Sustituir_primero(arreglo_alumnos);
    WriteLn('C)___________');
    Sustituir_cuarto(arreglo_alumnos);
    WriteLn('D)___________');
    agregar(arreglo_alumnos,dimL);
    
    
end.