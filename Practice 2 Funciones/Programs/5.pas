{5. Dado el siguiente programa, encontrar los 6 errores. Utilizar los comentarios entre llaves como guía, indicar en qué
línea se encuentra cada error y en qué consiste: }
program ejercicio4;
 { suma los números entre a y b, y retorna el resultado en c }
 procedure sumar(a, b, c : integer)
 var
    suma : integer;
 begin
    for i := a to b do
        suma := suma + i;
        c := c + suma;
 end;
 var
    result : integer;
 begin
    result := 0;
    readln(a); readln(b);
    sumar(a, b, 0); // no podes pasar un valor por parametro "0"
    write(‘La suma total es ‘,result);
 { averigua si el resultado final estuvo entre 10 y 30}
    ok := (result >= 10) or (result <= 30);
    if (not ok) then
        write (‘La suma no quedó entre 10 y 30’);
 end.
