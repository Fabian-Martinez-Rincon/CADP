{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal
}

program Ejercico11;
type
    rol_num=1..4;
    str20=string[20];    
    usuario=record
        mail:str20;
        rol:rol_num;
        revistaPart:str20;
        cant_dias:integer;
    end;
    Lista=^nodo;
    nodo=record
        Datos:usuario;
        sig:Lista; 
    end;
    vector=array [1..3600] of usuario; 
    vector_contador= array [1..4] of integer;
//____________________________________________________
Procedure InsertarElemento ( var pri: lista; per: usuario);
var ant, nue, act: lista;
begin
  new (nue);
  nue^.Datos := per;
  act := pri;
  ant := pri;
{Recorro mientras no se termine la lista y no encuentro la posición correcta}
  while (act<>NIL) and (act^.datos.cant_dias < per.cant_dias) do begin
      ant := act;
      act := act^.sig ;
  end;
  if (ant = act)  then pri := nue   {el dato va al principio}
                  else  ant^.sig  := nue; {va entre otros dos o al final}
  nue^.sig := act ;
end;

//____________________________________________________
procedure InicializarVC (var vc:vector_contador);
var
    i:integer;
begin
    for i:=1 to 4 do
    begin
        vc[i]:=0;
    end
end;
//____________________________________________________
procedure actualizarDosMaximos (max1;max2;mmax1;mmax2;mailUsuario;)
//____________________________________________________
procedure recorrer( var L:Lista; VUsuarios:vector;var vContador:vector_contador);
var
    i:integer;
    rolF:integer;
begin
    for i:=1 to 3600 do
    begin
        if (VUsuarios[i].revistaPart='economica')then
        begin
            InsertarElemento(L,VUsuarios[i]);
        end;
        rolF:=VUsuarios[i].rol;
        vContador[rolF]:=vContador[rolF]+1;
        actualizarDosMaximos(max1,max2,mailmax1,mailmax2,VUsuarios[i].mail,VUsuarios[i].cant_dias);
    end;
    Informar(L,vContador,mailmax1,mailmax2);
  
end;
//____________________________________________________
var
    L:Lista;
    V:vector;
    vContador:vector_contador;
begin
    L:=nil;
    //CargarLista(L); //Se dispone
    InicializarVC(vContador);
    recorrer(L,V,vContador);
    
end.
