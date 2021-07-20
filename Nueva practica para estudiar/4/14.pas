{14. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los años 
mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares, obtiene un 
promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los datos recolectados, 
el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un programa que lea y almacene los 
datos correspondientes a las mediciones de los últimos 50 años (la información se ingresa ordenada por año). 
Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}
const
    dimF = 3;
    dimF2 = 2;
type
    rango1 = 1..dimF;
    rango2 = 1..dimF2;
    lugares = array [rango1,rango2] of integer;
//_____________________________________________________________
procedure LeerInformacion_Anual(var L:lugares);
var
    i:integer;
    f:Integer;
begin
    for f:=1 to dimF2 do
    begin
        for i:=1 to dimF do
        begin
            Read(L[i,f]);
            
        end; 
        WriteLn();
    end;
end;
//_____________________________________________________________
procedure imprimir(L:lugares);
var
    i:integer;
    f:Integer;
    tempMayor:Real;
    total:Real;
    anioMayor:integer;
    tempUltra:real;
    anioUltra:integer;
begin
    tempMayor:=-1;
    anioMayor:=0;
    tempUltra:=-1;
    for f:=1 to dimF2 do
    begin
        total:=0;
        for i:=1 to dimF do
        begin
            Write(L[i,f]);
            total:=total+L[i,f];

            if (L[i,f]>tempUltra) then
            begin
                tempUltra:=L[i,f];
                anioUltra:=f;
            end;
        end; 

        if (total>tempMayor) then
            begin
                tempMayor:=total;
                anioMayor:=f;
            end;
        WriteLn();
    end;
    WriteLn('El anio con mayor promedio es: ', anioMayor);
    WriteLn('El anio B es: ',anioUltra);
end;
//_____________________________________________________________
var
    l:lugares;
begin
    
    LeerInformacion_Anual(l);
    WriteLn('_________________________');
    imprimir(l);
end.