//1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
//a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.

program ejemplo;
type
	pun1 = ^persona;
	str20 = String[20];
	persona = record
  		nombre: str20;
	   apellido: str20;
	end;
Procedure intercambiar ( var name:str20);
Begin
   name:= 'Carolina';
End;
Var
   p1: pun1;
begin
   new(p1);
   p1^.nombre:= 'Lucia';
   intercambiar ( p1^.nombre);
   writeln( p1^.nombre);
	readln();
end.
