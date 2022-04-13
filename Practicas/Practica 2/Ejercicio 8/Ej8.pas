{8. Se cuenta con un archivo que posee información de las ventas que realiza una empresa a
los diferentes clientes. Se necesita obtener un reporte con las ventas organizado por cliente.
Para ello, se deberá informar por pantalla: los datos   personales del cliente, el total mensual
(mes por mes cuánto compró) y finalmente el monto total comprado en el año por el cliente.
Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido por la
empresa.
El formato del archivo maestro está dado por: cliente (cod cliente, nombre y apellido), año, mes,
día y monto de la venta.
El orden del archivo está dado por: cod cliente, año y mes.
Nota: tenga en cuenta que puede haber meses en los que los clientes no realizaron compras.}
program Ej8;
const
    valoralto = 9999;
type
    anios = 2000..2022;
    meses = 1..12;
    dias = 1..31;
    cadena20 = string[20];
    datos = record
        codigo:integer;
        nombre:cadena20;
        apellido:cadena20;
    end;
    maestroR = record
        cliente:datos;
        anio:anios;
        mes:meses;
        dia:dias;
        monto:real;
    end;
    maestro = file of maestroR;
//__________________________________________________________
procedure ImportarMaestro(var m:maestro);
var
    carga:text;
    dato:maestroR;
begin
    Assign(m,'maestro.data');
    Assign(carga,'datos2.txt');
    Rewrite(m);
    Reset(carga);
    while (not (Eof(carga))) do
    begin
        with dato do readln(carga, cliente.codigo, anio, mes, dia, cliente.nombre);
		with dato do readln(carga, monto, cliente.apellido);
        Write(m,dato);
    end;
    Close(m);
    Close(carga);
end;
//__________________________________________________________
procedure leer(var arch:maestro; var aux:maestroR);
begin
    if(not eof(arch))then 
		read(arch,aux)
    else 
		aux.cliente.codigo:=valorAlto;
end;
//__________________________________________________________
procedure generarReporte(var mae:maestro);
var
	v,actual:maestroR;
	totalMes: real;
	total: real;
begin
	assign(mae,'maestro.data');
	reset(mae);
	leer(mae,v);
	while (v.cliente.codigo <> valoralto) do begin
		actual:= v;
		writeln('----------------');
		writeln('Cliente numero: ', actual.cliente.codigo);
		writeln('DATOS PERSONALES'); 
		writeln('Nombre: ', actual.cliente.nombre,'- Apellido: ', actual.cliente.apellido);
		while(actual.cliente.codigo = v.cliente.codigo)do begin
			actual:=v;
			total:=0;
			while(actual.anio = v.anio)and(actual.cliente.codigo = v.cliente.codigo) do begin
				actual:=v;
				totalMes:=0;
				while(actual.mes = v.mes)and (actual.anio = v.anio)and(actual.cliente.codigo = v.cliente.codigo)do begin
					totalMes:= totalMes + v.monto;
					total:= total + v.monto;
					leer(mae,v);
				end;
				writeln('TOTAL DEL MES: ',actual.mes);
				writeln('$ ',totalMes:0:2);
			end;
			writeln('TOTAL DEL ANIO: ', actual.anio);
			writeln('$ ',total:0:2);
		end;
	end;
	close(mae);
end;
//__________________________________________________________
var
    m:maestro;
begin
    ImportarMaestro(m);
    generarReporte(m);
end.