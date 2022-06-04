program Ej2;
type
    archivo = file of integer;
var
    maestro : archivo;
    nro:integer;
    cant_menor:integer;
    cant:integer;
    total:integer;
begin
    nro:=0;
    cant_menor:=0;
    total:=0;
    cant:=0;
    Assign(maestro,'maestro.data');
    Reset(maestro);
    while not eof (maestro) do
    begin
        read(maestro,nro);
        if nro < 15 then
            cant_menor:=cant_menor+1;
        cant:=cant+1;
        total:=total+nro;
    end;
    WriteLn('La cantidad de nros menores a 15 es: ', cant_menor);
    WriteLn('El promedio de los nros ingresados es: ', (cant/total):2);
end.