{4. Dada la siguiente estructura:
type
tTitulo = String[50];
tArchRevistas = file of tTitulo ;
Las bajas se realizan apilando registros borrados y las altas reutilizando registros
borrados. El registro 0 se usa como cabecera de la pila de registros borrados: el 
número 0 implica que no hay registros borrados y N indica que el próximo registro a
reutilizar es el N, siendo éste un número relativo de registro válido.
a. Implemente el siguiente módulo:
Abre el archivo y agrega el título de la revista, recibido como
parámetro manteniendo la política descripta anteriormente
procedure agregar (var a: tArchRevistas ; titulo: string);
b. Liste el contenido del archivo omitiendo las revistas eliminados. Modifique lo que
considere necesario para obtener el listado.
}
program Ej4;
const
    valorAlto = 'ZZZZ';
type
    tTitulo = String[50];
    tArchRevistas = file of tTitulo ;
//__________________________________________
procedure CrearConTexto(var m:tArchRevistas);
var
	carga: text;
	a: tTitulo;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
	    readln(carga, a);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//__________________________________________
procedure Leer(var archivo:tArchRevistas; var dato:tTitulo);
begin
    if(not EOF(archivo)) then
        read(archivo,dato)
    else
        dato:=valoralto;
end;
//__________________________________________
procedure agregar(var t:tArchRevistas; titulo:tTitulo);
var
    nro:integer;
    nroString,aux:tTitulo;
begin
    Reset(t);
    Leer(t,nroString);
    Val(nroString,nro); //Leo la cabecera y lo convierto a entero
    if (nro <> 0) then
    begin
        Seek(t,nro); Read(t,aux);              //Me posiciono en la cabecera y me quedo con lo que tenia
        Seek(t,FilePos(t)-1); Write(t,titulo); //Agrego el dato en el lugar que tenia una baja 
        Seek(t,0);   Write(t,aux);             //Guardo el dato en aux
    end
    else
        begin
            Seek(t,FilePos(t)); Write(t,aux); //Agrego al final del todo
        end;
    Close(t);
end;
//__________________________________________
procedure listado(var m:tArchRevistas);
var
	t:tTitulo;
    tInt:Integer;
begin
	assign(m,'maestro.data');
	reset(m);
	leer(m,t);
    WriteLn('Los titulos que no se borraron');
	while (t <> valoralto) do begin
        Val(t,tInt);
        if (tInt <> 0) then
            WriteLn(tInt);
        leer(m,t);
	end;
	close(m);
end;
var
    titulo:tTitulo;
    t:tArchRevistas;
begin
    titulo:='Hola';
    CrearConTexto(t);
    agregar(t,titulo);
    listado(t);
end.