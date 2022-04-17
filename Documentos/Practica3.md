<h1 align="center">Practica 3</h1>

<h1 align="center">Archivos Secuenciales - Bajas</h1>

```1)``` Modificar el ejercicio 4 de la práctica 1 (programa de gestión de empleados), agregándole una opción para realizar bajas copiando el último registro del archivo en la posición del registro a borrar y luego truncando el archivo en la posición del último registro de forma tal de evitar duplicados. [Resolución](#Ejercicio_1)

```2)``` Definir un programa que genere un archivo con registros de longitud fija conteniendo información de empleados de una empresa de correo privado. Se deberá almacenar: código de empleado, apellido y nombre, dirección, teléfono, D.N.I y fecha nacimiento. Implementar un algoritmo que, a partir del archivo de datos generado, elimine de forma ***lógica*** todo los empleados con DNI inferior a 8.000.000. 

Para ello se podrá utilizar algún carácter especial delante de algún campo String a su elección. Ejemplo: ```*PEDRO```. [Resolución](#Ejercicio_2)

```3) ``` Realizar un programa que genere un archivo de novelas filmadas durante el presente año. De cada novela se registra: código, género, nombre, duración, director y precio. El programa debe presentar un menú con las siguientes opciones: [Resolución](#Ejercicio_3)

- ```a)``` Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se utiliza la técnica de lista invertida para recuperar espacio libre en el archivo. Para ello, durante la creación del archivo, en el primer registro del mismo se debe almacenar la cabecera de la lista. Es decir un registro ficticio, inicializando con el valor cero (0) el campo correspondiente a código de novela, el cual indica que no hay espacio libre dentro del archivo.

- ```b)``` Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el inciso a., se utiliza lista invertida para recuperación de espacio. En particular, para el campo de ´enlace´ de la lista, se debe especificar los números de registro referenciados con signo negativo, (utilice el código de novela como enlace).Una vez abierto el archivo, brindar operaciones para:

  - ```i)``` Dar de alta una novela leyendo la información desde teclado. Para esta operación, en caso de ser posible, deberá recuperarse el espacio libre. Es decir, si en el campo correspondiente al código de novela del registro cabecera hay un valor negativo, por ejemplo -5, se debe leer el registro en la posición 5, copiarlo en la posición 0 (actualizar la lista de espacio libre) y grabar el nuevo registro en la posición 5. Con el valor 0 (cero) en el registro cabecera se indica que no hay espacio libre.

  - ```ii)```  Modificar los datos de una novela leyendo la información desde teclado. El código de novela no puede ser modificado.

  - ```iii)``` Eliminar una novela cuyo código es ingresado por teclado. Por ejemplo, si se da de baja un registro en la posición 8, en el campo código de novela del registro cabecera deberá figurar -8, y en el registro en la posición 8 debe copiarse el antiguo registro cabecera.

- ```c)``` Listar en un archivo de texto todas las novelas, incluyendo las borradas, que representan la lista de espacio libre. El archivo debe llamarse ```novelas.txt```.

```
NOTA: Tanto en la creación como en la apertura el nombre del archivo 
debe ser proporcionado por el usuario.
```

```4)``` Dada la siguiente estructura: [Resolución](#Ejercicio_4)

```Pas
type
    tTitulo = String[50];
    tArchRevistas = file of tTitulo;
```

Las bajas se realizan apilando registros borrados y las altas reutilizando registros borrados. El registro 0 se usa como cabecera de la pila de registros borrados: el número 0 implica que no hay registros borrados y N indica que el próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.

- ```a)``` Implemente el siguiente módulo:

```Pas
{Abre el archivo y agrega el título de la revista, recibido como
parámetro manteniendo la política descripta anteriormente}
procedure agregar (var a: tArchRevistas ; titulo: string);
```

- ```b)``` Liste el contenido del archivo omitiendo las revistas eliminados. Modifique lo que considere necesario para obtener el listado.

```5)``` Dada la estructura planteada en el ejercicio anterior, implemente el siguiente módulo: [Resolución](#Ejercicio_5)

```Pas
{Abre el archivo y elimina el título de la revista recibida como
parámetro manteniendo la política descripta anteriormente}
procedure eliminar (var a: tArchRevistas ; titulo: string);
```

```6)``` Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con la información correspondiente a las prendas que se encuentran a la venta. De cada prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba ambos archivos y realice la baja lógica de las prendas, para ello deberá modificar el stock de la prenda correspondiente a valor negativo.

Por último, una vez finalizadas las bajas lógicas, deberá efectivizar las mismas
compactando el archivo. Para ello se deberá utilizar una estructura auxiliar, renombrando
el archivo original al finalizar el proceso.. Solo deben quedar en el archivo las prendas
que no fueron borradas, una vez realizadas todas las bajas físicas. [Resolución](#Ejercicio_6)

```7)``` Se cuenta con un archivo que almacena información sobre especies de aves en
vía de extinción, para ello se almacena: código, nombre de la especie, familia de ave,
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice
un programa que elimine especies de aves, para ello se recibe por teclado las especies a
eliminar. Deberá realizar todas las declaraciones necesarias, implementar todos los
procedimientos que requiera y una alternativa para borrar los registros. Para ello deberá implementar dos procedimientos, uno que marque los registros a borrar y posteriormente
otro procedimiento que compacte el archivo, quitando los registros marcados. Para
quitar los registros se deberá copiar el último registro del archivo en la posición del registro
a borrar y luego eliminar del archivo el último registro de forma tal de evitar registros
duplicados. [Resolución](#Ejercicio_7)

```
Nota: Las bajas deben finalizar al recibir el código 500000
```

Ejercicio_1
===========
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
