program ultimo;

function multiplicar (x, y : integer) : integer;

begin

   multiplicar := x*y;

end;

var

  i, total : integer;

begin

   total := 0;

   for i := 1 to 5 do
   begin

       total := total + multiplicar(i,total);
       
    end;

writeln('la suma del producto de los números entre 1 y 5 es: ', total);

end.