{a. ¿Qué imprime si se leen los valores num1=10 y num2=5 ?
b. ¿Qué imprime si se leen los valores num1=5 y num2=10 ? 
 }

program Ejercicio2;
procedure intercambio(var num1,num2 : integer);
var
 aux : integer;
begin
 aux := num1;  //aux = 10   aux = 11  aux = 12
 num1 := num2;  //num1 = 5  num1 = 10  num1 = 11
 num2 := aux; //num2 = 10  num2= 11  num1 = 12
end;
//____________________________________________________
procedure sumar(num1 : integer; var num2 : integer);
begin
 num2 := num1 + num2; //num2 = 1 + 10 = 11      num2 = 2 + 10 = 12
end;
//____________________________________________________
var
 i, num1, num2 : integer;
begin
 read(num1);  //num1 = 10
 read(num2);  //num2 = 5
 for i := 1 to 3 do begin
 intercambio(num1,num2); // i=1  {num1 = 5   num2 = 10}  i=2 {num1 = 10   num2 = 11}  i=3 num1=11  num2=12
 sumar(i,num1); //num1 = 11   num1 = 12  num1=13
 end;
 writeln(num1); //a)13  b)8
end.
