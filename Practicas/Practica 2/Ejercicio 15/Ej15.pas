{15. En la facultad de Ciencias Jurídicas existe un sistema a través del cual los alumnos del
posgrado tienen la posibilidad de pagar las carreras en RapiPago. Cuando el alumno se
inscribe a una carrera, se le imprime una chequera con seis códigos de barra para que pague
las seis cuotas correspondientes. Existe un archivo que guarda la siguiente información de los
alumnos inscriptos: dni_alumno, codigo_carrera y monto_total_pagado.
Todos los días RapiPago manda N archivos con información de los pagos realizados por los
alumnos en las N sucursales. Cada sucursal puede registrar cero, uno o más pagos y un
alumno puede pagar más de una cuota el mismo día. Los archivos que manda RapiPago tienen
la siguiente información: dni_alumno, codigo_carrera, monto_cuota.
a) Se debe realizar un procedimiento que dado el archivo con información de los alumnos
inscriptos y los N archivos que envía RapiPago, actualice la información de lo que ha pagado
cada alumno hasta el momento en cada carrera inscripto.
b) Realice otro procedimiento que reciba el archivo con información de los alumnos inscriptos y
genere un archivo de texto con los alumnos que aún no han pagado nada en las carreras que
están inscriptos. El archivo de texto debe contener la siguiente información: dni_alumno,
código_carrera y la leyenda “alumno moroso”. La organización de la información del archivo de
texto debe ser tal de poder utilizarla en una futura importación de datos realizando la cantidad
mínima de lecturas.
Precondiciones:
- Cada alumno puede estar inscripto en una o varias carreras.
- Todos los archivos están ordenados, primero por dni_alumno y luego por codigo_carrera.
- En los archivos que envía RapiPago hay información de pagos de alumnos que si o si existen
en el archivo de inscriptos.
Nota: Para ambos incisos debe definir todas las estructuras de datos utilizadas}
program Ej15;

begin
  
end.