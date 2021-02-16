{● La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con todos los
alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida. Escribir un
programa que procese la información de alumnos disponible y los distribuya en turnos utilizando los siguientes
criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.

}
//INCOMPLETO
program Ejercico11;
type
    str20=string[20];    
    alumno=record
        DNI:integer;
        apellido:str20;
        nombre:str20;
        nota:integer;
    end;
    Lista=^nodo;
    nodo=record
        Datos:alumno;
        sig:Lista; 
    end;
    Turno1=^nodo1;
    nodo1=record
        Datos1:alumno;
        sig1:Turno1; 
    end;
    Turno2=^nodo2;
    nodo2=record
        Datos2:alumno;
        sig2:Lista; 
    end;
    Turno3=^nodo;
    nodo3=record
        Datos3:alumno;
        sig3:Lista; 
    end;
    Turno4=^nodo;
    nodo4=record
        Datos4:alumno;
        sig4:Lista; 
    end;
    Turno5=^nodo;
    nodo5=record
        Datos5:alumno;
        sig5:Lista; 
    end;
    vector=array [1..1300] of alumno; 
    vector_contador= array [1..5] of integer;

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
procedure RecorrerLista (L:Lista);
begin
    while L <> nil do
    begin
        if (L^.Datos.nota >= 8) then
        begin
            
        end;
        L:=L^.sig;
    end;
end;
//____________________________________________________
var
    L:Lista;
begin
    L:=nil;
    //CargarLista(L); //Se dispone
    RecorrerLista(L);
end.
