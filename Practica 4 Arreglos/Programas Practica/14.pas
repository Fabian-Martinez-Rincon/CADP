{
14. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los años
mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares, obtiene un
promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los datos recolectados,
el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un programa que lea y almacene los
datos correspondientes a las mediciones de los últimos 50 años (la información se ingresa ordenada por año).
Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años


}

 program Vectores;
 const
 dimF=36;
 type
    anio = record 
    zona:1..10;
    temperatura:real;
    end;
    vector_zona = Array [1..10] of integer;
    vector_temp =  Array [1..dimF] of anio;
//_________________________________________________________________________________    
procedure Leer(var datos:anio);
begin
    with datos do begin
        WriteLn('Zona:'); readln(zona);
        WriteLn('Temperatura::'); ReadLn(temperatura);
    end;
end;
//_________________________________________________________________________________
procedure leer_temperatura(var temperaturasF:vector_temp);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        Leer(temperaturasF[i]);
    end;
end;
//_________________________________________________________________________________
procedure Inicializar_vector(var VC:vector_zona);
var
    i:integer;
begin
    for i:=1 to 4 do
    begin
        VC[i]:=0;
    end
end;
//_________________________________________________________________________________
procedure imprimir_VectorContador(VC:vector_zona);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        WriteLn(VC[i]);
    end;

end;
var
    temperatura_acumulada:real;    
    temperaturas:vector_temp;
    i:integer;
    promedio_anual:real;
    Zona_contador:integer;
    zona_vector:vector_zona;
begin
    Zona_contador:=0;
    promedio_anual:=0;
    temperatura_acumulada:=0;
    leer_temperatura(temperaturas);
    inicializar_Vector(zona_vector);
    for i:=1 to dimF do
    begin
        //Lo unico que hacemos es leer el tipo de zona en la posicion i, y esa posicion es un valor dentro de las zonas
        //Contamos la cantidad de veces que esa zona fue ingresada para luego sacar el promedio de esa zona
        Zona_contador:=temperaturas[i].zona;
        {temperatura_acumulada:=temperaturas[i].temperatura+temperatura_acumulada;}
        
        zona_vector[Zona_contador]:=zona_vector[Zona_contador]+1;
    end;
    imprimir_VectorContador(zona_vector); 
end.