program dos;
uses crt;
type 
    archivo = file of integer;
    cadena20 = string[20];
//_______________________________________________
procedure ImprimirArchivo(var arch_logico:archivo);
var
    x:integer;
    cantidad:integer;
    cantMenor:integer;
    total:integer;
    promedio:real;
begin
    reset(arch_logico); 
    cantidad:=0;
    promedio:=0;
    cantMenor:=0;
    total:=0;
    while(not eof(arch_logico)) do 
    begin
        cantidad:=cantidad+1;
		read(arch_logico, x);
        if (x < 1500) then begin
            total:=total+x;
            cantMenor:=cantMenor+1;
        end;
    end;
    close(arch_logico);
    promedio:=(total/cantidad);
    WriteLn('Los num menores a 1500: ',cantMenor);
    WriteLn('El promedio de los nros ingresados es: ',promedio:2:2);
end;
//_______________________________________________
var 
    arch_logico: archivo;
    arch_fisico: cadena20;
begin
    clrscr;
    arch_fisico:='uno';
    assign( arch_logico, arch_fisico );
    ImprimirArchivo(arch_logico);
end.