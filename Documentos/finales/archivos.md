# Archivos

---

- **Corte de control** Lo unico que importa que este ordenado
- [Maestro-Detalle (merge)](#maestro-detalle-merge)
- [Archivos Con Registro de Longitud Variable](#archivos-con-registro-de-longitud-variable)
- [Archivos Con Registro de Longitud Fija](#archivos-con-registro-de-longitud-fija)
- [Baja Logica](#baja-logica)
- [Archivo Directo](#archivo-directo)
- [Archivo Serie](#archivo-serie)
- [Archivo Secuencial](#archivo-secuencial)
- [Operaciones]()

---

> Merge es lo mismo que la actualización en maestro/detalle

## Maestro-Detalle (merge)

<table>
<tr>
<th>Maestro</th>
<th>Detalle</th>

</tr>
<tr>
<td>
Archivo que resume información sobre un dominio de problema específico. 


Ejemplo: el archivo de productos de una empresa que contiene el stock actual de cada producto.
</td>
<td>

Archivo que contiene novedades o movimientos realizados sobre la información almacenada en el maestro. 

Ejemplo: el archivo con todas las ventas de los productos de la empresa realizadas en un día particular
</td>
</tr>

</table>


***Para realizar un algoritmo de actualización maestro-detalle***


- PROSAR SIMULTANEMANTE - Con los detalles ordenados por el mismo criterio nos basta
- SIEMPRE se procesan todos los registros del archivo detalle
- Pueden no procesar todos los registros del archivo maestro
- Existe un archivo maestro.
- Cada registro del detalle modifica a un registro del maestro.
- No todos los registros del maestro son necesariamente modificados.
- No importa absolutamente ningun tipo de orden en ambos archivos 🤓
- No requiere que tengan la misma estructura


#### Forma de recorrer
El proceso de actualización finaliza cuando se termina de recorrer el  archivo detalle. Una vez procesados todos los registros del archivo  detalle, el algoritmo finaliza, sin la necesidad de recorrer el resto del  archivo maestro.

---


- Se denomina ***fragmentación interna*** a aquella que se produce cuando a un elemento de dato se le asigna mayor espacio del necesario.
- Se denomina ***fragmentación externa*** al espacio disponible entre dos registros, pero que es demasiado pequeño para poder ser reutilizado.

---

### Archivos Con Registro de Longitud Variable

- El orden no es importante
- Puede tener un carácter delimitador, por ejemplo & 
- Cada campo debe descomponerse (caracter x caracter)
- Lectura y Escritura más lenta (de a un caracter)
- Puede tener fragmentación interna (primer ajuste y mejor ajuste)
- Puede tener fragmentación externa (peor ajuste)
- Altas (Primer Ajuste, mejor Ajuste, Peor Ajuste) Si no hay lugar siempre al final
- Bajas (NO USAN NINGUN AJUSTE)
- Se puede aplicar corte de control
- Puede ocupar el mismo espacion con registros de longitud fija
- Las altas (con ajustes) pueden no generar ningun tipo de fragmentación
- Altas Usan la tecnica de lista invertida

---

### Archivos Con Registro de Longitud Fija

- Altas y Bajas más comodas
- Desperdicio de espacio (en grandes cantidades)
- Lectura y Escritura más rápida
- Puede tener fragmentación interna
- Se puede aplicar corte de control
- No puede tener un delimitador de fin de registro
- Tiene registros del mismo tamaño

---

### Baja Logica

- Esta diseñado para borrar un registro de un archivo 
- No nos importa el orden del archivo
- Se puede en un archivo con registros de longitud fija o variable (dudas)
- SIEMPRE se genera fragmentación interna

---

> Todos pueden tener registros de longitud variable o fija

### Archivo Directo

- No permite el acceso secuencial ni secuencial indizado
- Tiene acceso directo

---

### Archivo Serie

- Tiene acceso secuencial
- Puedo recuperar un archivo en un solo acceso si esta en el prmero
- No se aplican busquedas binarias EN NINGUN CASO
- Puede ordenarse
- Un archivo en el cual se accede a un registro luego de acceder a su predecesor en orden físico 

---

### Archivo Secuencial

- No se accede a un registro luego de acceder a su predecesor en orden físico sino en orden lógico *

---

### Operaciones

- ***La operación RESET()***
    - Se realiza luego a la operación ASSIGN()
    - Abre un archivo para leer y escribir
    - Coloca el puntero al inicio del archivo
    - Si el archivo no existe genera un error
- ***La operación REWRITE()***
    - Se realiza luego a la operación ASSIGN()
    - Abre un archivo para escribir
    - Si el archivo no existe lo crea
    - Si el archivo existe borra lo que tenia y lo deja vacio
- ***La operación READ() y WRITE()***
    - Leen/Escriben un registro en el archivo y avanzan la posición del puntero
- ***La operación filesize()***
    - Cantidad de elementos que tiene el archivo
    - Para un filesieze() = 0 el archivo esta vacio
    - Para un filesize() = 1 el archivo tiene un registro
- ***La operación seek(nombre_logico, filesize(nombre_logico))***
    - Deja la operación en el final del archivo en la marca de fin de archivo
- **seek(nombre_logico, posición)**
    - Modifica la posición del puntero
- **Filepos(nombre_logico)**
    - Devuelve la posición actual del puntero (0 hasta filesize(nombre_logico) - 1)

---

Tengo dudas con la lista invertida nomas

#### Pregunta 4)

Dado un archivo organizado con una lista invertida interna al mismo archivo para recuperación de espacio libre:

- **a)** Ante una nueva alta, se debe recorrer el archivo de forma secuencial buscando un espacio libre.
- **b)** La búsqueda de un elemento en el archivo puede realizarse secuencialmente.
- **c)** Ante una nueva alta, siempre se modifica el registro de la posición 0.
- **d)** Ante una baja de un elemento existente en el archivo, siempre se modifica el registro de la posición 0.
- **e)** Hay más de una opción valida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

> No hay respuesta

---

#### Pregunta 9)

Dado un archivo organizado con una lista invertida interna al mismo archivo para recuperación de espacio libre:

- **a)** Ante una nueva alta, se recorre el archivo de forma secuencial buscando un espacio libre.
- **b)** Ante una nueva alta, se modifica el registro de la posición 0.
- **c)** Ante una baja de un elemento existente en un archivo, se modifica el registro de la posición 0.
- **d)** Si se eliminan todos los registros del archivo, entonces se debe eliminar el registro en la posición 0 del archivo. **`//Esta no es`**
- **e)** La lista invertida interna no puede estar vacía.
- **f)** Hay más de una opción válida.
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 3)

Dado un archivo organizado con una lista invertida interna al mismo archivo para recuperación de espacio libre:

- **a)** El registro ubicado en la posición 1 se considera un registro especial que se utiliza como inicio de la lista.
- **b)** Ante una nueva alta, se recorre el archivo de forma secuencial buscando un espacio libre.
- **c)** Ante una nueva alta, si la lista interna de espacio libre está vacía se recorre el archivo secuencialemnte hasta el final y ahí se agrega el nuevo registro.
- **d)** Ante una baja, no es necesario actualizar la lista interna de espacio libre.
- **e)** Si se eliminan todos los registros del archivo, entonces se debe eliminar el registro en la posición 0 del archivo.
- **f)** La lista invertida interna no puede estar vacía.
- **g)** Hay más de una opción válida. **`//Esta no es`**
- **h)** Todas las opciones anteriores son correctas.
- **i)** Ninguna de las opciones anteriores es correcta.