{Leer un carácter y almacenar en una variable booleana el valor true,  si es un carácter numérico, y el valor false 
en caso contrario. }

var
    c: char;
    esNumerico: boolean;
begin
    readln(c);
    esNumerico := (c >= '0') and (c <= '9');
    writeln(esNumerico);
end.