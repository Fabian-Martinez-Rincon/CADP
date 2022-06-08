{13. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4. irregular), su 
masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión Astronómica Internacional 
cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. Realizar un programa que lea 
y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el porcentaje 
que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}
const
    dimF = 53;
type
    cadena10 = string[10];
    rango_tipo = 1..4;
    galaxia = record
        nombre:cadena10;
        tipo:rango_tipo;
        masa:integer;
        distancia:integer;
    end;
    vector_galaxias = array [1..dimF] of galaxia;
    vector_contador = array [rango_tipo] of integer;
//_____________________________________________________
procedure LeerGalaxia(var g:galaxia);
begin
    write('Nombre: '); ReadLn(g.nombre);
    write('Tipo: '); ReadLn(g.tipo);
    write('Masa: '); ReadLn(g.masa);
    write('Distancia: '); ReadLn(g.distancia);
end;
//_____________________________________________________
procedure cargarGalaxias(var vg:vector_galaxias);
var
    i:Integer;
begin
    for i:=1 to dimF do
    begin
        LeerGalaxia(vg[i]);
    end;
end;
//_____________________________________________________
procedure DosMayores(nombre:cadena10;Masa:Integer;mayorMasa1:integer;nombreMayor1:cadena10;var mayorMasa2:integer;var nombreMayor2:cadena10);
begin
    if (Masa > mayorMasa1) then
    begin
        mayorMasa2:=mayorMasa1;
        nombreMayor2:=nombreMayor1;
        mayorMasa1:=Masa;
        nombreMayor1:=nombre;
    end
    else
        begin
            if (Masa>mayorMasa2) then
            begin
                mayorMasa2:=Masa;
                nombreMayor2:=nombre;
            end;
        end;
end;
//_____________________________________________________
procedure DosMayores(nombre:cadena10;Masa:Integer;mayorMasa1:integer;nombreMayor1:cadena10;var mayorMasa2:integer;var nombreMayor2:cadena10);
begin
    if (Masa < mayorMasa1) then
    begin
        mayorMasa2:=mayorMasa1;
        nombreMayor2:=nombreMayor1;
        mayorMasa1:=Masa;
        nombreMayor1:=nombre;
    end
    else
        begin
            if (Masa < mayorMasa2) then
            begin
                mayorMasa2:=Masa;
                nombreMayor2:=nombre;
            end;
        end;
end;
//_____________________________________________________
procedure Informar(vg:vector_galaxias);
var
    i:integer;
    vc:vector_contador;
    masaTotal:integer;
    galaxiasNoIrregulares:integer;
    mayorMasa1:integer;
    nombreMayor1:cadena10;
    mayorMasa2:integer;
    nombreMayor2:cadena10;

    menorMasa1:integer;
    nombreMenor1:cadena10;
    menorMasa2:integer;
    nombreMenor2:cadena10;
begin
    galaxiasNoIrregulares:=0;
    vc[1]:=0;
    vc[2]:=0;
    vc[3]:=0;
    vc[4]:=0;
    masaTotal:=0;
    mayorMasa1:=-1;
    nombreMayor1:='';
    mayorMasa2:=-1;
    nombreMayor2:='';

    mayorMenor1:=999;
    nombreMenor1:='';
    menorMasa2:=999;
    nombreMenor2:='';
    for i:=1 to dimF do
    begin
        vc[vg[i].tipo]:=vc[vg[i].tipo]+1;
        if ((vg[i].nombre ='la Via Lactea') or (vg[i].nombre ='Andromeda') or (vg[i].nombre ='Triangulo')) then
        begin
            masaTotal:=masaTotal+vg[i].masa;
        end;
        if (vg[i].distancia < 1000) then
        begin
            galaxiasNoIrregulares:=galaxiasNoIrregulares+1;
        end;
        DosMayores(vg[i].nombre,vg[i].masa,mayorMasa1,nombreMayor1,mayorMasa2,nombreMayor2);
        DosMenores(vg[i].nombre,vg[i].masa,mayorMenor1,nombreMenor1,mayorMenor2,nombreMenor2);
    end;
    WriteLn('Cantidad de galaxias de cada tipo');
    WriteLn(vc[1]);
    WriteLn(vc[2]);
    WriteLn(vc[3]);
    WriteLn(vc[4]);
    WriteLn('La masa total acumulada es: ',masaTotal);
end;
//_____________________________________________________
var
    vg:vector_galaxias;
begin
    cargarGalaxias(vg);
    Informar(vg);
end.
