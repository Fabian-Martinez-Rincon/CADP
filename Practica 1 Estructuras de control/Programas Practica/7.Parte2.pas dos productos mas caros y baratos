//7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los autos se lee el
//nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera participaron 100 autos. Informar en
//pantalla:
//○ Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
//○ Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
program ejemplo;

var
		i:integer;
		
		piloto_ultimo:string;
		piloto_anteultimo:string;
		piloto_primero:string;
		piloto_segundo:string;
		piloto:string;	
		tiempo_carrera:real;
		mejor_tiempo1:real;
		mejor_tiempo2:real;
		ultimo_tiempo1:real;
		ultimo_tiempo2:real;
		
begin
	mejor_tiempo1:=1000000;	  //Ponemos un numero muy grande para que no moleste
	mejor_tiempo2:=1000000;
	ultimo_tiempo1:=-1;
	ultimo_tiempo2:=-1;
	piloto_primero:='';
	piloto_ultimo:='';
	for i:=0 to 3 do 
		begin
			writeln('Nombre del piloto: ');
			readln(piloto);
			writeln('Tiempo de carrera: ');
			readln(tiempo_carrera);
			writeln('_____________________________ ');
	//_______________________________________________________________________________
			if (tiempo_carrera<mejor_tiempo1)then
				begin
					mejor_tiempo2:=mejor_tiempo1;   //Guardo el valor viejo de tiempo 1 y lo muevo a tiempo 2
					piloto_segundo:=piloto_primero;
					mejor_tiempo1:=tiempo_carrera;
					piloto_primero:=piloto;
				end
			else
				begin //si el tiempo que ingreso no es mejor que el primero, me fijo si es mejor que el segundo, si no no pasa nada
					if(tiempo_carrera<mejor_tiempo2) then //si el tiempo es mas chico que el segundo,lo cambio y listo
						begin
							mejor_tiempo2:=tiempo_carrera;
							piloto_segundo:=piloto;
						end
				end;
	//_______________________________________________________________________________
					
			if(tiempo_carrera>ultimo_tiempo1) then
				begin
					ultimo_tiempo2:=ultimo_tiempo1;
					piloto_anteultimo:=piloto_ultimo;
					ultimo_tiempo1:=tiempo_carrera;
					piloto_ultimo:=piloto;
				end
			else
				begin
					if(tiempo_carrera>ultimo_tiempo2) then
						begin
							ultimo_tiempo2:=tiempo_carrera;
							piloto_anteultimo:=piloto;
						end
				end;
				
		end; {for}
		
	writeln('El primer auto es de: ', piloto_primero); {informa}
	writeln('El segundo auto es de: ', piloto_segundo); {informa}
	writeln('El ultimo auto es de: ', piloto_ultimo); {informa}
	writeln('El ante ultimo auto es de: ', piloto_anteultimo); {informa}
			
	
end.
