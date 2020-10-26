{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y desde la
mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la posición
X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere que,
dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.

}

 program Vectores;
const
 dimF=10;
 type vector =  Array [1..dimF] of integer;
//______________________________________________________________________________________________
 procedure Cargar (var vectorF:vector; var dimL:integer);
 var
    dato:integer;
 begin
    dimL:=0;
    ReadLn(dato);
    while (dimL<dimF) do begin
        dimL:=dimL+1;
        vectorF[dimL]:=dato;
        ReadLn(dato);
    end;
 end;
//______________________________________________________________________________________________
procedure primera_ultima(arregloF:vector;dimL2:integer);
var 
    i:integer;
begin
  for i:=1 to dimL2 do
    begin
        WriteLn(arregloF[i]);
    end;
end;
//______________________________________________________________________________________________
procedure ultima_primera(arregloF:vector;dimL2:integer);
var 
    i:integer;
begin
    for i:=dimL2 downto 1 do
    begin
        WriteLn(arregloF[i]);
    end;
end;
//______________________________________________________________________________________________
procedure mitad_primera(arregloF:vector;dimL2:integer);
var
i:integer;
mitad:integer;
begin
    i:=1;
    for mitad:=(dimL2 div 2) downto i do
    begin
        WriteLn(arregloF[mitad]);
    end;
end;
//______________________________________________________________________________________________
procedure mitad_ultima(arregloF:vector;dimL2:integer);
var
i:integer;
mitad:integer;
begin
    
    for mitad:=(dimL2 div 2) to dimL2 do
    begin
        WriteLn(arregloF[mitad]);
    end;
end;
//______________________________________________________________________________________________
procedure recibe_X_Y(arregloF2:vector;dimension_logica:integer);
var
    x:integer;
    y:integer;
begin
    writeln('Ingrese un "x" para comenzar');
    readln(x);
    writeln('Ingrese un "y" para terminar');
    ReadLn(y);
    if (x<y) then
    begin
        while (x<=y) do
        begin
            WriteLn(arregloF2[x]); 
            x:=x+1; 
        end;
    end
    //____________________________
    else
    begin
        while (x>=y) do
        begin
            WriteLn(arregloF2[x]);
            x:=x-1;     
        end;
    end;
end;
//______________________________________________________________________________________________
var
    arreglo:vector;
    dimension_logica:integer;
   
begin
    dimension_logica:=0;
    Cargar(arreglo,dimension_logica);
    WriteLn('________________________________________________________');
    writeln('A) ');
    primera_ultima(arreglo,dimension_logica);  // a
     WriteLn('_______________________________________________________');
    writeln('B) ');
    ultima_primera(arreglo,dimension_logica);  //b
    WriteLn('_______________________________________________________');
    writeln('C) ');
    mitad_primera(arreglo,dimension_logica);
    WriteLn('_______________________________________________________');
    mitad_ultima(arreglo,dimension_logica);
    WriteLn('_______________________________________________________');
    writeln('D) ');
    recibe_X_Y(arreglo,dimension_logica);



end.