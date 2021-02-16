{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de los todos egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor a menor).
}

program Ejercico11;
type
    str20=string[20];    
    egresado=record
        num_alumno:integer;
        apellido:str20;
        promedio:real;
    end;
    Lista=^nodo;
    nodo=record
        Datos:egresado;
        sig:Lista; 
    end;
    vector = array [1..10] of egresado;
//____________________________________________________________
procedure EgresadoDatos(var P:egresado);
begin
    with P do 
    begin
        writeln('Numero del alumno: ');  readln(num_alumno);
        if P.num_alumno <> 0 then
        begin
            writeln('Apellido: ');ReadLn(apellido);
            writeln('Promedio: ');ReadLn(promedio);  
        end;
          
    end;
end;
//____________________________________________________________
procedure ArmarPersona (var L:Lista;P:egresado);
var
    aux : lista;
begin
    new(aux);
    aux^.Datos := P;
    aux^.sig := L;
    L := aux;
end;

//____________________________________________________________
procedure LeerEgresados(var Lf:Lista);
var
    Persona:egresado;
begin
    EgresadoDatos(Persona);
    while (Persona.num_alumno <> 0) do
    begin
        ArmarPersona(Lf,Persona);
        EgresadoDatos(Persona);  
    end;
end;
//____________________________________________________________
procedure InicializoPromedio(var M:vector);
var
    i:integer;
begin
    for i:=0 to 10 do 
    begin
        M[i].promedio:=0;  
    end;
end;
//____________________________________________________________
procedure JuntarDiezMejores(L:Lista;var M:vector);
var 
    i:integer;
    esta:boolean;
begin
    esta:=False;
    i:=1;
    while (i < 10) and (esta =false) do
    begin
        if L^.Datos.promedio > M[i].promedio then
        begin
            M[i]:=L^.Datos;
            esta:=true;
        end;
        i:=i+1;
    end;
    esta:=false;
end;
//____________________________________________________________
procedure Mejores_egresados(L:lista;var M:vector);
begin
    while (L <> Nil) do
    begin
        JuntarDiezMejores(L,M); 
        L:=L^.sig;
    end;
end;
//____________________________________________________________
procedure ImprimirEgresado(E:egresado);
begin
    WriteLn('El numero es: ', E.num_alumno);
    WriteLn('El apellido es: ', E.apellido);
    WriteLn('El promedio es: ', E.promedio :2:2);
end;

//____________________________________________________________
procedure ImprimirOrdenados (M:vector);
var 
    i:integer;
    mayor:vector;
    j:integer;
    cumple:boolean;
begin
    j:=1;
    cumple:=false;
    InicializoPromedio(mayor);
    for i:=1 to 10 do
    begin
        while (j < 10) and (cumple=false) do
        begin
            if (M[i].promedio > mayor[j].promedio)  then
            begin
                mayor[i]:=M[i];
                cumple:=true;
            end;
            j:=j+1;
        end;
        ImprimirEgresado(M[i]);
    end;
    

end;
//____________________________________________________________
var
    L:Lista;
    Mejor:vector;
    i:integer;
begin
    L:=nil;
    LeerEgresados(L);
    InicializoPromedio(Mejor);
    Mejores_egresados(L,Mejor);
    ImprimirOrdenados(Mejor);
    
end.
