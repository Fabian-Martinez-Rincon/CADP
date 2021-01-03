{
13. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4. irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión Astronómica Internacional
cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. Realizar un programa que lea
y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la ma+sa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el porcentaje
que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.

}

 program Vectores;
 const
 dimF=53;
 type

    str20=string[20];
    galaxia = record
        nombre:str20;
        tipo:1..4;
        masa:Real;
        distancia:real;
    end;
    vector =  Array [1..dimF] of galaxia;
    vector_contador = Array [1..4] of integer;

//_________________________________________________________________________________
procedure Leer(var galaxia_indi:galaxia);
begin
    with galaxia_indi do begin
        Writeln('nombre'); ReadLn(nombre);
        WriteLn('Tipo:'); readln(tipo);
        WriteLn('Masa:'); ReadLn(masa);
        WriteLn('Distancia con respecto la tierra:'); ReadLn(distancia);
    end;
end;
//________________________________________________________________________________
procedure Leer_todo(var galaxias:vector);
var
i:integer;
begin
    i:=1;
    for i:=1 to dimF do
    begin
        Leer(galaxias[i]);

    end;
end;

//_________________________________________________________________________________
procedure Inicializar_vector(var VC:vector_contador);
var
    i:integer;
begin
    for i:=1 to 4 do
    begin
        VC[i]:=0;
    end
end;
//_________________________________________________________________________________
procedure imprimir_VectorContador(VC:vector_contador);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        WriteLn(VC[i]);
    end;

end;
//_________________________________________________________________________________
procedure DosMaximos(var max1,max2:real; masa:real;nombre:str20;var nombreMax1,nombreMax2:str20);
begin
    
end;
//_________________________________________________________________________________
var
    galaxias:vector;
    Vcontador:vector_contador;
    i:integer;
    tipo:integer;
    Masa_total:real;
    cant_galaxiasC:integer;
begin
    Masa_total:=0;
    cant_galaxiasC:=0;
    i:=0;
    Leer_todo(galaxias);
    Inicializar_vector(Vcontador);
    for i:=1 to dimF do
        begin
            //A)
            tipo:=galaxias[i].tipo;
            Vcontador[tipo]:=Vcontador[tipo]+1;
            //B)
            if ((galaxias[i].nombre='Via Lactea') or (galaxias[i].nombre='Andromeda') or (galaxias[i].nombre='Triangulo')) then
            begin
                Masa_total:=Masa_total+ galaxias[i].masa;
            end;
            //C)
            if (galaxias[i].tipo <> 4 ) and (galaxias[i].distancia < 1000)then
            begin
                cant_galaxiasC:=cant_galaxiasC+1;     
            end;
            DosMaximos(max1,max2,galaxias[i].masa,galaxias[i].nombre,nombreMax1,nombreMax2);
            //DosMinimos();
        end;

    imprimir_VectorContador(Vcontador);//A)    

end.