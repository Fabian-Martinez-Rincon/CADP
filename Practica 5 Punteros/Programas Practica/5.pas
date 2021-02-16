{5) De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación interna de cada
tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir de(I), suponiendo que
las variables del programa ya están declaradas y se cuenta con 400.000 bytes libres.}
Program Alocacion_Dinamica;
Type Empleado = record
    sucursal: char;  //1byte
    apellido: string[25];  //26 bytes
    correoElectronico: string[40];  //41bytes       72 bytes total
    sueldo: real;   //4bytes
end;

Str50 = string[50]; //Esta mas al pedo que papá drogradicto
Var
    alguien: Empleado;
    PtrEmpleado: ^Empleado; //4 bytes
 Begin
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
    Readln( alguien.apellido );  //[72+4]  estatica (no manejo memoria dinamica hasta poner el new)
    writeln(sizeof(alguien), ' bytes');
    {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
    New( PtrEmpleado ); //4bytes (puntero) + 72 (registro) + 72 (alguien)
    {¿Cuánta memoria disponible hay ahora? (III)}
    writeln(sizeof(PtrEmpleado^), ' bytes');
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido ); 
    // Estos read los ingnoro ya que no cambia en nada a mi memoria dinamica
    Readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo );
    {¿Cuánta memoria disponible hay ahora? (IV)}
    Dispose( PtrEmpleado );  //estatica [4B(puntero)+72B(alguien)] dinamica 0
    {¿Cuánta memoria disponible hay ahora? (V)}
end.
