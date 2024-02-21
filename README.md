<div align="center"> 

[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/Fabian-Martinez-Rincon/FOD)
[![GitHub stars](https://img.shields.io/github/stars/Fabian-Martinez-Rincon/FOD)](https://github.com/Fabian-Martinez-Rincon/FOD/stargazers/)
[![GitHub repo size in bytes](https://img.shields.io/github/repo-size/Fabian-Martinez-Rincon/FOD)](https://github.com/Fabian-Martinez-Rincon/FOD)


<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=30&duration=1700&pause=800&color=28CDF7&center=true&width=435&lines=FOD"/>
 </div>

</div>


<img src= 'https://i.gifer.com/origin/8c/8cd3f1898255c045143e1da97fbabf10_w200.gif' height="20" width="100%">

<p><img width="250" align='right' src="https://media.giphy.com/media/QxSveBdhdtLgagcKdR/giphy.gif"></p>

- [Resumen teorico](https://inakilapeyre.notion.site/inakilapeyre/Fundamentos-de-Organizaci-n-de-Datos-b2375e1e8e2c441693bb98c470261c69)
- [🧾 Listas](/Documentos/Codigos/Listas.md)
- [📚 Vectores](/Documentos/Codigos/Vectores.md)
- [🌳 Arboles](/Documentos/Codigos/Arboles.md)
- [📁 Archivos](/Documentos/Codigos/Archivos.md)
- [📁 Archivos Parcial](/Documentos/ParArchivos.md)
- [Practica 1](/Documentos/Practicas/Practica1Nueva.md)
- [Practica 2](/Documentos/Practicas/Practica2.md)
- [Practica 3](/Documentos/Practicas/Practica3.md)
- [Practica 4](/Documentos/Practicas/Practica4.md)
- [PARCIALES RESUELTOS DE ARCHIVOS](/Documentos/archivos.md)
- [MUCHAS PREGUNTAS PARA EL FINAL](/Documentos/preguntas.md)

<img src= 'https://i.gifer.com/origin/8c/8cd3f1898255c045143e1da97fbabf10_w200.gif' height="20" width="100%">

> [!IMPORTANT]
> Todas las preguntas van a estar justificadas segun el libro [Introducción a las Bases de Datos](/Introducción%20a%20las%20Bases%20de%20Datos%20-%20Bertone-Thomas.pdf) y mi sentido común

---

## Resumen capitulo 2

### Archivos estructuras y operaciones basicas

#### Archivo físico	

Es un archivo residentes en la memoria secundaria y es administrado por el sistema operativo

#### Archivo logico

Es el archivo utilizado desde el algoritmo. Cuando el algoritmo necesita operar, con un archivo, se genera una conexión con el sistema operativo, el cual sera responsable de la administración. Esta acción se denomina independencia fisica

- Secuencial: Se accede a cada elemento despues de haber accedido a su predecesor
- Secuencial Indizado: El acceso a los elementos de un archivo se realiza teniendo presente algún tipo de organización previa, sin tener en cuenta el orden fisico 
- Directo: Es posible recuperar un elemento de dato de un archivo con un solo acceso, conociendo sus caracteristicas, mas alla de que exista un orden fisico o logico predeterminado

---

## Resumen capitulo 3

### Algorítmica clásica sobre archivos

#### Archivo maestro

Es aquel que resume información sobre un dominio del problema especifico. Por ejemplo, el archivo de productos de una empresa que contiene el stock actual de cada producto.

#### Archivo detalle

Es aquel que contiene novedades o movimientos realizados sobre la información almacenada en el maestro. Por ejemplo, el archivo con todas las ventas de los productos de la empresa realizadas en un dia particular.

#### Actualización 

- No es necesario que los archivos detalle y maestro tengan la misma estructura.
- Es posible que no se procesen todos los registros del archivo maestro
- Siempre se procesan todos los registros del archivo detalle
- Para realizar la actualización no me importa el orden de NADA

---

## Resumen capitulo 4

### Eliminación de datos. Archivos con registros de longitud variable.

#### Proceso de bajas

Se denomina **proceso de baja** a aquel proceso que permite quitar información de un archivo. 

- ***Baja física*** Consiste en borrar efectivamente la información del archivo, recuperando el espacio físico
- ***Baja lógica*** Consiste en borrar la información del archivom pero sin recuperar el espacio fisico respectivo
    - Igual para archivos con registros de longitud variable y longitud fija

#### Lista Invertida

Dado un archivo organizado con una lista invertida interna al mismo archivo

- La operación de FileSize del archivo siempre es mayor o igual a 1
- El registro cabecera nunca se elimina
- La lista invertida interna puede estar vacia (Si no se eliminaron elementos)
- El registro en la posición 0 se considera el registro cabecera
- Nunca se recoore de forma secuencial (Solo para busquedas?)
- Ante una alta no es necesario actualizar la lista interna de espacio libre
- Ante una baja, siempre se modifica el registro cabecera.
- Lista encadenada invertida con los elementos borrados.

#### Registros de Longitud Fija

- La información siempre es homogenea
- Altas, Bajas, y Modificaciones son mucho mas faciles ya que todos los registros tiene el mismo tamaño.
- Es ineficiente en cuanto a memoria

#### Registros de Longitud Variable

- La utilización del espacio en disco es optimizada
- Insertar y eliminar elementos es mas dificil
- Utiliza delimitadores

#### Eliminación con registros de longitud variable

Es lo mismo tanto en registros de longitud fija como variable.

#### Altas en registros de longitud variable

Al igual que los registros de longitud fija, se usa una lista encadenada invertida para los elementos borrados. Pero en este caso como tenemos los registros con distinto tamaño, tenemos que aplicar una politica para elegir el mejor lugar.

- ***Primer Ajuste*** Consite en seleccionar el primer espacio disponible donde quepa el registro a insertar
- ***Mejor Ajuste*** Consiste en seleccionar el espacio más adecuado para el registro. Se considera el espacio más adecuado com aquel de menor tamaño donde quepa el registro.
- ***Peor Ajuste*** Consiste en selecccionar el espacio de mayor tamaño asignado para el registro solo los bytes necesarios.

#### Fragmentación interna

Es aquella que se produce cuando un elemento de dato se le asigna mayor espacio del necesario

- Se puede producir con registros de longitud fija y con registros de longitud variable para con las tecnicas de primer ajuste y mejor ajuste.

#### Fragmentación externa

Es aquel espacio disponible entre dos registros, pero que es demasiado pequeño para poder ser reutilizado

- Solo se produce con registros de longitud variable con la tecnica de peor ajuste.

---

## Resumen capitulo 5

### Búsqueda de información. Manejo de índices.

#### Indización 

La caracteristica fundamental de un indice es que posibilita imponer un orden en un archivo sin que realmente se reacomode

- Tiene registros de longitud fija

#### Indice Primario

- ***Altas*** Se agrega al final
- ***Modificaciones*** Si el archivo esta organizando por registros de longitud fija, el indice no se toca, si se cambia de tamaño, se reubica


***La principal ventaja radica en las bajas***

Al ser de menor tamaño que el archivo asociado y tener registros de longitud fija, posibilita mejorar la performance de busqueda, se pueden realizar busquedas binarias

#### Clave candidata

Son claves primarias que por algun motivo, no se usaron

#### Indice Secundario

Es una estructura de datos adicional que permite relacionar una clave secundaria con una o más claves primarias. Varios registros pueden contener la misma clave secundaria

- Primero se accede a un indice primario por una clave secundaria

#### Altas en indice secundario

Cualquier alta en el archivo de datos genera una inserción en el índice secundario, que implica reacomodar el archivo en el cual se almacena.

#### Bajas en indice secundario

Cuando se elimina un registro del archivo de datos, esta operación implica elminar la referencia a ese registro en el indice primario más todas las referencias en indices secundarios.

---

## Resumen capitulo 6

### Arboles: Introducción

#### Arboles Binarios

Es una estructura de datos dinámica no lineal, en la cual cada nodo puede tener a los sumo dos hijos

Una ventaja en la organización mediante árboles binarios está dada en la inserción de nuevos elementos, mientras que en un archivo se desordena cuando se agrega un nuevo dato, si la organización se realiza con la politica de arbol binario, la operatoria resulta más sensilla en terminos de complejidad computacional.

- Agregar el nuevo elemento de datos al final de archivo.
- Busca al padre de dicho elemento. Para ello se recorre el archivo desde la raiz hasta llegar a un nodo terminal.
- Actualiza el padre, haciendo referencia a la dirección del nuevo hijo.

Borrado es casi lo mismo

**La desventaja** Es que tengo que crear un arbol por cada campo que quiero ordenar.

#### Arbol Balanceado

Se entiende por arbol balanceado a aquel arbol donde la trayectoria de la raíz a cada una de las hojas está representada por igual cantidad de nodos. Es decir, todos los nodos hoja se encuentran a igual distancia del nodo raiz.

#### Arbol AVL (arboles balanceados en altura)

Son arboles binarios cuya construcción se determina respetando un precepto muy simple: La diferencia entre el camino más corto y mas largo entre un nodo terminal y la raiz no puede diferir en mas de un determinado delta y dicho delta es el nivel de balanceo en altura del árbol. 

#### Arboles Multicamino

Es una estructura de datos en la cual cada nodo puede contener k elementos y k+1 hijos.

Se define el concepto de orden de un árbol multicamino como la máxima cantidad de descendientes posibles de un nodo

---


## Resumen capitulo 7

### Familia de árboles balanceados

#### Arboles

Estas reglas son las que comparten los 3 tipos de arboles

- **CADA NODO** del arbol puede contener como maximo M descendientes y M-1 Elementos
- **LA RAIZ** no posee descendientes directos o posee al menos dos

#### Arbol B

Son arboles multicamino con una construcción especial que permite mantenerlos balanceados a bajo costo

