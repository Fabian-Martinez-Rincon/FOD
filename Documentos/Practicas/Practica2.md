<h1 align="center">Practica 2</h1>

<h1 align="center">Fundamentos de Organización de Datos</h1>

[Archivos Secuenciales-Argorítmica Clásica]()

```1)``` Una empresa posee un archivo con información de los ingresos percibidos por diferentes empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado, nombre y monto de la comisión. La información del archivo se encuentra ordenada por código de empleado y cada empleado puede aparecer más de una vez en el archivo de comisiones. [Resolución](#Ejercicio_1)

Realice un procedimiento que reciba el archivo anteriormente descripto y lo compacte. En consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una única vez con el valor total de sus comisiones.

```
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez.
```

```2)``` Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias (cursadas) aprobadas sin final y cantidad de materias con final aprobado. Además, se tiene un archivo detalle con el código de alumno e información correspondiente a una materia (esta información indica si aprobó la cursada o aprobó el final). [Resolución](#Ejercicio_2)

Todos los archivos están ordenados por código de alumno y en el archivo detalle puede haber 0, 1 ó más registros por cada alumno del archivo maestro. Se pide realizar un programa con opciones para:

1) Crear el archivo maestro a partir de un archivo de texto llamado "alumnos.txt"
2) Crear el archivo detalle a partir de un archivo de texto llamado "detalle.txt" 
3) Listar el contenido del archivo maestro en un archivo de texto llamado "reporteAlumnos.txt"
4) Listar el contenido del archivo detalle en un archivo de texto llamado "reporteDetalle.txt"
5) Actualizar el archivo maestro de la siguiente manera:  
    i. Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado.

    ii. Si aprobó la cursada se ingrementa en uno la cantidad de materias aprobadas sin final.
6) Listar en un archivo de texto los alumnos que tengan más de cuatro materias con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos.

```
NOTA: Para la actualización del inciso e) los archivos deben ser recorridos sólo una vez.
```


```3)```  Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados. De cada producto se almacena: código del producto, nombre, descripción, stock disponible, stock mínimo y precio del producto. [Resolución](#Ejercicio_3)

Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo maestro. La información que se recibe en los detalles es: código de producto y cantidad vendida. Además, se deberá informar en un archivo de texto: nombre de producto, descripción, stock disponible y precio de aquellos productos que tengan stock disponible por debajo del stock mínimo.

```
NOTA: Todos los archivos se encuentran ordenados por código de productos. 
En cada detalle puede venir 0 o N registros de un determinado producto.

```

```4)``` Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma fue construida sobre una topología de red que conecta 5 máquinas entre sí y todas las máquinas se conectan con un servidor central. Semanalmente cada máquina genera un archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos: cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha, tiempo_total_de_sesiones_abiertas. [Resolución](#Ejercicio_4)

### ***NOTAS:***
-  Cada archivo detalle está ordenado por cod_usuario y fecha.
- Un usuario puede iniciar más  de una sesión el mismo dia en la misma o en diferentes máquinas.
- El archivo maestro debe crearse en la siguiente ubicación física: /var/log.

```5)``` A partir de un siniestro ocurrido se perdieron las actas de nacimiento y fallecimientos de toda la provincia de buenos aires de los últimos diez años. En pos de recuperar dicha información, se deberá procesar 2 archivos por cada una de las 50 delegaciones distribuidas en la provincia, un archivo de nacimientos y otro de fallecimientos y crear el archivo maestro reuniendo dicha información. [Resolución](#Ejercicio_5)

Los archivos detalles con nacimientos, contendrán la siguiente información: nro partida nacimiento, nombre, apellido, dirección detallada(calle,nro, piso, depto, ciudad), matrícula del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre.

En cambio los 50 archivos de fallecimientos tendrán: nro partida nacimiento, DNI, nombre y apellido del fallecido, matrícula del médico que firma el deceso, fecha y hora del deceso y lugar.

Realizar un programa que cree el archivo maestro a partir de toda la información los archivos. Se debe almacenar en el maestro: nro partida nacimiento, nombre, apellido, dirección detallada(calle,nro, piso, depto, ciudad), matrícula del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre y si falleció, además matrícula del médico que firma el deceso, fecha y hora del deceso y lugar. Se deberá, además, listar en un archivo de texto la información recolectada de cada persona.

```
NOTA: Todos los archivos están ordenados por nro de partido de nacimiento que es única.

Tenga en cuenta que no necesariamente va a fallecer en el distrito donde nació la persona 
y además puede no haber fallecido.
```

```6)``` Se cuenta con un archivo maestro con los artículos de una cadena de venta de indumentaria. De cada artículo se almacena: código del artículo, nombre, descripción,talle, color, stock disponible, stock mínimo y precio del artículo. [Resolución](#Ejercicio_6)

Se recibe diariamente un archivo detalle de cada una de las 15 sucursales de la cadena. Se debe realizar el procedimiento que recibe los 15 detalles y actualiza el stock del archivo maestro. La información que se recibe en los detalles es: código de artículo y cantidad vendida. Además, se deberá informar en un archivo de texto: nombre de artículo, descripción, stock disponible y precio de aquellos artículo que tengan stock disponible por debajo del stock mínimo.

```
Nota: todos los archivos se encuentran ordenados por código de artículo. En cada detalle
puede venir 0 o N registros de un determinado artículo.
```

```7)``` El encargado de ventas de un negocio de productos de limpieza desea administrar el stock de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los productos que comercializa. De cada producto se maneja la siguiente información: código de producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se genera un archivo detalle donde se registran todas las ventas de productos realizadas. De cada venta se registra: código de producto y cantidad de unidades vendidas. Se pide realizar un programa con opciones para: [Resolución](#Ejercicio_7)

1) Crear el archivo maestro a partir de un archivo de texto llamado ```productos.txt```
2) Listar el contenido del archivo maestro en un archivo de texto llamado ```reporte.txt``` listando de a un producto por línea.
3) Crear un archivo detalle de ventas a partir de un archivo de texto llamado ```ventas.txt```
4) Listar en pantalla el contenido del archivo detalle de ventas.
5) Actualizar el archivo maestro con el archivo detalle, sabiendo que:
   - Ambos archivos están ordenados por código de producto.
   - Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del archivo detalle.
   - El archivo detalle sólo contiene registros que están en el archivo maestro.
6) Listar en un archivo de texto llamado ```stock_minimo.txt``` aquellos productos cuyo stock actual esté por debajo del stock mínimo permitivo.

