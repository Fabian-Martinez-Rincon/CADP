{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre 1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.
}
//INCOMPLETO
program Ejercico11;
type
    marzo=1..30;
    trans=1..5;
    str20=string[20];    
    alumno=record
        codigo:integer;
        dia_mes:marzo;
        Facultad:str20;
        transporte:integer;
    end;
    Lista=^nodo;
    nodo=record
        Datos:alumno;
        sig:Lista; 
    end;
    vector=array [1..1300] of alumno; 
    vector_contador= array [1..5] of integer;
//____________________________________________________
procedure LeerAlumno (var alumnoF:alumno;var cant_viajes:integer;var gasto_total:integer);
var
    i:integer;
begin
    
    i:=1;
    
        WriteLn('Codigo (1..1300): ');  ReadLn(alumnoF.codigo);
        if alumnoF.codigo <> -1 then
        begin
            WriteLn('Dia de marzo (1..30) : ');  ReadLn(alumnoF.dia_mes);
            WriteLn('Facultad  (string): ');  ReadLn(alumnoF.Facultad);
            WriteLn('Cantidad de viajes: '); ReadLn(cant_viajes);
            while i < cant_viajes do
            begin
                WriteLn('Transporte  (1..5): ');  ReadLn(alumnoF.transporte);
                case alumnoF.transporte of
                    1:  begin
                            gasto_total:=gasto_total+1;
                        end;
                    2:  begin
                            gasto_total:=gasto_total+2;
                        end;
                    3:  begin
                            gasto_total:=gasto_total+3;
                        end;
                    4:  begin
                            gasto_total:=gasto_total+4;
                        end;
                    5:  begin
                            gasto_total:=gasto_total+5;
                        end;
                end;
                i:=i+1;  
            end;
            
        end;
        
    end;

//____________________________________________________
procedure armarLista(var Lf:Lista;Al:alumno);
var
    aux : Lista;
begin
    new(aux);
    aux^.Datos := Al;
    aux^.sig := Lf;
    Lf := aux;
end;
//____________________________________________________
procedure CargarLista (var L:Lista);
var
    alumF:alumno;
    gasto_total:integer;
    cant_viajes:integer;
    viajes_dia:integer;
    cant_gastan:integer;
begin

    gasto_total:=0;
    cant_viajes:=0;
    LeerAlumno(alumF,gasto_total,cant_viajes);
    while (alumF.codigo <> -1) do
    begin
        armarLista(L,alumF);
        LeerAlumno(alumF,gasto_total,cant_viajes);  
        if (cant_viajes>6)then
        begin
            viajes_dia:=viajes_dia+1;
        end;
        if (gasto_total>80)then
        begin
            cant_gastan:=cant_gastan+1;
        end;
    end;
end;

//____________________________________________________
procedure RecorrerLista (L:Lista);
begin
    while L <> nil do
    begin
        L:=L^.sig;
    end;
end;
//____________________________________________________
var
    L:Lista;
begin
    L:=nil;
    CargarLista(L); 
    RecorrerLista(L);
end.
