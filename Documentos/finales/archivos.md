# Archivos

---



- [Maestro-Detalle (merge)](#maestro-detalle-merge)
- [Archivos Con Registro de Longitud Variable]()
- [Archivos Con Registro de Longitud Fija]()
- [Fragmentación Interna]()
- [Fragmentación Externa]()
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

