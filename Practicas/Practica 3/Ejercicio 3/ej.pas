procedure modificar(var logicx:archivo);
var
	n:novelas;
	cod:integer;
begin
    writeln('Ingrese el codigo de la novela a modificar:');
    readln(cod);
    reset(logicx);
    leer(logicx,n);
    if(n.cod <> valoralto)then begin
		while(n.cod <> cod)do leer(logicx,n);
		n.cod:=cod;
        write('Nombre de novela:'); readln(n.nombre);
		seek(logicx,filepos(logicx)-1);
		write(logicx,n);
    end;
    close(logicx);
end;