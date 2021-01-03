program probandoPunteros;
Type 
    TipoString = string[20];
    Datos = record
    Nombre: TipoString;
    Apellido: TipoString;
    Edad: integer;
	Altura: real
    end; 	
    PtrDatos = ^datos;
    PtrReal = ^real;
    PtrString = ^TipoString;

Var 
    p     : PtrDatos;
    peso  : PtrReal;
    frase : PtrString;
begin
  New(p); New(peso); New(frase);
  ReadLn(P^.Nombre);
  WriteLn(p^.Nombre);
  ReadLn(p^.Apellido);
  WriteLn(p^.Apellido);
  p^.Edad:=30;
  p^.Altura:=3;
  peso^:=3;
  frase^:='La casa de Maria';
  WriteLn(p^.Altura:2:2);
  WriteLn(frase^);
  
end.