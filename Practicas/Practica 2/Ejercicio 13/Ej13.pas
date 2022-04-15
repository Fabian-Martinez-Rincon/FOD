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
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
		with a do readln(carga, nro_usuario,nombreUsuario);
        with a do readln(carga, nombre, apellido);
        with a do readln(carga, cantidadMailEnviados);
		write(m,a);
	end;
	close(m); close(carga);
end;
//_____________________________________________
var
    m:maestro;
    d:detalle;
begin
    CrearMaestro(m);
end.