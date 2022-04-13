{7- El encargado de ventas de un negocio de productos de limpieza desea administrar el stock
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los
productos que comercializa. De cada producto se maneja la siguiente información: código de
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se genera un archivo detalle donde se registran todas las ventas de productos realizadas. De cada
venta se registra: código de producto y cantidad de unidades vendidas. Se pide realizar un
programa con opciones para:
a. Crear el archivo maestro a partir de un archivo de texto llamado “productos.txt”.
b. Listar el contenido del archivo maestro en un archivo de texto llamado “reporte.txt”,
listando de a un producto por línea.
c. Crear un archivo detalle de ventas a partir de en un archivo de texto llamado
“ventas.txt”.
d. Listar en pantalla el contenido del archivo detalle de ventas.
e. Actualizar el archivo maestro con el archivo detalle, sabiendo que:
● Ambos archivos están ordenados por código de producto.
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del
archivo detalle.
● El archivo detalle sólo contiene registros que están en el archivo maestro.
f. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo
stock actual esté por debajo del stock mínimo permitido.
}
program Ej7;
const valoralto = 9999;
type
    cadena20 = string[20];
    maestroR = record
        codigo:integer;
        nombre:cadena20;
        precio:real;
        stock:integer;
        stockM:Integer;
    end;
    detalleR = record 
        codigo:Integer;
        ventas:integer;
    end;
    maestro = file of maestroR;
    detalle = file of detalleR;
//__________________________________________________________________
procedure importarMaestro(var mae: maestro);
var
	carga: text;
	p: maestroR;
begin
	assign(mae,'maestro.data'); 
	assign(carga,'productos.txt');
	reset(carga); rewrite(mae);
	while(not eof(carga))do begin
		with p do readln(carga, codigo, precio, stock, stockM,nombre);
		write(mae,p);
	end;
	close(mae); close(carga);
end;
//__________________________________________________________________
procedure exportarMaestro(var mae: maestro);
var
	carga: text;
	p: maestroR;
begin
	assign(mae,'maestro.data');
	assign(carga,'reporte.txt');
	reset(mae); rewrite(carga);
	while(not eof(mae))do begin
		read(mae,p);
		with p do writeln(carga,' ',codigo,' ',nombre,' ',precio,' ',stock,' ',stockM);
	end;
	close(mae); close(carga);
end;
//__________________________________________________________________
procedure importarDetalle(var det:detalle);
var
	carga:text;
	p: detalleR;
begin
	assign(det, 'detalle.data');
	assign(carga, 'ventas.txt');
	rewrite(det); reset(carga);
	while(not eof(carga))do begin
		with p do readln(carga,codigo,ventas);
		write(det,p);
	end;
	close(det); close(carga);
end;
//__________________________________________________________________
procedure listarDetalle(var det: detalle);
var
	p: detalleR;
begin
	assign(det,'detalle.data');
	reset(det);
	while(not eof(det))do begin
		read(det,p);
		writeln('- Cod: ',p.codigo,' / Cantidad de ventas: ', p.ventas); 
	end;
	close(det);
end;

//__________________________________________________________________
procedure leer(var arch:detalle; var dato:detalleR);
begin
	if(not eof(arch))then read(arch,dato)
		else dato.codigo:=valoralto;
end;
procedure actualizarMaestro(var mae: maestro; var det:detalle);
var
	regd: detalleR;
	regm: maestroR;
	aux,acu: integer;
begin
	assign(mae,'maestro.data'); assign(det,'detalle.data');
	reset(mae); reset(det);
	leer(det, regd);
	read(mae,regm);
	while(regd.codigo <> valoralto)do begin
		aux:= regd.codigo;
		acu:=0;
		while(aux = regd.codigo)do begin //como pueden haber mas de 1 reg con el mismo cod acumulo todas las ventas
			acu:=acu + regd.ventas;
			leer(det,regd);
		end;
		//cuando termino de acumular busco el codigo en el maestro
		while(regm.codigo <> aux) do read(mae,regm);
		regm.stock:= regm.stock - acu;
		seek(mae, filepos(mae)-1);
		write(mae,regm);
	end;
	close(det);close(mae);
end;
//__________________________________________________________________
procedure ListarStockMinimo(var mae:maestro);
var
	p: maestroR;
	carga:text;
begin
	assign(mae,'maestro.data');
	assign(carga,'stock_minimo.txt');
	reset(mae); rewrite(carga);
	while(not eof(mae))do begin
		read(mae,p);
		if p.stock < p.stock then 
            writeln(carga,' ',p.codigo,' ',p.nombre,' ',p.stock,' ',p.stockM);
	end;
	close(mae); close(carga);
end;
//__________________________________________________________________
var
    m:maestro;
    d:detalle;
    opcion:integer;
begin
    opcion:=0;
    while opcion < 7 do
    begin
        WriteLn('Menu');
        WriteLn('1) Importar Maestro');
        writeln('2) Exportar Maestro.');
        WriteLn('3) Importar Detalle');
        writeln('4) Exportar Detalle.');
        WriteLn('5) Actualizar archivo Maestro Detalle');
        WriteLn('6) Exportar Stock Minimo');

        ReadLn(opcion);
        case opcion of
            1: importarMaestro(m);
            2: exportarMaestro(m);
            3: importarDetalle(d);
            4: listarDetalle(d);
            5: actualizarMaestro(m,d);
            6: ListarStockMinimo(m);
        end;
    end;
end.