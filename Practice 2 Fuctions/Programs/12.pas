{12. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón A$B#, donde:
- A es una secuencia de sólo letras vocalesf
- B es una secuencia de sólo caracteres alfabéticos sin letras vocalesf
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
 }

program EjerciciosAdd;
procedure A(var vocalesf:char);
var
  signo_dinero:Boolean;
begin
  signo_dinero:=true;
  
  while (vocalesf = 'a') or (vocalesf = 'e') or (vocalesf = 'i') or (vocalesf = 'o') or (vocalesf = 'u') and (signo_dinero <> false) do
      begin
        readln(vocalesf);
        if (vocalesf = '$') then
          begin
            signo_dinero:=false;
            writeln('cumple hasta A');
          end;
      end;
    if(signo_dinero=true) then
      writeln('No se cumple en A');
end;
//___________________________________________________________________________________________
procedure B(vocalesf:char);
var
  signo_numeral:Boolean;
begin
  signo_numeral:=true;
  while (vocalesf <> 'a') and (vocalesf <> 'e') and (vocalesf <> 'i') and (vocalesf <> 'o') and (vocalesf <> 'u') and (signo_numeral<>false) do
      begin
        readln(vocalesf);
        if(vocalesf = '#') then
          begin
            signo_numeral:=false;
            write('Se cumple En B tambien');
          end;
       
      end;
  if(signo_numeral=true) then
    begin
      write('No se cumple en B');
    end;
end;
//___________________________________________________________________________________________
var
  vocales:char;
  
begin
  vocales:='a';
  writeln('Secuencia de solo letras vocales');
  A(vocales);
  writeln('secuencia de solo caracteres alfabeticos sin vocales: ');
  B(vocales);
     
end.