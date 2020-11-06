program punteros;
type
  cad10 = string[10];
  producto= record
  nombre: cad10;
  precio: real;
  end;
  ptrproducto = ^ producto;



procedure leerproducto (var p:producto);
begin
  readln (p.nombre);
 if p.nombre <> 'ZZZ' then readln (p.precio);
end;
var
  pprod: ptrproducto;  total : integer;
begin
  total:=0;
  new (pprod);
  leerproducto (pprod^);
  while ( pprod^.nombre <> 'ZZZ') do begin
    if (pprod^.precio >=25) and (pprod^.precio <=50) then begin
      writeln ('producto: ', pprod^.nombre);
      total:= total + 1
   end;
   leerproducto (pprod^)
 end;
  write ('Total:', total);
end.
