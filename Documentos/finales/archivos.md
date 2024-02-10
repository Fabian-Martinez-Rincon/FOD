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
- Operaciones
    - [Reset]()
    - [Rewrite]()
    - [Write/Read]()
    - [Otras]()

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

### Archivo Serie

- Tiene acceso secuencial
- Puedo recuperar un archivo en un solo acceso si esta en el prmero
- No se aplican busquedas binarias EN NINGUN CASO
- Puede ordenarse
- Un archivo en el cual se accede a un registro luego de acceder a su predecesor en orden físico 

### Archivo Secuencial

- No se accede a un registro luego de acceder a su predecesor en orden físico sino en orden lógico *

