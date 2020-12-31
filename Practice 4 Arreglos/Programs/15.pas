{
15. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en los
proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que participan en un
proyecto de software, junto al valor promedio que se paga por hora de trabajo:

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000 proyectos
de software más activos durante el año 2017. De cada participante se conoce su país de residencia, código de
proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.

}

 program Vectores;
 const
 dimF=1000;
 type
    str20=string[20];
    participante = record 
       recidencia:str20;
        cod_proyecto:integer; //No pongo del 1 al 1000 porque cuando quiero leer el -1 en el while no me lo toma
        nombre_proyecto:str20;
        rol_proyecto:1..5;
        horas_trabajadas:integer;
        monto_total:real;
    end;
    vector_Participante =  Array [1..dimF] of participante;
//_________________________________________________________________________________    
procedure Leer(var datos_Part:participante);
begin
    with datos_Part do begin
        WriteLn('Residencia (string):'); readln(recidencia);
        WriteLn('codigo del proyecto (1..1000):'); ReadLn(cod_proyecto);
        if (datos_Part.cod_proyecto <> -1) then 
        begin
            WriteLn('Nombre del proyecto (string):'); ReadLn(nombre_proyecto);
            WriteLn('rol del proyeto:');
            WriteLn('1: Analisa Funcional: 35,20 V/H'); 
            WriteLn('2: Programador: 27,45V/H');
            WriteLn('3: Administrador de bases de datos: 31,03 V/H'); 
            WriteLn('4: Arquitecto de software: 44,28 V/H');
            WriteLn('5: Administrador de redes y seguridad: 39,87');
            ReadLn(rol_proyecto);
            case rol_proyecto of 
            1:  datos_Part.monto_total:=datos_Part.rol_proyecto*35.20;
            2:  datos_Part.monto_total:=datos_Part.rol_proyecto*27.45;
            3:  datos_Part.monto_total:=datos_Part.rol_proyecto*31.03;
            4:  datos_Part.monto_total:=datos_Part.rol_proyecto*44.28;
            5:  datos_Part.monto_total:=datos_Part.rol_proyecto*39.87;

            end;
            WriteLn('Horas trabajadas:'); ReadLn(horas_trabajadas);
        end;
    end;
end;
//_________________________________________________________________________________
procedure Leer_Participantes(var ParticF:vector_Participante;var dimL:integer);
var
    i:integer;
begin
    i:=1;
    while (i<dimF) and (ParticF[i].cod_proyecto <> -1) do
    begin
        WriteLn('Participante numero: ', i);
        Leer(ParticF[i]);
        i:=i+1;
    end;
    dimL:=i;
end;

//_________________________________________________________________________________




var
    ParticipanteF:vector_Participante;
    dimL:integer;
    i:integer;
    monto_total_arg:real;//A
begin
    dimL:=1;
    monto_total_arg:=0;
    Leer_Participantes(ParticipanteF,dimL);
    for i:=1 to dimL do
    begin
        if (ParticipanteF[i].recidencia = 'Argentina') then
            begin
                monto_total_arg:=monto_total_arg+ParticipanteF[i].monto_total;
            end;
        //Monto_argentina(ParticipanteF[i].recidencia,monto_total_arg);//A
        //Horas_adm_BasesDeDatos(ParticipanteF);//B
        //Menor_proyecto(ParticipanteF);//C
        //Cant_Arqui_soft(ParticipanteF);//D
    end;
    WriteLn('El monto total es: ', monto_total_arg);
end.