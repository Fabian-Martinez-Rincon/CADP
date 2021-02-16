{● Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de números, la
suma y el producto de todos los números entre X e Y.
- Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)
 }

program Ejercicio2;

//__________________________________________________________________________________________
procedure Leer_Diez_Pares(var num1, num2 : integer);
begin
    writeln('Ingrese numero 1: ');
    read(num1);
    Writeln('Ingrese numero 2');
    read(num2);
end;
procedure Suma(var Suma_Total:integer;numero1:integer; numero2 : integer);
begin
    for numero1:=numero1+1 to numero2-1 do
    begin
        Suma_Total:=Suma_Total+numero1;
    end;
    writeln('La suma de todos los numeros entre x e y son : ', Suma_Total);
end;
//__________________________________________________________________________________________
procedure Producto(var Multi_Total:integer;numero1:integer; numero2 : integer);
begin
    for numero1:=numero1+1 to numero2-1 do
    begin
        Multi_Total:=Multi_Total*numero1;
    end;
    writeln('El producto de todos los numeros entre x e y son : ', Multi_Total);
end;
//__________________________________________________________________________________________
var
    Suma_Numeros,
    x,
    Producto_Numeros,
    y:integer;
begin
  Suma_Numeros:=0;
  Producto_Numeros:=1;
  Leer_Diez_Pares(x,y);
  Suma(Suma_Numeros,x,y);
  Producto(Producto_Numeros,x,y);
end.
