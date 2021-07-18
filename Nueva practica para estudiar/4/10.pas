{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo sumo 300 
empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se completa el vector. 
Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un módulo 
que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y retorne el mismo 
vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa}
program diez;
const
    dimF=300;
type
    rango = 1..dimF;
    vector = array [rango] of Real;
//__________________________________________________
procedure cargarVector(var v:vector;var dimL:rango);
var
    empleado:Real;
begin
    write('Sueldo: '); ReadLn(empleado);
    while ((dimL<dimF) and (empleado<>0))do
    begin
        v[dimL]:=empleado;
        dimL:=dimL+1;
        write('Sueldo: '); ReadLn(empleado);
    end;
    dimL:=dimL-1;
end;
//__________________________________________________
procedure incrementarSalario(var v:vector;dimL:rango;aumento:Real);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        v[i]:=v[i]*aumento;
        WriteLn('aumento: ', v[i]:2:2);
    end;
end;
//__________________________________________________
procedure sueldoPromedio(v:vector;dimL:rango;var promedio:Real);
var
    i:integer;
    total:real;
begin
    total:=0;
    for i:=1 to dimL do
    begin
        total:=v[i]+total;
    end;
    promedio:=total/dimL;
    WriteLn('El promedio del sueldo de los empleados es: ', promedio:2:2);
end;
//__________________________________________________

var
    v:vector;
    dimL:rango;
    aumento:Real;
    promedio:real;
begin
    aumento:=1.15;
    dimL:=1;
    cargarVector(v,dimL);
    incrementarSalario(v,dimL,aumento);
    sueldoPromedio(v,dimL,promedio);
end.