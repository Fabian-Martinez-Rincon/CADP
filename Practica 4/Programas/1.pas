{a) ¿Qué valores toma la variable numeros al finalizar el
primer bloque for? 10
b)Al terminar el programa, ¿con qué valores finaliza la
variable números? 55
c) Si se desea cambiar la línea 11 por la sentencia:
for i:=1 to 9 do
¿Cómo debe modificarse el código para que la variable
números contenga los mismos valores que en 1.b)?
Podes sumarle 10 al finalizar
d) ¿Qué valores están contenidos en la variable
numeros si la líneas 11 y 12 se reemplazan por:
for i:=1 to 9 do
 numeros[i+1] := numeros[i];
 10 y 1
}

 program sumador;
type
 vnums = array [1..10] of integer;
 var
 numeros : vnums;
 i : integer;
 begin
 for i:=1 to 10 do {primer bloque for}
      numeros[i] := i;
       WriteLn(numeros[i]);

 for i := 1 to 9 do {segundo bloque for}
     numeros[i+1] := numeros[i];
      WriteLn(numeros[i]);

 end.