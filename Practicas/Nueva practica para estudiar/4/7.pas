{7. Realizar un programa que resuelva los siguientes incisos:
a) Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando 
se lee el nombre ‘ZZZ’, que no debe procesarse.
c) Lea un nombre y lo inserte en la posición 4 del vector.
d) Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.
}
program siete;
const
    dimF=500;
type
    rango = 1..dimF;
    letras = string[10];
    vector = array [rango] of letras; 
//______________________________________________________________
procedure cargarArreglos(var v:vector;var dimL:rango);
var    
    alumno:letras;
begin
    ReadLn(alumno);
    while ((alumno<>'ZZZ') and (dimL<=dimF)) do
    begin
        WriteLn(dimL);
        v[dimL]:=alumno;
        dimL:=dimL+1;
        ReadLn(alumno);
    end;
    dimL:=dimL-1;
end;
//______________________________________________________________
Procedure insertar(var a:vector; var dim:rango;valor:letras;pos:rango);
Var
  i:integer;  
Begin
  if ((dim<dimF) and (pos<=dim) and (pos>=1))then           
    begin                                                                                             
      for i:= dim downto pos do        
        a[i+1]:= a[i];  
      a[pos]:= valor;      
      dim:= dim + 1;     
    end; 
end;
//______________________________________________________________
procedure imprimirVector(v:vector;dim:rango);
var
    i:Integer;
begin
    for i:=1 to dim do
    begin
        WriteLn(v[i]);
    end;
end;
//______________________________________________________________
Procedure agregar (var a :vector; var dim:rango;valor:letras);
Begin
  if (dim  < dimF) then begin   
   dim:= dim + 1;                
   a[dim]:= valor;              
  end; 
end;

//______________________________________________________________
var
    v:vector;
    dimL:rango;
    nombreC:letras;
    posicion:rango;
    nombreD:letras;
begin   
    dimL:=1;
    posicion:=4;
    nombreC:='PEPE';
    nombreD:='PEPE2';
    cargarArreglos(v,dimL);
    WriteLn('dimensio Logica',dimL);
    WriteLn('___________');
    insertar(v,dimL,nombreC,posicion);
    imprimirVector(v,dimL);
    agregar(v,dimL,nombreD);
    WriteLn('___________');
    imprimirVector(v,dimL);
end.