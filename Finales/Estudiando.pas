Const 
    limite=1000;
Type
 numeros = array [1..limite] of integer; 
 cadena15 = string [15];
 producto= Record
    codigo: integer;  
    nombre: cadena15;
  	marca: cadena15;
	  stock: integer;
	  precio: real; 
End;

vectorProductos = array [1..100] of producto;
cajas = array [ 'A' .. 'D' ] of real;
Var
  productos : vectorProductos; 
  N: numeros; 
  i : integer; 
  totalPorCaja: cajas;
Begin
  totalPorCaja['C'] := 2500.50;
  N [5] := 500;
  N [1] := N [5] * 2;
  productos[1].precio:= 100;    
  productos[3].precio:= productos[1].precio + 10;
  productos[5].precio:= productos[1].precio + productos[3].precio;
  i:= 10;  
  productos[i].stock:= 50;
End.
