{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre,
apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La
maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.
}
program JugamosConListas;
type
    vector_semanas = array [1..42] of integer;
    str20=string[20];
    paciente=record
        nombre:str20;
        apellido:str20;
        PesoDiaSemana:vector_semanas;
    end;
    lista = ^nodo;
    nodo = record
        datos : paciente;
        sig : lista;
    end;
//___________________________________________________________
procedure MayorPesoSemana (C:vector_semanas;M:integer);
var
    i:integer;
begin
    for i:=1 to 42 do
    begin
        if C[i]>M then
        begin
            M:=C[i];
        end;
    end;
end;
//___________________________________________________________
procedure RecorrerLista(L:lista);
var
    mayor:integer;
    AumentoPeso:integer;
    pesoInicial:integer;
begin
    while L<>nil do
    begin
        pesoInicial:=L^.datos.PesoDiaSemana;
        mayor:=-1;
        MayorPesoSemana(L^.datos.PesoDiaSemana,mayor);
        AumentoPeso:=mayor-pesoInicial;
        writeln('Para la embarazada: ', L^.datos.nombre,'La semana con mayor aumento de peso es: ', );
    end;
end;
//___________________________________________________________
var
    L:lista;
begin
    L := nil;
    //CargarLista(L); //Se dispone
    RecorrerLista(L);
end.
