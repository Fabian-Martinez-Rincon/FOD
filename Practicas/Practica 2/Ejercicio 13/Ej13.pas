{13. Suponga que usted es administrador de un servidor de correo electrónico. En los logs del
mismo (información guardada acerca de los movimientos que ocurren en el server) que se
encuentra en la siguiente ruta: /var/log/logmail.dat se guarda la siguiente información:
nro_usuario, nombreUsuario, nombre, apellido, cantidadMailEnviados. Diariamente el servidor
de correo genera un archivo con la siguiente información: nro_usuario, cuentaDestino,
cuerpoMensaje. Este archivo representa todos los correos enviados por los usuarios en un día
determinado. Ambos archivos están ordenados por nro_usuario y se sabe que un usuario
puede enviar cero, uno o más mails por día.
a- Realice el procedimiento necesario para actualizar la información del log en
un día particular. Defina las estructuras de datos que utilice su procedimiento.
b- Genere un archivo de texto que contenga el siguiente informe dado un archivo
detalle de un día determinado:
nro_usuarioX…………..cantidadMensajesEnviados
………….
nro_usuarioX+n………..cantidadMensajesEnviados
Nota: tener en cuenta que en el listado deberán aparecer todos los usuarios que
existen en el sistema.}
program Ej13;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    maestroR = record
        nro_usuario:integer;
        nombreUsuario:cadena20;
        nombre:cadena20;
        apellido:cadena20;
        cantidadMailEnviados:integer;
    end;
    detalleR = record
        nro_usuario:Integer;
        cuentaDestino:cadena20;
        cuerpoMensaje:string;
    end;
    maestro = file of maestroR;
    detalle = file of detalleR;
//_____________________________________________
procedure CrearMaestro(var m:maestro);
var
	carga: text;
	a: maestroR;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); Reset(carga);
	while(not eof(carga))do begin
		with a do readln(carga, nro_usuario,nombreUsuario);
        with a do readln(carga, nombre, apellido);
        with a do readln(carga, cantidadMailEnviados);
		write(m,a);
	end;
	close(m); close(carga);
end;
//_____________________________________________
procedure leerDatos(var d:detalleR);
begin
    write('Numero de usuario: '); readln(d.nro_usuario);
    if d.nro_usuario <> valoralto then 
    begin
        write('Destinatario: '); readln(d.cuentaDestino);
        write('Mensaje: '); readln(d.cuerpoMensaje);
    end;
end;
procedure CrearDetalle(var det:detalle);
var
	d: detalleR;
begin
	assign(det,'detalle.data');
	rewrite(det);
	writeln('Escriba el nro 9999 para terminar la carga.');
	leerDatos(d);
	while(d.nro_usuario <> valoralto)do begin
		write(det,d);
		leerDatos(d);
	end;
	close(det);
end;
//_____________________________________________
procedure leer(var det:detalle; var dato:detalleR);
begin
	if not eof(det)then 
		read(det,dato)
	else 
		dato.nro_usuario:=9999;
end;
//_____________________________________________
procedure actualizar(var m:maestro; var d:detalle);
var
	datoD:detalleR;
	datoM:maestroR;
	aux,acu: integer;
begin
	reset(m); reset(d);
	leer(d,datoD);
	while(datoD.nro_usuario <> valoralto)do begin
		aux:= datoD.nro_usuario;
		acu:=0;
		while(aux = datoD.nro_usuario)do begin //como pueden haber mas de 1 reg con el mismo cod acumulo todas las ventas
			acu:=acu+1;
			leer(d,datoD);
		end;
		//cuando termino de acumular busco el codigo en el maestro
		while(datoM.nro_usuario <> aux) do 
            read(m,datoM);
		datoM.cantidadMailEnviados:= datoM.cantidadMailEnviados + acu;
		seek(m, filepos(m)-1);
		write(m,datoM);
	end;
	close(m); close(d);
end;
//_____________________________________________
procedure exportar(var x: maestro);
var
	carga:text;
	datox: maestroR;
begin
	assign(carga,'archivoDetDia.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,nro_usuario,' ',cantidadMailEnviados);
	end;
	close(x); close(carga);
end;
//_____________________________________________
var
    m:maestro;
    d:detalle;
begin
    CrearMaestro(m);
    CrearDetalle(d);
    actualizar(m,d);
    exportar(m);
end.