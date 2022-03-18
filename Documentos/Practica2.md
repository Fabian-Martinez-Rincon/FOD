<h1 align="center">Practica 2</h1>

<h1 align="center">Fundamentos de Organización de Datos</h1>

[Archivos Secuenciales-Argorítmica Clásica]()

```1)``` Una empresa posee un archivo con información de los ingresos percibidos por diferentes empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado, nombre y monto de la comisión. La información del archivo se encuentra ordenada por código de empleado y cada empleado puede aparecer más de una vez en el archivo de comisiones.

Realice un procedimiento que reciba el archivo anteriormente descripto y lo compacte. En consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una única vez con el valor total de sus comisiones.

```
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez.
```

```2)``` Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias (cursadas) aprobadas sin final y cantidad de materias con final aprobado. Además, se tiene un archivo detalle con el código de alumno e información correspondiente a una materia (esta información indica si aprobó la cursada o aprobó el final).

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


```3)```  Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados. De cada producto se almacena: código del producto, nombre, descripción, stock disponible, stock mínimo y precio del producto.

Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo maestro. La información que se recibe en los detalles es: código de producto y cantidad vendida. Además, se deberá informar en un archivo de texto: nombre de producto, descripción, stock disponible y precio de aquellos productos que tengan stock disponible por debajo del stock mínimo.

```
NOTA: Todos los archivos se encuentran ordenados por código de productos. 
En cada detalle puede venir 0 o N registros de un determinado producto.

```

```4)``` Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma fue construida sobre una topología de red que conecta 5 máquinas entre sí y todas las máquinas se conectan con un servidor central. Semanalmente cada máquina genera un archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos: cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha, tiempo_total_de_sesiones_abiertas.

### ***NOTAS:***
-  Cada archivo detalle está ordenado por cod_usuario y fecha.
- Un usuario puede iniciar más  de una sesión el mismo dia en la misma o en diferentes máquinas.
- El archivo maestro debe crearse en la siguiente ubicación física: /var/log.

```5)``` A partir de un siniestro ocurrido se perdieron las actas de nacimiento y fallecimientos de toda la provincia de buenos aires de los últimos diez años. En pos de recuperar dicha información, se deberá procesar 2 archivos por cada una de las 50 delegaciones distribuidas en la provincia, un archivo de nacimientos y otro de fallecimientos y crear el archivo maestro reuniendo dicha información.

Los archivos detalles con nacimientos, contendrán la siguiente información: nro partida nacimiento, nombre, apellido, dirección detallada(calle,nro, piso, depto, ciudad), matrícula del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre.

En cambio los 50 archivos de fallecimientos tendrán: nro partida nacimiento, DNI, nombre y apellido del fallecido, matrícula del médico que firma el deceso, fecha y hora del deceso y lugar.

Realizar un programa que cree el archivo maestro a partir de toda la información los archivos. Se debe almacenar en el maestro: nro partida nacimiento, nombre, apellido, dirección detallada(calle,nro, piso, depto, ciudad), matrícula del médico, nombre y apellido de la madre, DNI madre, nombre y apellido del padre, DNI del padre y si falleció, además matrícula del médico que firma el deceso, fecha y hora del deceso y lugar. Se deberá, además, listar en un archivo de texto la información recolectada de cada persona.

```
NOTA: Todos los archivos están ordenados por nro de partido de nacimiento que es única.

Tenga en cuenta que no necesariamente va a fallecer en el distrito donde nació la persona 
y además puede no haber fallecido.
```

```6)``` Se cuenta con un archivo maestro con los artículos de una cadena de venta de indumentaria. De cada artículo se almacena: código del artículo, nombre, descripción,talle, color, stock disponible, stock mínimo y precio del artículo.

Se recibe diariamente un archivo detalle de cada una de las 15 sucursales de la cadena. Se debe realizar el procedimiento que recibe los 15 detalles y actualiza el stock del archivo maestro. La información que se recibe en los detalles es: código de artículo y cantidad vendida. Además, se deberá informar en un archivo de texto: nombre de artículo, descripción, stock disponible y precio de aquellos artículo que tengan stock disponible por debajo del stock mínimo.

```
Nota: todos los archivos se encuentran ordenados por código de artículo. En cada detalle
puede venir 0 o N registros de un determinado artículo.
```

```7)``` El encargado de ventas de un negocio de productos de limpieza desea administrar el stock de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los productos que comercializa. De cada producto se maneja la siguiente información: código de producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se genera un archivo detalle donde se registran todas las ventas de productos realizadas. De cada venta se registra: código de producto y cantidad de unidades vendidas. Se pide realizar un programa con opciones para:

1) Crear el archivo maestro a partir de un archivo de texto llamado ```productos.txt```
2) Listar el contenido del archivo maestro en un archivo de texto llamado ```reporte.txt``` listando de a un producto por línea.
3) Crear un archivo detalle de ventas a partir de un archivo de texto llamado ```ventas.txt```
4) Listar en pantalla el contenido del archivo detalle de ventas.
5) Actualizar el archivo maestro con el archivo detalle, sabiendo que:
   - Ambos archivos están ordenados por código de producto.
   - Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del archivo detalle.
   - El archivo detalle sólo contiene registros que están en el archivo maestro.
6) Listar en un archivo de texto llamado ```stock_minimo.txt``` aquellos productos cuyo stock actual esté por debajo del stock mínimo permitivo.

```8)``` Se cuenta con un archivo que posee información de las ventas que realiza una empresa a los diferentes clientes. Se necesita obtener un reporte con las ventas organizado por cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el cliente.