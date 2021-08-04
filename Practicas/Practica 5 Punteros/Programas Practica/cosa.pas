program ejercicio2;

type

  puntero = ^integer;

var

  p, q: puntero;

 

begin

  p:= nil; 

  new (q); 

  q^:= 200;

  p := q; 

  p^:= 150;

  writeln(q^); {1}

  writeln(p^); {2}

  new(q); 

  q^:= 300;

  q^ := p^;

  p:= nil;

  writeln(q^); {3}

end.