{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el módulo
desarrollado en “a.”) y retorne la cantidad total de minutos y la cantidad total de MB a facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35
}
program tres;
type
    lineas=record
    numero_telefono:integer;
    minutos_consumidos:integer;
    megas_consumidos_mes:integer;
end;
    cliente=record
    codigo_cliente:integer;
    cant_lineas:integer;
end;
    
//____________________________________________________________________________________
procedure Linea_Telefono(var numero_linea:lineas);
begin
    writeln('Ingrese numero de telefono: ');
    ReadLn(numero_linea.numero_telefono);
    writeln('Ingrese minutos consumidos: ');
    ReadLn(numero_linea.minutos_consumidos);
    writeln('Ingrese megas consumidas en todo el mes: ');
    ReadLn(numero_linea.megas_consumidos_mes);
    
end;
//____________________________________________________________________________________
procedure Funcion_esclavo(var esclavoF:cliente);
begin
    writeln('Ingrese codigo del cliente: ');
    ReadLn(esclavoF.codigo_cliente);
    writeln('Ingrese cantidad de lineas a su nombre: ');
    ReadLn(esclavoF.cant_lineas);
end;
//____________________________________________________________________________________
var
    Telefono:lineas;
    esclavo:cliente;
    i:integer;
    cant_total_minutos:integer;
    cant_total_megas:integer;
    factura_minutos:real;
    factura_megas:real;
begin
    cant_total_minutos:=0;
    cant_total_megas:=0;
    factura_minutos:=0;
    factura_megas:=0;
    Funcion_esclavo(esclavo);
    for i:=1 to esclavo.cant_lineas do
    begin
        Linea_Telefono(Telefono);
        cant_total_minutos:=cant_total_minutos+Telefono.minutos_consumidos;
        cant_total_megas:=cant_total_megas+Telefono.megas_consumidos_mes;
    end;
    factura_minutos:=cant_total_minutos*3.4;
    factura_megas:=cant_total_megas*1.35;
    writeln('La factura por el total de minutos es: ', factura_minutos:4:3);
    writeln('La factura por el total de megas es: ', factura_megas:4:3);

end.

