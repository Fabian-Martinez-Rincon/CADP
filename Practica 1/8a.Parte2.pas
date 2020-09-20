{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día del mes, los montos
//de las ventas realizadas. La lectura de montos para cada día finaliza cuando se lee el monto 0. Se asume un mes de 31
//días. Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo el mes.
a. Modificar el ejercicio anterior para que además informe el día en el que se realizó la mayor cantidad de ventas.}
program ejemplo;
type

	dias=0..31;
var
    mayor_ventas:Integer;
	i:dias;
	monto:Integer;
	cant_dia:Integer;
	cant_mes:Integer;
    dia:integer;
begin
	cant_mes:=0;
	cant_dia:=0;
	monto:=0;
    dia:=0;
    mayor_ventas:=0;
	for i:=0 to 3 do
	  begin
	  	writeln('Dia: ',i);
		Writeln('ingrese el monto: ');
		read(monto);
		cant_dia:=0;
		while (monto<>0) do
		  begin
		  	cant_dia:=cant_dia+1;
			Writeln('ingrese el monto: ');
			read(monto);
            dia:=cant_dia;
		  end;
        if(dia>mayor_ventas) then
          begin
            mayor_ventas:=dia;
          end;
		Writeln('La cantidad de ventas del dia: ', i ,' es de: ',cant_dia);
		cant_mes:=cant_mes+cant_dia;
	  end;
	Writeln('El dia con mayor cantidad de ventas ', mayor_ventas);
	Writeln('La cantidad del mes es: ', cant_mes);
end.
