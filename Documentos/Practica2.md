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
program practica2_uno;
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
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 2\Archivos_txt\empleados.txt');
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
        WriteLn('Bien: ',regDetalle.codigo);
        total:=0;
        act:=regDetalle;  
        WriteLn('E');
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
Ejercicio_3
===========
Ejercicio_4
===========
Ejercicio_5
===========
Ejercicio_6
===========
Ejercicio_7
===========
Ejercicio_8
===========
Ejercicio_9
===========
Ejercicio_10
============
Ejercicio_11
============
Ejercicio_12
============
Ejercicio_13
============
Ejercicio_14
============
Ejercicio_15
============
Ejercicio_16
============
Ejercicio_17
============
Ejercicio 18
============