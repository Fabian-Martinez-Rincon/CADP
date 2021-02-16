//8. Realizar un programa que lea el DNI, apellido y nombre de los clientes de un banco. La lectura deberá finalizar cuando
//se ingrese el DNI -1 (que no debe procesarse) o cuando se hayan procesado 1000 clientes. Se pide calcular e informar:
//○ Si hay algún cliente del banco llamado “Pedro”.
//○ La cantidad de clientes de apellido “Gómez”.
//○ El porcentaje de clientes de apellido “Hernández” y con DNI par.

program ejemplo;
type
	numero=0..100;
var
	clientes:numero;
	dni:real;
	apellido,nombre:char;
begin
	dni:=0;
	clientes:=0;
	write('Ingrese su dni: ');
	read(dni);
	write('Ingrese su apellido: ');
	read(apellido);
	write('Ingrese su nombre: ');
	read(nombre);
	
	while(dni<>-1) and (clientes<100)do
		begin
			write('Ingrese su dni: ');
			read(dni);
			write('Ingrese su apellido: ');
			read(apellido);
			write('Ingrese su nombre: ');
			read(nombre);
		
		end;

end.