```8)``` Se cuenta con un archivo que posee información de las ventas que realiza una empresa a los diferentes clientes. Se necesita obtener un reporte con las ventas organizado por cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el cliente. [Resolución](#Ejercicio_8)

Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido por la empresa.

El formato del archivo maestro está dado por: cliente(cod cliente, nombre y apellido), año, mes, dia y monto de la venta.

El orden del archivo está dado por: cod cliente, año y mes

```
NOTA: Tenga en cuenta que puede haber meses en los que los clientes no realizaron compras.
```

```9)``` Se necesita contabilizar los votos de las diferentes mesas electorales registradas por provincia y localidad. Para ello, se posee un archivo con la siguiente información: código de provincia, código de  ocalidad, número de mesa y cantidad de votos en dicha mesa. Presentar en pantalla un listado como se muestra a continuación: [Resolución](#Ejercicio_9)

<div align="center"> 

![image](https://user-images.githubusercontent.com/55964635/159058137-cc3bbeae-fef2-4998-89ae-4e5f7e82c03d.png)

</div>

```NOTA: La información se encuentra ordenada por código de provincia y código de localidad.```

```10)``` Se tiene información en un archivo de las horas extras realizadas por los empleados de una empresa en un mes. Para cada empleado se tiene la siguiente información: departamento, división, número de empleado, categoría y cantidad de horas extras realizadas por el empleado. Se sabe que el archivo se encuentra ordenado por departamento, luego por división, y por último, por número de empleado. Presentar en pantalla un listado con el siguiente formato: [Resolución](#Ejercicio_10)

<div align="center"> 

![image (1)](https://user-images.githubusercontent.com/55964635/159059188-7d6fc458-2657-4c75-96d6-d1dc6257b910.png)

![image (2)](https://user-images.githubusercontent.com/55964635/159059364-63d401b3-283c-4b27-9f63-ca2454356474.png)

</div>

Para obtener el valor de la hora se debe cargar un arreglo desde un archivo de texto al iniciar el programa con el valor de la hora extra para cada categoría. La categoría varía de 1 a 15. En el archivo de texto debe haber una línea para cada categoría con el número de categoría y el valor de la hora, pero el arreglo debe ser de valores de horas, con la posición del valor coincidente con el número de categoría.

```11)``` A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos necesarios para actualizar el archivo maestro a partir de los dos archivos detalle. [Resolución](#Ejercicio_11)

```
NOTA: Los archivos están ordendaos por nombre de provincia y en los archivos detalle pueden 
venir 0, 1 ó más registros por cada provincia.
```

```12)``` La empresa de software ```X``` posee un servidor web donde se encuentra alojado el sitio de la organización. En dicho servidor, se almacenan en un archivo todos los accesos que se realizan al sitio. [Resolución](#Ejercicio_12)

La información que se almacena en el archivo es la siguiente: año, mes, dia, idUsuario y tiempo de acceso al sitio de la organización. El archivo se encuentra ordenado por los siguientes criterios: año, mes, dia e idUsuario.

Se debe realizar un procedimiento que genere un informe en pantalla, para ello se indicará el año calendario sobre el cual debe realizar el informe. El mismo debe respetar el formato mostrado a continuación:

<div align="center"> 

![image (3)](https://user-images.githubusercontent.com/55964635/159060007-af6c5904-ae49-4462-ba9c-f47bd99501f4.png)

</div>

Se deberá tener en cuenta las siguientes aclaraciones:
- El año sobre el cual realizará el informe de accesos debe leerse desde teclado.
- El año puede no existir en el archivo, en tal caso, debe informarse en pantalla ``año no entontrado``.
- Debe definir las estructuras de datos necesarias.
- El recorrido del archivo debe realizarse una única vez procesando sólo la información necesaria

```13)``` Suponga que usted es administrador de un servidor de correo electrónico. En los logs del mismo (información guardada acerca de los movimientos que ocurren en el server) que se encuentra en la siguiente ruta: /var/log/logmail.dat se guarda la siguiente información: nro_usuario, nombreUsuario, nombre, apellido, cantidadMailEnviados. Diariamente el servidor de correo genera un archivo con la siguiente información: nro_usuario, cuentaDestino, cuerpoMensaje. Este archivo representa todos los correos enviados por los usuarios en un día determinado. Ambos archivos están ordenados por nro_usuario y se sabe que un usuario puede enviar cero, uno o más mails por día. [Resolución](#Ejercicio_13)

<div align="center"> 

![image (4)](https://user-images.githubusercontent.com/55964635/159061781-06667401-7459-43ea-9b04-5886eb32786e.png)
</div > 

```14)``` Una compañía aérea dispone de un archivo maestro donde guarda información sobre sus próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida y la cantidad de asientos disponibles. La empresa recibe todos los días dos archivos detalles para actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida y cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino más fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada uno del maestro. Se pide realizar los módulos necesarios para: [Resolución](#Ejercicio_14)

- Actualizar el archivo maestro sabiendo que no se registró ninguna venta de pasaje sin asiento disponible.
- Generar una lista con aquellos vuelos (destino, fecha y hora de salida) que tengan menos de una cantidad específica de asientos disponibles. La misma debe ser ingrasada por teclado.

```
NOTA: El archivo maestro y los archivos detalles sólo pueden recorrerse una vez.
```

```15)``` En la facultad de Ciencias Jurídicas existe un sistema a través del cual los alumnos del posgrado tienen la posibilidad de pagar las carreras en RapiPago. Cuando el alumno se inscribe a una carrera, se le imprime una chequera con seis códigos de barra para que pague las seis cuotas correspondientes. Existe un archivo que guarda la siguiente información de los alumnos inscriptos: dni_alumno, codigo_carrera y monto_total_pagado. [Resolución](#Ejercicio_15)

Todos los días RapiPago manda N archivos con información de los pagos realizados por los alumnos en las N sucursales. Cada sucursal puede registrar cero, uno o más pagos y un alumno puede pagar más de una cuota el mismo día. Los archivos que manda RapiPago tienen la siguiente información: dni_alumno, codigo_carrera, monto_cuota.

1) Se debe realizar un procedimiento que dado el archivo con información de los alumnos inscriptos y los N archivos que envía RapiPago, actualice la información de lo que ha pagado cada alumno hasta el momento en cada carrera inscripto

2)  Realice otro procedimiento que reciba el archivo con información de los alumnos inscriptos y genere un archivo de texto con los alumnos que aún no han pagado nada en las carreras que están inscriptos. El archivo de texto debe contener la siguiente información: dni_alumno, código_carrera y la leyenda “alumno moroso”. La organización de la información del archivo de texto debe ser tal de poder utilizarla en una futura importación de datos **realizando la cantidad mínima de lecturas.**

### **PRECONDICIONES:**
- Cada alumno puede estar inscripto en una o varias carreras.
- Todos los archivos están ordenados, promero por ``dni_alumno`` y luego por ``codigo_carrera``.
- En los archivos que envían **RapiPago** hay información de pagos de alumnos que si o si existen en el archivo de inscriptos.

```
NOTA: Para ambos incisos debe definir todas las estructuras de datos utilizadas
```

```16)``` La editorial X, autora de diversos semanarios, posee un archivo maestro con la información correspondiente a las diferentes emisiones de los mismos. De cada emisión se registra: fecha, código de semanario, nombre del semanario, descripción, precio, total de ejemplares y total de ejemplares vendido. [Resolución](#Ejercicio_16)

Mensualmente se reciben 100 archivos detalles con las ventas de los semanarios en todo el país. La información que poseen los detalles es la siguiente: fecha, código de semanario y cantidad de ejemplares vendidos. Realice las declaraciones necesarias, la llamada al procedimiento y el procedimiento que recibe el archivo maestro y los 100 detalles y realice la actualización del archivo maestro en función de las ventas registradas. Además deberá informar fecha y semanario que tuvo más ventas y la misma información del semanario con menos ventas.

```
NOTA: Todos los archivos están ordenados por fecha y código de semanario. 
No se realizan ventas de semanarios si no hay ejemplares para hacerlo
```

```17)``` Una concesionaria de la Ciudad de Brandsen de marca Ford, posee un archivo de vehículos que tienen a la venta, de cada vehículo se registra: código, nombre, descripción,modelo , stock actual. Mensualmente se reciben dos archivos detalles con información de las ventas de cada uno de los dos empleados que trabajan en la firma. De cada archivo se dispone de la siguiente información: código de vehiculo, precio y fecha de la venta. Se debe realizar un proceso que actualice el stock del archivo maestro desde los archivos detalles. Además se debe informar que vehículo fue el más vendido. [Resolución](#Ejercicio_17)

```
NOTA 1: Todos los archivos están ordenados por código de vehículo y 
el archivo maestro debe ser recorrido sólo una vez y en forma simultánea con los detalles.
```

```18)```  Suponga que cuenta con un archivo con información acerca de las ventas de diferentes eventos de un teatro de la ciudad de La Plata. Dicho archivo tiene la siguiente estructura: nombreEvento, fechaFuncion , SectorFuncion(General, platea, etc), y cantidadEntradasVendidas por sector. Además se conoce que la información del archivo está ordenada primero por nombreEvento y luego por fechaFuncion. [Resolución](#Ejercicio_18)

Escriba un programa (Programa principal, estructuras y módulos) que dado el archivo descripto, realice un informe por pantalla con el siguiente formato:

<div align="center"> 

![image (5)](https://user-images.githubusercontent.com/55964635/159064786-2721f2ad-7faf-4929-a570-9fcee3ba302b.png)

![image (6)](https://user-images.githubusercontent.com/55964635/159065023-d70eb806-1ecf-459f-9af1-96b5b550e1e4.png)


</div>


Ejercicio_1
===========
```Pas
program Ej1;
const
    valoralto = 9999;
type
    cadena20=string[20];
    empleado = record
        codigo:integer;
        nombre:cadena20;
        monto:real;
    end;
    archivo = file of empleado;
//_____________________________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	emp: empleado;
begin
	writeln('Nombre del archivo fisico: ');
	assign(arch_logico,arch_fisico);
	assign(carga, 'empleados.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		readln(carga, emp.codigo);
        readln(carga, emp.nombre);
        readln(carga, emp.monto);
		write(arch_logico, emp);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure Imprimir(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        WriteLn('Codigo:',emp.codigo);
        writeln('Nombre:', emp.nombre);
        writeln('Monto:', emp.monto:2:2);
        WriteLn('_________');
	end;
	close(arch_logico);
end;
//_____________________________________________________________
procedure leer (var detalle:archivo;var dato:empleado);
begin
    if (not eof(detalle))
        then read (detalle,dato)
    else 
        dato.codigo := valoralto;
end;
//_____________________________________________________________
var
    maestro,detalle:archivo;
    fisico:cadena20;
    regDetalle,regMaestro:empleado;
    total:Real;
    act:empleado;
begin
    fisico := 'detalle_uno'; 
    CrearArchivo(detalle,fisico);
    Imprimir(detalle);
    assign (maestro, 'maestro_uno');
    Rewrite (maestro);  reset (detalle);
    leer(detalle,regDetalle);  
    while (regDetalle.codigo <> 9999) do 
    begin
        total:=0;
        act:=regDetalle;  
        while (act.codigo = regDetalle.codigo) do 
        begin
            total:=total+regDetalle.monto;        
            leer(detalle,regDetalle);          
        end;
        regMaestro.codigo:=act.codigo;
        regMaestro.nombre:=act.nombre;
        regMaestro.monto:=total;
        seek (maestro, filepos(maestro));
        write(maestro,regMaestro);
    end;
    writeln();
    Imprimir(maestro);
end.
```
Ejercicio_2
===========
```Pas
program Ej2;
type
    cadena20 = string[20];
    alumno = record
        codigo:integer;
        apellido:cadena20;
        nombre:cadena20;
        aprobadas:integer;
        promocionadas:integer;
    end;
    archivoMaestro = file of alumno;
	
	alumnoDetalle = record
		codigo:integer;
		nombre:cadena20;
		final_Calificacion:char;
		cursada_Calificacion:char;
	end;
	archivoDetalle = file of alumnoDetalle;
//_____________________________________________________________
procedure CrearArchivoMaestro(var arch_logico:archivoMaestro);
var
	carga: text;
	alum: alumno;
begin
	assign(arch_logico,'maestro.data');
	assign(carga, 'alumnos.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		readln(carga, alum.codigo);
        readln(carga, alum.apellido);
        readln(carga, alum.nombre);
        readln(carga, alum.aprobadas);
        ReadLn(carga, alum.promocionadas);
		write(arch_logico, alum);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure Imprimir(var arch_logico:archivoMaestro);
var
    alum:alumno;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, alum);
        WriteLn('Codigo:',alum.codigo);
        writeln('Nombre:', alum.nombre);
        WriteLn('_________');
	end;
	close(arch_logico);
end;
//_____________________________________________________________
procedure CrearArchivoDetalle(var arch_logico:archivoDetalle);
var
	carga: text;
	alum: alumnoDetalle;
begin
	assign(arch_logico,'detalle.data');
	assign(carga, 'detalle.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with alum do readln(carga, codigo, nombre);
		with alum do readln(carga, final_Calificacion);
		with alum do readln(carga, cursada_Calificacion);
		write(arch_logico, alum);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure ListarArchivoMaestro(var arch_logico:archivoMaestro);
var
	carga: text;
	alum: alumno;
begin
	assign(carga, 'reporteAlumnos.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,alum);
		with alum do
			writeln(carga,' ',codigo,' ',apellido,' ',nombre,' ', aprobadas,' ', promocionadas);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_____________________________________________________________
procedure ListarArchivoDetalle(var arch_logico:archivoDetalle);
var
	carga: text;
	alum: alumnoDetalle;
begin
	assign(carga, 'reporteDetalle.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,alum);
		with alum do
			writeln(carga,' ',codigo,' ',nombre,' ', final_Calificacion,' ', cursada_Calificacion);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_____________________________________________________________
procedure leer(var arch:archivoDetalle; var dato:alumnoDetalle);
begin
	if(not eof(arch))then read(arch,dato)
		else dato.codigo:=9999;
end;

//_____________________________________________________________
procedure ActualizarMaestro(var maestro:archivoMaestro; var detalle:archivoDetalle);
var
	regMaestro:alumno;
	regDetalle:alumnoDetalle;
	actual:integer;
	final,cursada:integer;
begin
	Reset(maestro);
	Reset(detalle);
	Read(maestro,regMaestro);
	leer(detalle,regDetalle);
	while regDetalle.codigo <> 9999 do
	begin
		final:=0;
		cursada:=0;
		actual:=regDetalle.codigo;
		while actual = regDetalle.codigo do
		begin
			if regDetalle.final_Calificacion = 'A' then
				final:=final+1;
			if regDetalle.cursada_Calificacion = 'A' then
				cursada:=cursada+1;
			leer(detalle,regDetalle);
		end;
		while (regMaestro.codigo <> actual) do 
			Read(maestro,regMaestro);
		regMaestro.aprobadas:=regMaestro.aprobadas+cursada;
		regMaestro.promocionadas:=regMaestro.promocionadas+final;
		Seek(maestro, FilePos(maestro)-1);
		Write(maestro,regMaestro);
		if (not eof(maestro)) then read(maestro,regMaestro);
	end;
	Close(maestro);
	Close(detalle)
end;
//_____________________________________________________________
procedure ListarMasDeCuatro(var maestro:archivoMaestro);
var
	carga:text;
	alum:alumno;
begin
	assign(carga, 'masDe4.txt');
	assign(maestro, 'maestro.data');
	Reset(maestro);
	Rewrite(carga);
	while (not eof(maestro)) do
	begin
		Read(maestro,alum);
		if((alum.promocionadas-alum.aprobadas)>=4) then //alum.aprobadas-alum.promocionadas Es asi pero lo hice de otra forma para probar
		begin
			with alum do
				WriteLn(carga, ' ', codigo, ' ',apellido, ' ', nombre, ' ',aprobadas,' ', promocionadas );
		end;
	end;
	close(maestro);
	close(carga);
end;
//_____________________________________________________________
var
    maestro:archivoMaestro;
	detalle:archivoDetalle;
    opcion:integer;
begin
    opcion:=0;
	while(opcion < 7) do begin
		writeln('1: Crear el archivoMaestro maestro a partir de un archivoMaestro de texto llamado "alumnos.txt"');
		writeln('2: Crear el archivoMaestro detalle a partir de un archivoMaestro de texto llamado "detalle.txt"');
		writeln('3: Listar el contenido del archivo maestro en un archivo de texto llamado "reporteAlumnos.txt".');
		writeln('4: Listar el contenido del archivo detalle en un archivo de texto llamado "reporteDetalle.txt"');
		WriteLn('5: Actualizar el archivo maestro');
		WriteLn('6: Alumnos que tengan más de cuatro materias con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos. ');
		readln(opcion);
		case opcion of 
			1:CrearArchivoMaestro(maestro);
			2:CrearArchivoDetalle(detalle);
			3:ListarArchivoMaestro(maestro);
			4:ListarArchivoDetalle(detalle);
			5:ActualizarMaestro(maestro,detalle);
			6:ListarMasDeCuatro(maestro);
		end;
	end;
end.
```
Ejercicio_3
===========
```Pas
program Ej3;
const 
    dimF = 30;
    valorAlto = 9999;
type
    rango = 1..dimF;
    cadena20 = string[20];
    producto = record
        codigo:integer;
        nombre:cadena20;
        descripcion:cadena20;
        stock_disponible:integer;
        stock_minimo:integer;
        precio:real;
    end;
    prodDetalle = record
        codigo:integer;
        cantidad_vendida:integer;
    end;

    archivo_Maestro = file of producto;
    archivo_Detalle = file of prodDetalle;

    
    vector_Detalle = array [rango] of archivo_Detalle;
    vector_Prod_Detalle = array [rango] of prodDetalle;
//____________________________________________________________
procedure importarMaestro(var maestro:archivo_Maestro);
var
    carga:text;
    p:producto;
begin
    assign(carga,'maestro.txt');
	assign(maestro,'maestro.data');
	rewrite(maestro); reset(carga);
    
    while(not eof(maestro)) do
    begin
        with p do readln(carga, codigo, precio, nombre);
        with p do readln(carga, stock_disponible, stock_minimo, descripcion);
        Write(maestro,p);
    end;
    Close(carga);
    Close(maestro);
end;
//____________________________________________________________
procedure Leer(var detalle:archivo_Detalle; var datoD:prodDetalle);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.codigo:=valorAlto;
end;
//____________________________________________________________
procedure buscar_Minimo(var min_Detalle:prodDetalle;var vDetalle:vector_Detalle;var vDetalle_Reg:vector_Prod_Detalle);
var
    i,minPos:integer;
begin
    min_Detalle.codigo:=9999;
    for i:=1 to dimF do begin
        if (vDetalle_Reg[i].codigo < min_Detalle.codigo) then begin
            min_Detalle:=vDetalle_Reg[i];
            minPos:=i;
        end;
    end;
    if (min_Detalle.codigo <> valorAlto) then
        Leer(vDetalle[minPos],vDetalle_Reg[minPos]);
end;
//____________________________________________________________
procedure actualizarMaestro(var maestro:archivo_Maestro;var vDetalle:vector_Detalle;var vDetalle_Reg:vector_Prod_Detalle);
var
    min_Maestro:producto;
    i:integer;
    min_Detalle:prodDetalle;
begin
    buscar_Minimo(min_Detalle,vDetalle,vDetalle_Reg);
    while (min_Detalle.codigo <> valorAlto) do //mientras el archivo detalle no termine
    begin
        read(maestro,min_Maestro);
        while (min_Maestro.codigo <> min_Detalle.codigo) do
            read(maestro,min_Maestro);
        while (min_Maestro.codigo = min_Detalle.codigo) do
        begin
            min_Maestro.stock_disponible:= min_Maestro.stock_disponible-min_Detalle.cantidad_vendida;
            buscar_Minimo(min_Detalle,vDetalle,vDetalle_Reg);
        end;
        seek(maestro,filepos(maestro)-1);
        Write(maestro,min_Maestro);
    end;
    Close(maestro);
end;
//____________________________________________________________
procedure Exportar_Txt(var maestro:archivo_Maestro);
var
    texto:text;
    dato:producto;
begin
    assign(maestro,'maestro.data');
    reset(maestro); 
    assign(texto,'reporteProductos.txt');
    rewrite(texto);
    while(not EOF(maestro)) do begin
        read(maestro,dato);
        with dato do begin
          writeln(texto,' ',codigo,' ',nombre);
          writeln(texto,' ',stock_disponible,' ',stock_minimo,' ',precio:5:2);
        end;
    end;
    close(texto);
    close(maestro);
end;
//____________________________________________________________
procedure Exportar_StockMin(var maestro:archivo_Maestro);
var
    texto:text;
    datos:producto;
begin
    Assign(maestro,'maestro.data');
    reset(maestro);
    Assign(texto,'menorStock.txt');
    Rewrite(texto);
    while (not EOF(maestro)) do
    begin
        Read(maestro,datos);
        if (datos.stock_disponible < datos.stock_minimo) then
        begin
            with datos do WriteLn(texto, ' ', codigo, ' ' , nombre);
            with datos do WriteLn(texto, ' ', stock_disponible, ' ' , stock_minimo, ' ', precio:5:2);
        end;
    end;
    Close(texto);
    Close(maestro);
end;
//____________________________________________________________
var
    vDetalle_Reg:vector_Prod_Detalle;
    vDetalle:vector_Detalle;
    i:integer;
    iString:cadena20; //Para poder crear los detalles
    maestro:archivo_Maestro;
begin
    
    importarMaestro(maestro);
    for i:=1 to dimF do
    begin
        Str(i,iString);
        Assign(vDetalle[i], 'detalle'+iString);
        Rewrite(vDetalle[i]);
        Leer(vDetalle[i],vDetalle_Reg[i]);
        Close(vDetalle[i]);
    end;
    Assign(maestro, 'maestro.data');
    Rewrite(maestro);
    actualizarMaestro(maestro,vDetalle,vDetalle_Reg);
    Exportar_Txt(maestro);
    Exportar_StockMin(maestro);
end.
```
Ejercicio_4
===========
```Pas
program Ej4;
const
    valorAlto = 9999;
    dimf = 5;         //Cantidad de maquinas
type
    cadena20 = string[20];
    regDetalle = record
        cod_usuario:integer;
        fecha:integer;
        tiempo_sesion:integer;
    end;
    regMaestro = record
        cod_usuario:integer;
        fecha:integer;
        tiempo_total_de_sesiones_abiertas:integer;
    end;

    archMaestro = file of regMaestro;
    archDetalle = file of regDetalle;

    vector_detalle_registro = array [1..dimf] of regDetalle;
    vector_detalle = array [1..dimf] of archDetalle;
//___________________________________________________
procedure Leer(var detalle:archDetalle; var datoD:regDetalle);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.cod_usuario:=valorAlto;
end;
//___________________________________________________
procedure minimo(var vDetalle:vector_detalle;var vDetalleR:vector_detalle_registro;var min:regDetalle);
var
    i,minPos:integer;
begin
    min.cod_usuario:=9999;
    min.fecha:=9999;
    for i:=1 to dimf do 
    begin
        if ((vDetalleR[i]).cod_usuario < min.cod_usuario) then
        begin
            if((vDetalleR[i]).fecha < min.fecha)then
            begin
                min:=vDetalleR[i];
                minPos:=i;
            end;
        end;
    end;
    if(min.cod_usuario <> 9999)then
        Leer(vDetalle[minPos],vDetalleR[minPos]);
end;
//___________________________________________________
procedure crearMestro(var vDetalle:vector_detalle;var vDetalleR:vector_detalle_registro;var maestro:archMaestro);
var
    min:regDetalle;
    actual:regMaestro;
    i:integer;
begin
    Assign(maestro, 'maestro.data');
    Rewrite(maestro);
    minimo(vDetalle,vDetalleR,min);
    while min.cod_usuario <> 9999 do
    begin
        actual.cod_usuario:=min.cod_usuario;
        while actual.cod_usuario = min.cod_usuario do
        begin
            actual.fecha:=min.fecha;
            actual.tiempo_total_de_sesiones_abiertas:=0;
            while (min.cod_usuario <> 9999) and (min.cod_usuario = actual.cod_usuario) and (min.fecha = actual.fecha) do
            begin
                actual.tiempo_total_de_sesiones_abiertas:= actual.tiempo_total_de_sesiones_abiertas + min.tiempo_sesion;
                minimo(vDetalle,vDetalleR,min);
            end;
            WriteLn(actual.cod_usuario, ' ', actual.fecha, ' ', actual.tiempo_total_de_sesiones_abiertas);
            Write(maestro,actual);
        end;
    end;
    Close(maestro);

end;
//___________________________________________________
var
    i:integer;
    iString:cadena20;
    vDetalleR:vector_detalle_registro;
    vDetalle:vector_detalle;
    maestro:archMaestro;
begin
    iString:='';
    for i := 1 to dimf do
    begin
        
        Str(i,iString);
        Assign(vDetalle[i], 'detalle'+iString);
        Rewrite(vDetalle[i]);
        Leer(vDetalle[i],vDetalleR[i]);
        Close(vDetalle[i]); 
    end;
    crearMestro(vDetalle,vDetalleR,maestro);
end.
```
Ejercicio_5
===========
```Pas
program Ej5;
const
    dimF = 5; //Tendira que ser 50
    valorAlto = 9999;
type
    cadena20 = string[20];
    direccion = record
        calle:integer;
        nro:integer;
        piso:integer;
        depto:integer;
        ciudad:cadena20;
    end;
    datos = record
        nombre:cadena20;
        apellido:cadena20;
        dni:cadena20;
    end;
    nacimiento = record
        nroNaci:integer;
        nombre:cadena20;
        apellido:cadena20;
        dir:direccion;
        matricula:integer;
        madre:datos;
        padre:datos;
    end;
    
    fallecimiento = record
        nroNaci:integer;
        dni:integer;
        nombre:cadena20;
        apellido:cadena20;
        matricula:integer; //Matricula del medico
        fecha:Integer;
        hora:integer;
        lugar:cadena20;
    end;
    
    RegFallecio = record
        matricula:integer;
        fecha:integer;
        hora:integer;
        lugar:cadena20;
    end;
    regMaestro = record
        nroNaci:integer;
        nombre:cadena20;
        apellido:cadena20;
        dir:direccion;
        matricula:Integer;
        madre:datos;
        padre:datos;
        siFallecio:RegFallecio;
    end;

    archNacimiento = file of nacimiento;
    nacimientos = array [1..dimF] of archNacimiento;
    nacimientoReg = array [1..dimF] of nacimiento;

    archFallecimiento = file of fallecimiento;
    fallecimientos = array [1..dimF] of archFallecimiento;
    fallecimientosReg = array [1..dimF] of fallecimiento; 

    archMaestro = file of regMaestro;
//________________________________________________________________________
procedure LeerN(var detalle:archNacimiento; var datoD:nacimiento);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.nroNaci:=valorAlto;
end;
//________________________________________________________________________
procedure LeerF(var detalle:archFallecimiento; var datoD:fallecimiento);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.nroNaci:=valorAlto;
end;
//________________________________________________________________________
procedure minimoN(var vN:nacimientos;var vNR:nacimientoReg;var minN:nacimiento);
var
    i,minPos:integer;
begin
    minN.nroNaci:=9999;
    for i:=1 to dimF do begin
        if (vNR[i].nroNaci < minN.nroNaci) then begin
            minN:=vNR[i];
            minPos:=i;
        end;
    end;
    if (minN.nroNaci <> valorAlto) then
        LeerN(vN[minPos],vNR[minPos]);
end;
//________________________________________________________________________
procedure minimoF(var vF:fallecimientos;var vNR:fallecimientosReg;var minF:fallecimiento);
var
    i,minPos:integer;
begin
    minF.nroNaci:=9999;
    for i:=1 to dimF do begin
        if (vNR[i].nroNaci < minF.nroNaci) then begin
            minF:=vNR[i];
            minPos:=i;
        end;
    end;
    if (minF.nroNaci <> valorAlto) then
        LeerF(vF[minPos],vNR[minPos]);
end;
//________________________________________________________________________
procedure cargarMaestroN(var actual:regMaestro;minN:nacimiento);
begin
    actual.nroNaci:=minN.nroNaci;
    actual.nombre:=minN.nombre;
    actual.apellido:=minN.apellido;
    actual.dir:=minN.dir;
    actual.matricula:=minN.matricula;
    actual.madre:=minN.madre;
    actual.padre:=minN.padre;
    //Como es de nacimiento supongo que los pongo en blanco de momento :(
    actual.siFallecio.matricula:=-1;
    actual.siFallecio.fecha:=-1;
    actual.siFallecio.hora:=-1;
    actual.siFallecio.lugar:=' ';

end;
//________________________________________________________________________
procedure cargarMaestroF(var actual:regMaestro;minF:fallecimiento);
begin
    actual.siFallecio.matricula:=minF.matricula;
    actual.siFallecio.fecha:=minF.fecha;
    actual.siFallecio.hora:=minF.hora;
    actual.siFallecio.lugar:=minF.lugar;
end;
//________________________________________________________________________
procedure crearMaestro(var maestro:archMaestro;var vN:nacimientos;var vNR:nacimientoReg;var vF:fallecimientos;var vFR:fallecimientosReg);
var
    actual:regMaestro;
    i:integer;
    minN:nacimiento; 
    minF:fallecimiento;
begin
    Assign(maestro, 'siniestro.data');
    Rewrite(maestro);
    minimoN(vN,vNR,minN);
    while (minN.nroNaci <> valorAlto) do
    begin
        cargarMaestroN(actual,minN);
        write(maestro,actual);
        minimoN(vN,vNR,minN);
    end;
    //Esto lo hago para volver al primer elemento y agregar si fallecieron
    for i:=1 to dimF do 
        close(vN[i]);
    Close(maestro); 
    Reset(maestro);
    minimoF(vF,vFR,minF);
    while (minF.nroNaci <> valorAlto) and (not Eof(maestro)) do
    begin
        while (actual.nroNaci <> minF.nroNaci) do
            Read(maestro,actual);
        cargarMaestroF(actual,minF);
        seek(maestro,FilePos(maestro)-1);
        Write(maestro,actual);
        minimoF(vF,vFR,minF);
    end;
    
    for i:=1 to dimF do 
        close(vF[i]);
    close(maestro);

end;
//________________________________________________________________________
procedure ExportarATxtMaestro(var archivoMae:archMaestro);
var
    texto:Text;
    r:regMaestro;
begin
    assign(archivoMae,'maestroSiniestro.data');
    Reset(archivoMae); //abro mi archivo binario
    assign(texto,'reporteSiniestros.txt');
    rewrite(texto); //creo mi archivo de texto
    while(not EOF(archivoMae)) do begin
        read(archivoMae,r);
        with r do begin
          writeln(texto,' ',nroNaci,' ',nombre,' ',apellido,' ',matricula);
        end;
    end;
    close(texto);
    close(archivoMae);
end;
//________________________________________________________________________
var
    i:integer;
    iString:cadena20;
    maestro:archMaestro;
    vN:nacimientos;     vNR:nacimientoReg;
    vF:fallecimientos;  vFR:fallecimientosReg;
begin
    for i:=1 to dimF do
    begin
        Str(i,iString);
        Assign(vN[i],'detalleN'+iString); Assign(vF[i],'detalleF'+iString);
        Reset(vN[i]);                     Reset(vF[i]);
        
        LeerN(vN[i],vNR[i]);              LeerF(vF[i],vFR[i]);
    end;
    crearMaestro(maestro,vN,vNR,vF,vFR);
    ExportarATxtMaestro(maestro);
end.
```
Ejercicio_6
===========
```Pas
program Ej6;
const
    dimF = 15;
    valoralto = 9999;
type
    cadena20 = string[20];
    articulo = record
        codigo:integer;
        nombre:cadena20;
        descripcion:cadena20;
        talle:integer;
        color:cadena20;
        stockD:integer;
        stockM:integer;
        precio:real;
    end;
    regDetalle = record
        codigo:integer;
        cantidad:integer;
    end;
    maestro = file of articulo;
    detalle = file of regDetalle;
    vecDetalle = array [1..dimF] of detalle;
    vecDetalleR = array [1..dimF] of regDetalle;
//__________________________________________________________________________
procedure Leer(var archivoDeta:detalle; var datoD:regDetalle);
begin
    if(not EOF(archivoDeta)) then
        read(archivoDeta,datoD)
    else
        datoD.codigo:=valoralto;
end;
//__________________________________________________________________________
procedure importarMaestro(var mae: maestro);
var
	carga: text;
	a: articulo;
begin
	assign(mae,'maestro.data');
	assign(carga,'Articulos.txt');
	rewrite(mae); reset(carga);
	while(not eof(carga))do begin
		with a do readln(carga, codigo, talle, nombre);
		with a do readln(carga, stockD, stockM, color);
		with a do readln(carga, precio, descripcion);
		write(mae,a);
	end;
	close(mae); close(carga);
end;
//__________________________________________________________________________
procedure minimo(var v:vecDetalle; var vr:vecDetalleR; var min:regDetalle);
var
    i,minPos:integer;
begin
    min.codigo:=9999;
    for i:=1 to dimF do begin
        if (vr[i].codigo < min.codigo) then begin
            min:=vr[i];
            minPos:=i;
        end;
    end;
    if (min.codigo <> valoralto) then
        Leer(v[minPos],vr[minPos]);
end;
//__________________________________________________________________________
procedure actualizarMaestro(var v:vecDetalle; var vr:vecDetalleR; var mae:maestro);
var
    regM:articulo;
    i:integer;
    min:regDetalle;
begin
	reset(mae);
    minimo(v,vr,min);//busco el codigo minimo entre los archivos detalles
    while (min.codigo <> valoralto) do begin //mientras el archivo detalle no termine
        read(mae,regM);
        while(regM.codigo <> min.codigo) do
            read(mae,regM);
        while(regM.codigo = min.codigo) do begin
            regM.stockD:=regM.stockD-min.cantidad;
            minimo(v,vr,min);
        end;
        seek(mae,filepos(mae)-1);
        write(mae,regM);
    end;
    close(mae);
    for i:=1 to dimF do begin
        close(v[i]);
    end;
end;
//__________________________________________________________________________
procedure ExportarATxtMaestro(var m:maestro);
var
    texto:Text;
    r:articulo;
begin
    assign(m,'maestro.data');
    reset(m); //abro mi archivo binario
    assign(texto,'articulosStockDispMin.txt');
    rewrite(texto); //creo mi archivo de texto
    while(not EOF(m)) do begin
        read(m,r);
        if r.stockD < r.stockM then 
			with r do begin
				writeln(texto,' ',nombre,' ',descripcion,' ',stockD,' ',precio);
			end;
    end;
    close(texto);
    close(m);
end;
//__________________________________________________________________________
var
    i:integer;
    iString:cadena20;
    vd:vecDetalle;
    vdr:vecDetalleR;
    m:maestro;
begin
    for i:=1 to dimF do 
    begin
        Str(i,iString);
        assign(vd[i],'detalle'+iString);
        Reset(vd[i]); 
        Leer(vd[i],vdr[i]);
    end;
    importarMaestro(m);
    actualizarMaestro(vd,vdr,m);
    ExportarATxtMaestro(m);
end.
```
Ejercicio_7
===========
```Pas
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
```
Ejercicio_8
===========
```Pas
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
```
Ejercicio_9
===========
```Pas
program Ej9;
const valorAlto = 9999;
type
    mesas = record
        codigoP:Integer;
        codigoL:integer;
        nro:integer;
        votos:integer;
    end;
    maestro = file of mesas;
//________________________________________________
procedure ImportarMaestro(var m:maestro);
var
    carga:text;
    dato:mesas;
begin
    Assign(m,'maestro.data');
    Assign(carga,'maestro.txt');
    Rewrite(m);
    Reset(carga);
    while (not (Eof(carga))) do
    begin
        with dato do readln(carga, codigoP, codigoL, nro, votos);
        Write(m,dato);
    end;
    Close(m);
    Close(carga);
end;
//________________________________________________
procedure leer(var arch:maestro; var aux:mesas);
begin
    if(not eof(arch))then 
		read(arch,aux)
    else 
		aux.codigoP:=valorAlto;
end;
//________________________________________________
procedure listado(var m:maestro);
var
	x,actual:mesas;
	totalMes: real;
	total: real;
    totalP,totalL:Integer;
begin
	assign(m,'maestro.data');
	reset(m);
	leer(m,x);
    total:=0;
	while (x.codigoP <> valoralto) do begin
		actual:= x;
        totalP:=0;
        WriteLn('___________');
		writeln('Codigo de Provincia: ', actual.codigoP);
		while(actual.codigoP = x.codigoP)do begin
			actual:=x;
			totalL:=0;
			while(actual.codigoL = x.codigoL)and(actual.codigoP = x.codigoP) do begin
                totalL:=totalL+x.votos;
                totalP:=totalP+x.votos;
                leer(m,x);
			end;
			writeln('Total de votos locales: ', totalL);
		end;
        writeln('Total de votos provinciales: ', totalP);
	end;
	close(m);
end;
//________________________________________________
var
    m:maestro;
begin
    importarMaestro(m);
    listado(m);
end.
```
Ejercicio_10
============
```Pas
program Ej10;
const
    dimF = 15;
    valorAlto = 9999;
type
    rango = 1..15;
    empleado = record
        departamento:Integer;
        division:integer;
        nro:integer;
        categoria:integer;
        horas_extras:integer;
    end;
    maestro = file of empleado;
    vector = array [rango] of integer; //Arreglos con valores de las horas extra
//_____________________________________________
procedure ImportarMaestro(var m:maestro);
var
    carga:text;
    dato:empleado;
begin
    Assign(m,'maestro.data');
    Assign(carga,'maestro.txt');
    Rewrite(m);
    Reset(carga);
    while (not (Eof(carga))) do
    begin
        with dato do readln(carga, departamento, division, nro, categoria, horas_extras);
        Write(m,dato);
    end;
    Close(m);
    Close(carga);
end;
//_____________________________________________
procedure CargarVector(var v:vector);
var
    i:integer;
begin
    for i:=0 to dimF do
    begin
        v[i]:=i;
    end;
end;
//_____________________________________________
procedure leer(var arch:maestro; var aux:empleado);
begin
    if(not eof(arch))then 
		read(arch,aux)
    else 
		aux.departamento:=valorAlto;
end;
//_____________________________________________
procedure listado(var m:maestro; v:vector);
var
    actualD,actualDiv,actualN,x:empleado;
    totalHD,montoTD:integer;
    totalHDiv,montoTDiv:Integer;
    TotalHs:integer;
    Importe:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);
    leer(m,x);
    while x.departamento <> valoralto do
    begin
        actualD:=x;
        totalHD:=0;
        montoTD:=0;
        WriteLn('___________________');
        WriteLn('Departamento: ', x.departamento);
        while x.departamento = actualD.departamento do
        begin
            actualDiv:=x;
            totalHDiv:=0;
            montoTDiv:=0;
            WriteLn('___________________');
            WriteLn('Division: ', x.division);
            while (x.division = actualDiv.division) and (x.departamento = actualD.departamento) do
            begin
                actualN:=x;
                TotalHs:=0;
                Importe:=0;
                WriteLn('Numero de Empleado: ', x.nro);
                while (x.nro = actualN.nro) and (x.division = actualDiv.division) and (x.departamento = actualD.departamento) do
                begin
                    TotalHs:=TotalHs + x.horas_extras;
                    leer(m,x);
                end;
                totalHDiv:=totalHDiv + TotalHs;
                Importe:=TotalHs*v[x.categoria];
                WriteLn('Total de Hs: ',TotalHs);
                WriteLn('Importe a cobrar: ',Importe);
                montoTDiv:=montoTDiv +Importe;
            end;
            WriteLn('Total de horas division: ', totalHDiv);
            WriteLn('Monto total por division: ',montoTDiv);
            totalHD:=totalHD + totalHDiv;
            montoTD:=montoTD + montoTDiv;
        end;
        WriteLn('Total horas departamento: ', totalHD);
        WriteLn('Monto total departamento: ', montoTD);
    end;
end;
//_____________________________________________
var
    m:maestro;
    v:vector;
begin
    randomize;
    importarMaestro(m);
    CargarVector(v); //Cargo el vector con los precios de las horas extras
    listado(m,v);
end.
```
Ejercicio_11
============
```Pas
program Ej11;
const
    valoralto = 'ZZZZ';
type
    cadena20 = string[20];
    maestroR = record
        nombre:cadena20;
        cantidadA:integer;
        cantidadE:integer; //Cantidad de Encuestados
    end;
    detalleR = record
        nombre:cadena20;
        codigo:integer;
        cantidadA:integer;
        cantidadE:integer;
    end;
    maestro = file of maestroR;
    detalle = file of detalleR;
//__________________________________________
procedure importarDetalles(var d1,d2:detalle);
var
    carga1,carga2:text;
    dato1,dato2:detalleR;
begin
    //Detalle 1
    Assign(d1,'detalle1.data'); Assign(carga1,'detalle1.txt');
    Rewrite(d1);
    Reset(carga1); 
    while (not (Eof(carga1))) do
    begin
        with dato1 do readln(carga1, nombre, codigo, cantidadA, cantidadE);
        Write(d1,dato1);
    end;
    Close(d1);
    Close(carga1);

    //Detalle 2
    Assign(d2,'detalle2.data'); Assign(carga2,'detalle2.txt');
    Rewrite(d2);
    Reset(carga2);
    while (not (Eof(carga2))) do
    begin
        with dato2 do readln(carga2, nombre, codigo, cantidadA, cantidadE);
        Write(d2,dato2);
    end;
    Close(d2);
    Close(carga2);
end;
//__________________________________________
procedure importarMaestro(var m:maestro);
var
    carga:text;
    dato:maestroR;
begin
    Assign(m,'maestro.data');
    Assign(carga,'maestro.txt');
    Rewrite(m);
    Reset(carga);
    while (not (Eof(carga))) do
    begin
        with dato do readln(carga, nombre, cantidadA, cantidadE);
        Write(m,dato);
    end;
    Close(m);
    Close(carga);
end;
//__________________________________________
procedure leer (var archivo: detalle; var x:detalleR);
begin
    if (not eof(archivo))then 
        read (archivo,x)
    else 
        x.nombre := valoralto;
end;
//__________________________________________
procedure minimo (var r1,r2:detalleR;var d1,d2:detalle; var min:detalleR);
begin
    if (r1.nombre<=r2.nombre)  then 
    begin
        min := r1;  leer(d1,r1)
    end
    else 
    begin
        min := r2; leer(d2,r2)
    end
end;
//_______________________________________________________
procedure actualizarMaestro(var m:maestro;var d1,d2:detalle);
Var   
    x: maestroR;  
    min, r1, r2: detalleR; 
begin
    assign (m, 'maestro.data');    reset (m); 
    assign (d1, 'detalle1.data');  reset (d1);  leer(d1, r1); 
    assign (d2, 'detalle2.data');  reset (d2);  leer(d2, r2); 
    minimo(r1, r2, d1, d2,min);
    while (min.nombre <> valoralto) do  
    begin
        read(m,x);
        while (x.nombre <> min.nombre) do 
            read(m,x);
        while (x.nombre = min.nombre ) do 
        begin
            x.cantidadA:=x.cantidadA + min.cantidadA;
            x.cantidadE:=x.cantidadE + min.cantidadE;
            minimo(r1, r2, d1, d2,min);
        end;
        seek (m, filepos(m)-1);
        write(m,x);
    end;
    Close(m);
    Close(d1);
    Close(d2);
end;
//__________________________________________
procedure exportar(var m:maestro);
var
    carga:text;
    dato:maestroR;
begin
    Assign(m,'maestro.data');
    Assign(carga,'reporteMaestro.txt');
    Rewrite(m);
    Reset(carga);
    while (not (Eof(carga))) do
    begin
        with dato do readln(carga, nombre,cantidadA,cantidadE);
        Write(m,dato);
    end;
    Close(m);
    Close(carga);
end;
//__________________________________________
var
    m:maestro;
    d1,d2:detalle;
begin
    importarDetalles(d1,d2);
    importarMaestro(m);
    actualizarMaestro(m,d1,d2);
    exportar(m);
end.
```
Ejercicio_12
============
```Pas
program Ej12;
const 
    valorAlto = 9999;
type
    anios = 1900..2022;
    meses = 1..12;
    dias = 1..31;
    archivoR = record
        anio:integer;
        mes:meses;
        dia:dias;
        id:integer;
        tiempo:integer;
    end;
    archivo = file of archivoR;
//_______________________________________________________
procedure importarArchivo(var m:archivo);
var
	carga: text;
	a: archivoR;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); Reset(carga);
	while(not eof(carga))do begin
		with a do readln(carga, anio, mes, dia,id,tiempo);
		write(m,a);
	end;
	close(m); close(carga);
end;
//_______________________________________________________
procedure leer(var m:archivo; var aux:archivoR);
begin
    if(not eof(m))then 
		read(m,aux)
    else 
		aux.anio:=valorAlto;
end;
//__________________________________________
procedure ListadoEsta(var m:archivo;anio:integer;var x,actual:archivoR);
var
        totalD,totalM,totalA:Integer;
begin
    totalA:=0;
    WriteLn('Anio: ' ,anio);
    while (x.anio <> valoralto) and (anio = x.anio) do begin
        actual:= x;
        totalM:=0;
        WriteLn('Mes ', x.mes);
        while (actual.mes = actual.mes) and (actual.anio = x.anio)do 
        begin
            totalD:=0;
            WriteLn('Dia ',x.dia);
            while (x.dia = actual.dia) and (x.mes = actual.mes) do
            begin
                totalD:=totalD+x.tiempo;
                leer(m,x);
            end;
            WriteLn(x.id, ' Tiempo Total de acceso al dia ', x.dia , ' mes ', x.mes);
            WriteLn(totalD);
            totalM:=totalM+totalD;
        end;

        WriteLn('El total del mes ',x.mes,' es ', totalM);    
        totalA:=totalA + totalM;
    end;
    WriteLn('El total del anio ',anio,' es ', totalA);
end;
//__________________________________________
procedure Listado(var m:archivo; anio:integer);
var
	x,actual:archivoR;
begin
	assign(m,'maestro.data');
	reset(m);
    if not eof(m) then
    begin
        leer(m,x);
        while (x.anio <> anio) and (not Eof(m)) do
            Read(m,x);
        if (x.anio = anio) then
        begin
            ListadoEsta(m,anio,x,actual);
        end
        else
            WriteLn('No se encontro el anio');
    end;
	close(m);
end;
//_______________________________________________________
var
    arch:archivo;
    anio:integer;
begin
    importarArchivo(arch);
    WriteLn('Ingrese un anio'); ReadLn(anio);
    Listado(arch,anio);
end.
```
Ejercicio_13
============
```Pas
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
```
Ejercicio_14
============
```Pas
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
```
Ejercicio_15
============
Ejercicio_16
============
Ejercicio_17
============
Ejercicio 18
============