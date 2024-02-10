# Archivos

> Vamos a tratar de juntar todos los posibles mundos paralelos

- [Maestro-Detalle (merge)]()
- [Corte de Control]()
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


- Existe un archivo maestro.
- Existe un único archivo detalle que modifica al maestro.
- Cada registro del detalle modifica a un registro del maestro. Esto  significa que solamente aparecerán datos en el detalle que se correspondan con datos del maestro. Se descarta la posibilidad de generar altas en ese archivo.
- No todos los registros del maestro son necesariamente modificados.
- Cada elemento del maestro que se modifica es alterado por uno y solo un elemento del archivo detalle.
- Ambos archivos están ordenados por igual criterio. Esta precondición, considerada esencial, se debe a que hasta el momento se trabaja con archivos de datos de acuerdo con su orden físico. Más adelante, se discutirán situaciones donde los archivos respetan un orden lógico de datos.


> El proceso de actualización finaliza cuando se termina de recorrer el  archivo detalle. Una vez procesados todos los registros del archivo  detalle, el algoritmo finaliza, sin la necesidad de recorrer el resto del  archivo maestro.





- No importa absolutamente ningun tipo de orden en ambos archivos
- No requiere que tengan la misma estructura