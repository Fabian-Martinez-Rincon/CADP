{14b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la provincia de
Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona (1, 2 ó 3). La lectura
finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio de la soja es de U$S320 por
tn. Informar:
o La cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000.
o La localidad del campo con mayor rendimiento económico esperado.
o La localidad del campo con menor rendimiento económico esperado.
o El rendimiento económico promedio.
 }


program ejercicio14;
type
    zona=1..4;
    cadena20=string[20];
procedure ingresar_Datos(var LocalidadF:cadena20;var hectariasF:integer;var Tipo_ZonaF:zona);
begin
    Writeln('Ingrece Localidad del campo: ');
    ReadLn(LocalidadF);
    Writeln('Ingrese Hectarias: ');
    Readln(hectariasF);
    writeln('Ingrese tipo de zona:');
    writeln('1: Zona muy fertil');
    writeln('2: Zona estandar');
    writeln('3: Zona arida');
    ReadLn(Tipo_ZonaF);
    
end;
//___________________________________________________________________________________________

function Rendimiento_Economico(hectariasR:integer;Tipo_ZonaR:zona; Precio_ToneladaR:real; RendimientoF:real):real;
begin
    case(Tipo_ZonaR) of
    1: RendimientoF:= 6 * hectariasR * Precio_ToneladaR;
    2: RendimientoF:= 2.6 * hectariasR * Precio_ToneladaR;
    3: RendimientoF:= 1.4 * hectariasR * Precio_ToneladaR;
    end;
    Rendimiento_Economico:=RendimientoF;
end;
//___________________________________________________________________________________________
procedure Tres_Febrero(Localidad2:cadena20;Rendimiento_oficial2:real;var Contador_Febrero2:integer);
begin
    if(Localidad2='Tres de Febrero') and (Rendimiento_oficial2>10000)then
    begin
        Contador_Febrero2:=Contador_Febrero2+1;
    end;
end;
//___________________________________________________________________________________________
procedure Mayor_Rendimiento(Localidad2:cadena20;var Localidad_Mayor2:cadena20;Rendimiento_oficial2:real;var Rendimiento_Mayor2:real);
begin
    if(Rendimiento_oficial2>Rendimiento_Mayor2)then
    begin
        Rendimiento_Mayor2:=Rendimiento_oficial2;
        Localidad_Mayor2:=Localidad2;
    end;
end;
//___________________________________________________________________________________________
procedure Menor_Rendimiento(Localidad2:cadena20;var Localidad_Mayor2:cadena20;Rendimiento_oficial2:real;var Rendimiento_Mayor2:real);
begin
    if(Rendimiento_oficial2<Rendimiento_Mayor2)then
    begin
        Rendimiento_Mayor2:=Rendimiento_oficial2;
        Localidad_Mayor2:=Localidad2;
    end;
end;
//___________________________________________________________________________________________
var
  Contar_Rendimiento,
  Hectarias,
  Contador_Febrero:integer;
  Tipo_Zona:zona;
  Sumas_Rendimiento,
  Precio_Tonelada,
  Rendimiento,
  Rendimiento_oficial,
  Rendimiento_Mayor,
  Rendimiento_Menor:real;
  Localidad:cadena20;
  
  
  Localidad_Mayor:cadena20;
  Localidad_Menor:cadena20;
begin
    Rendimiento:=0;
    Contar_Rendimiento:=0;
    Precio_Tonelada:=320;
    Contador_Febrero:=0;
    Rendimiento_Mayor:=-1;
    Rendimiento_Menor:=9999;
    Sumas_Rendimiento:=0;
    repeat
        
        ingresar_Datos(Localidad,Hectarias,Tipo_Zona);
        Rendimiento_oficial:=Rendimiento_Economico(Hectarias,Tipo_Zona,Precio_Tonelada,Rendimiento);
        writeln(Rendimiento_oficial:10:2);
        Tres_Febrero(Localidad,Rendimiento_oficial,Contador_Febrero);
        Mayor_Rendimiento(Localidad,Localidad_Mayor,Rendimiento_oficial,Rendimiento_Mayor);
        Menor_Rendimiento(Localidad,Localidad_Menor,Rendimiento_oficial,Rendimiento_Menor);
        Contar_Rendimiento:=Contar_Rendimiento+1;
        Sumas_Rendimiento:=Sumas_Rendimiento+Rendimiento_oficial;
    until (Hectarias=900) and (localidad = 'Saladillo');
    writeln('La cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000 es:',Contador_Febrero);
    writeln('La localidad con mayor rendimiento es: ', Localidad_Mayor);
    writeln('La localidad con menor rendimiento es: ', Localidad_Menor);
    writeln('El promedio total de los rendimientos es: ', Sumas_Rendimiento/Contar_Rendimiento);
end.