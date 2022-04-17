{14. Una compañía aérea dispone de un archivo maestro donde guarda información sobre sus
próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida y la
cantidad de asientos disponibles. La empresa recibe todos los días dos archivos detalles para
actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida y
cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino más
fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada uno del
maestro. Se pide realizar los módulos necesarios para:
g. Actualizar el archivo maestro sabiendo que no se registró ninguna venta de pasaje
sin asiento disponible.
h. Generar una lista con aquellos vuelos (destino y fecha y hora de salida) que tengan
menos de una cantidad específica de asientos disponibles. La misma debe ser
ingresada por teclado.
NOTA: El archivo maestro y los archivos detalles sólo pueden recorrerse una vez}
program Ej14;
const 
    valorAlto = 'ZZZ';
type
    cadena20 = string[20];
    maestroR = record
        destino:cadena20;
        fecha:integer;
        hora:integer;
        asientosD:Integer;
    end;
    detalleR = record
        destino:cadena20;
        fecha:Integer;
        hora:integer;
        asientosC:Integer;
    end;
    maestro = file of maestroR;
    detalle = file of detalleR;
//_________________________________________________
procedure importarMaestro(var m:maestro);
var
	carga: text;
	a: maestroR;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); Reset(carga);
	while(not eof(carga))do begin
	    with a do readln(carga, destino);
        with a do readln(carga, fecha, hora);
        with a do readln(carga, asientosD);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//_________________________________________________
procedure importarDetalle1(var d1:detalle);
var
	carga: text;
	a: detalleR;
begin
	assign(d1,'detalle1.data');
	assign(carga,'detalle1.txt');
	rewrite(d1); Reset(carga);
	while(not eof(carga))do begin
	    with a do readln(carga, destino);
        with a do readln(carga, fecha, hora);
        with a do readln(carga, asientosC);
	    write(d1,a);
	end;
	close(d1); close(carga);
end;
procedure importarDetalle2(var d2:detalle);
var
	carga: text;
	a: detalleR;
begin
	assign(d2,'detalle2.data');
	assign(carga,'detalle2.txt');
	rewrite(d2); Reset(carga);
	while(not eof(carga))do begin
	    with a do readln(carga, destino);
        with a do readln(carga, fecha, hora);
        with a do readln(carga, asientosC);
	    write(d2,a);
	end;
	close(d2); close(carga);
end;
//_________________________________________________
procedure leer (var archivo: detalle; var x:detalleR);
begin
    if (not eof(archivo))then 
        read (archivo,x)
    else 
        x.destino := valoralto;
end;

procedure minimo (var r1,r2:detalleR;var d1,d2:detalle; var min:detalleR);
begin
    if (r1.destino<=r2.destino)  then 
    begin
        min := r1;  leer(d1,r1)
    end
    else 
    begin
        min := r2; leer(d2,r2)
    end
end;

procedure actualizarMaestro(var m:maestro;var d1,d2:detalle);
Var   
    x: maestroR;  
    min, r1, r2: detalleR; 
begin
    assign (m, 'maestro.data');    reset (m); 
    assign (d1, 'detalle1.data');  reset (d1);  leer(d1, r1); 
    assign (d2, 'detalle2.data');  reset (d2);  leer(d2, r2); 
    minimo(r1, r2, d1, d2,min);
    while (min.destino <> valoralto) do  
    begin
        read(m,x);
        while (x.destino <> min.destino) do Read(m,x);
        while (x.destino = min.destino ) do 
        begin
            while (x.fecha <> min.fecha) do Read(m,x);
            while (x.destino = x.destino) and (x.fecha = min.fecha) do
            begin
                while (x.hora <> min.hora) do Read(m,x);
                while (x.destino = min.destino ) and (x.fecha = min.fecha) and (x.hora = min.hora) do
                begin
                    x.asientosD:=x.asientosD + min.asientosC; //Aca tengo la duda de si los asientos los tengo que sumar o restar, ya que son asientos comprados 
                    minimo(r1, r2, d1, d2,min);
                end;
            end;
        end;
        seek (m, filepos(m)-1);
        write(m,x);
    end;
    Close(m);
    Close(d1);
    Close(d2);
end;
//_________________________________________________
procedure exportarMaestro(var x: maestro);
var
	carga:text;
	datox: maestroR;
begin
	assign(carga,'listado.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,destino,' ',fecha, ' ', hora, ' ', asientosD);
	end;
	close(x); close(carga);
end;
//_________________________________________________
var
    m:maestro;
    d1,d2:detalle;

begin
    importarMaestro(m);
    importarDetalle1(d1);
    importarDetalle2(d2);
  
end.