program punterosC;
type
  cadena = string[50];
  puntero_cadena = ^cadena;

procedure cambiar(var pun1: puntero_cadena;  
                  pun2: puntero_cadena);
begin
  pun1:= pun2;
end;

var
  p1, p2: puntero_cadena;
begin
  new(p1);
  p1^:= 'Hoy es lunes';
  writeln('El contenido de p1^: ', p1^);
  cambiar(p2, p1);//P2 obtiene el valor de p1
  writeln('El contenido de p1^: ', p1^);
  writeln('El contenido de p2^: ', p2^);
end.



