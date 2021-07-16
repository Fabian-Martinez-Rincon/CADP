{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL. 
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la 
mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición 
X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que, 
dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}
program tres;
const
    dimF = 10;
type
    rango = 1..dimF;    
    vector = array [1..dimF] of integer;
//_______________________________________________
procedure CargarVector(var v:vector;var dimL:rango);
var
    i:integer;
begin
    for i:=1 to dimF do
    begin
        v[i]:=i;
        dimL:=dimL+1;
    end;
end;
//_______________________________________________
procedure ImprimirVectorA(v:vector;dimL:rango);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________
procedure ImprimirVectorB(v:vector;dimL:rango);
var
    i:integer;
begin
    for i:=dimL downto 1 do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________
procedure ImprimirVectorC1(v:vector;dimL:rango);
var
    i:integer;
begin
    for i:=(dimL div 2) to dimL do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________
procedure ImprimirVectorC2(v:vector;dimL:rango);
var
    i:integer;
begin
    for i:=(dimL div 2) downto 1 do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________
procedure ImprimirVectorD(v:vector;x:rango;y:rango);
var
    i:integer;
begin
    for i:=x to y do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________
procedure ImprimirVectorD2(v:vector;x:rango;y:rango);
var
    i:integer;
begin   
    for i:=x downto y do
    begin
        WriteLn(v[i]);
    end;
end;
//_______________________________________________
var
    v:vector;
    dimL:rango;
    x,y:rango;
begin
    CargarVector(v,dimL);
    ImprimirVectorA(v,dimL);
    WriteLn('___________');
    ImprimirVectorB(v,dimL);
    WriteLn('___________');
    ImprimirVectorC1(v,dimL);
    WriteLn('___________');
    ImprimirVectorC2(v,dimL);
    WriteLn('___________');
    Write('x: '); ReadLn(x);
    Write('y: '); ReadLn(y);
    if (x < y) then
    begin
         ImprimirVectorD(v,x,y);
    end
    else
        begin
            ImprimirVectorD2(v,x,y);
        end;
    
    

    
end.