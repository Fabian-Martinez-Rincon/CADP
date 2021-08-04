{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La información se
ingresa ordenada por marca. Se pide calcular e informar:
o Precio promedio por marca.
o Marca y modelo del auto más caro.

}
program tres;
type
    str20=string[20];
    autos=record
    marca:str20;
    modelo:str20;
    precio:real;
end;
    
//____________________________________________________________________________________
procedure leer_auto(var autosF:autos);
begin
    writeln('Ingrese marca del auto: ');
    ReadLn(autosF.marca);
    writeln('Ingrese modelo del auto: ');
    ReadLn(autosF.modelo);
    writeln('Ingrese precio del auto: ');
    ReadLn(autosF.precio);
    
end;
//____________________________________________________________________________________
procedure auto_caro(autosF2:autos;auto_mas_caroF:real);
begin
    if (autosF2.precio>auto_mas_caroF)then
    begin
        auto_mas_caroF:=autosF2.precio;
    end;
end;
//____________________________________________________________________________________
var
    auto:autos;
    precio_promedio:real;
    cant_autos:integer;
    precio_total:real;
    auto_mas_caro:real;
begin
    auto_mas_caro:=-1;
    precio_total:=0;
    precio_promedio:=0;
    cant_autos:=0;
    auto.marca:='';
    while auto.marca <> 'ZZZ' do
    begin
        leer_auto(auto);
        auto_caro(auto,auto_mas_caro);
        cant_autos:=cant_autos+1;
        precio_total:=precio_total+auto.precio;
    end;
    precio_promedio:=precio_total/cant_autos;
    writeln('El precio promedio de todos los autos es:',precio_promedio:6:3);
    writeln('El auto con el precio mas caro es: ',auto_mas_caro:6:3 ); 
end.

