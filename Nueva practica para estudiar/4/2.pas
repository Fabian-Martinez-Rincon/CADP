program Vectores;
const
    cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;

//____________________________________________________________
procedure cargarVector(var v:vdatos; var dimL:integer);
var
    num_cargar:integer;
begin
    Write('nro: ');
    ReadLn(num_cargar);
    while num_cargar <> 0 do
    begin
        dimL:=dimL+1;
        v[dimL]:=num_cargar;
        Write('nro: ');
        ReadLn(num_cargar);
    end;
end;
//____________________________________________________________

procedure modificarVectorySumar(var v:vdatos; dimL:Integer; n:real; var suma:real);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        v[i]:=v[i]+n;
        suma:=suma+v[i];
    end;
end;
//____________________________________________________________
procedure imprimirVector(v:vdatos;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do
    begin
        WriteLn(v[i]:2:1);
    end;
end;    
//____________________________________________________________
var 
    datos: vdatos;
    i,dim:integer;
    num,suma:real;
begin
    dim:=0;
    suma:=0;
    cargarVector(datos,dim);
    WriteLn('Dimension: ', dim);
    WriteLn('Ingrese un valor a sumar: ');
    ReadLn(num);
    modificarVectorySumar(datos,dim,num,suma);
    WriteLn('__________________');
    imprimirVector(datos,dim);
    WriteLn('__________________');
    WriteLn('La suma de los valores es: ', suma:0:2);
    WriteLn('Se procesaron: ', dim, ' numeros');
end.