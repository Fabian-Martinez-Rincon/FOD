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

## 😎 ESPACIO PUBLICITARIO 😎

En esta pagina tenes preguntas para poder simular el final

[![Quiz FOD](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/4f839366-b9b3-4de2-a1fe-bdfa75f5782b)](https://josu-dev.github.io/Depende-Quiz-Datos/)

El objetivo de este blog es poder tener la información necesaria para aprobar el final y que no dependa de si conseguiste finales o si no sabes donde encontrar información para estudiar.

- [Repositorio con todas las clases](https://github.com/Fabo-University/FOD)
- [Libro de la materia](https://github.com/Fabo-University/FOD/blob/main/Introducci%C3%B3n%20a%20las%20Bases%20de%20Datos%20-%20Bertone-Thomas.pdf)
- [Cuestionario online](https://j-josu.github.io/Quiz-FOD/)

## Final de septiembre (07/09/2023) 

En cada caso marcar una sola opción correcta. Cada respuesta correcta suma 1 punto, cada respuesta incorrecta resta 0.5 y un  inciso sin responder es neutro.

#### Pregunta 1)

Dado el siguiente árbol B+ es de 5. La operación de baja del valor 52:

- **Nodo 0**: 4, i, 1(23) 2(52) 3(73) 4(88) 5
- **Nodo 1**: 4, h, (5) (9) (15) (20)
- **Nodo 2**: 3, h, (25) (32) (41)
- **Nodo 3**: 2, h, (53) (62)
- **Nodo 4**: 1, h, (78)
- **Nodo 5**: 1, h, (90)

#### Respuestas
- **`a) Genera: lectura nodo 0, lectura nodo 5 y ninguna escritura.`**
- **b)** Genera: lectura nodo 0, lectura nodo 5, lectura nodo 4 y escritura solo del nodo 0.
- **c)** El árbol desciende de nivel.
- **d)** Genera: lectura nodo 0, lectura nodo 5, lectura nodo 4, escritura nodos 5 y escritura nodo 4.
- **e)** Hay más de una opción valida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 2)

La siguiente secuencia de instrucciones en un archivo con al menos un registro y la siguiente estructura: código de producto y precio:

```
assign (arch, "archivo.dat");
reset(arch);
read(arch, producto);
producto.codigo:= 1;
producto.precio:= 5000;
write(arch, producto);
close(arch);
reset(arch);
writeln(filesize(arch));
```

#### Respuestas

- **a)** Pierde la información del primer registro del archivo.
- **``b) Modifica el código y el precio del primer registro existente en el archivo y lo escribe en su misma posición.``**
- **c)** Puede imprimir 2 en pantalla
- **d)** Puede imprimir 1 en pantalla
- **e)** Puede imprimir 0 en pantalla
- **f)** Hay más de una opción valida.
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 3)

Se tiene el siguiente archivo para dispersión estática, con la técnica de saturación progresiva encadenada. Si llega la clave B que genera por función de dispersión la dirección 1 (F(B) = 1). Entonces:

| Dir | Clave  | Enlace |
|-----|--------|--------|
| 0   |        | -1     |
| 1   | A      | 3      |
| 2   | Z      | -1     |
| 3   | W      | -1     |
| 4   |        | -1     |
| 5   | D      | -1     |
| 6   |        | -1     |
| 7   |        | -1     |

#### Respuestas

- **a)** La clave B se almacena en la dirección 0 con enlace a la dirección 3.
- **b)** La clave B se almacena en la dirección 4 con enlace a la dirección 3.
- **c)** La clave B se almacena en la dirección 3 y la clave W se quita del archivo.
- **d)** La clave B se almacena en la dirección 3 y la clave W se mueve a la dirección 4 con enlace a la dirección 3.
- **e)** Hay más de una opción valida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

> Esta pregunta no esta corregida.

---

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

#### Pregunta 4 Alternativa)

La misma Pregunta

- **a)** Ante una nueva alta, se debe recorrer el archivo de forma secuencial buscando un espacio libre.
- **b)** Ante una nueva alta, siempre se modifica el registro de la posición 0.
- **c)** Ante una baja de un elemento existente en el archivo, siempre se modifica el registro de la posición 0.
- **d)** Si se eliminan todos los registros del archivo, la operación de filesize imprime 0. **`//Esta no es`**
- **e)** Hay más de una opción valida.
- **f)** Todas las opciones anteriores son correctas.


---

#### Pregunta 5)

Según el estado de un archivo directo para dispersión estensible y bloques o cubetas con capacidad para 3 registros:"

Tabla:

- 0 (0): 1
- 1 (1): 0

Claves de registros en Bloques:

- 0: 1 | 13525(0011010011010101), 12829(0011001000011101), 11541(0010110100010101)
- 1: 0 | 55344(1101100000110000), 37502(1001001001111110), 20642(0101000010100010)

#### Respuestas
- **a)** El proceso de alta de la clave 19825 (100110101110001) no produce overflow
- **b)** El proceso de alta de la clave 19825 (100110101110001) produce overflow y no es necesario duplicar la tabla
- **c)** El proceso de alta de la clave 19825 (100110101110001) produce más de un overflow y se duplica la tabla una única vez, quedando la misma con 2 bits asociados (4 entradas)
- **d)** Hay más de una opción valida.
- **e)** Todas las opciones anteriores son correctas.
- **f)** Ninguna de las opciones anteriores es correcta.

> No hay respuesta

---

#### Pregunta 6) No estan ordenados

Dado un archivo maestro que almacena código ded producto y stock, y dando dos archivos de detalle que almacenan fecha de venta, código de producto y cantidad vendida. El archivo maestro y los detalles no están ordenados, entonces en la implementación de un algoritmo de actualización maestro/detalle:

- **a)** Se aplica un algoritmo de corte de control  para procesar ambos archivos de detalle simultáneamente.
- **b)** No es necesario procesar todos los registros del archivo maestro.
- **c)** No es posible actualizar el archivo maestro con los archivos de detalle.
- **d)** Es necesario procesar todos los registros en los archivos detalle
- **`e) Hay más de una opción valida.`**
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

#### Pregunta 6 Alternativa) Estan ordenados

Dado un archivo maestro que almacena código ded producto y stock, y dando dos archivos de detalle que almacenan fecha de venta, código de producto y cantidad vendida. El archivo maestro y los detalles están ordenados por codigo de producto, entonces en la implementación de un algoritmo de actualización maestro/detalle:

- **a)** Se pueden procesar ambos archivos de detalle simultáneamente.
- **b)** Puede no ser necesario procesar todos los registros del archivo maestro.
- **c)** Es necesario procesar todos los registros de los archivos de detalle.
- **d)** Hay más de una opción valida.
- **`e) Todas las opciones anteriores son correctas.`**
- **f)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 7)

Dada una función de dispersión
- **a)** Se utiliza saturación progresiva para ubicar registros en overflow.
- **b)** Se utiliza saturación progresiva encadenada para ubicar registros en overflow.
- **c)** Se utiliza saturación progresiva encadenada en áreas separadas para ubicar registros en overflow.
- **d)** Se utiliza dispersión doble para ubicar registros en overflow.
- **e)** Todas las opciones anteriores son correctas.
- **f)** Algunas de las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 8)

Cuando se busca un elemento en un árbol B+

- **a)** Puede necesitar la creación de un nodo.
- **b)** No es necesario acceder al nivel hoja.
- **c)** Puede ser necesario realizar una actualización en un nodo interno.
- **d)** Es necesario acceder al nivel hoja.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

> No hay respuesta

---

#### Pregunta 9)

Cuando se busca un elemento en un árbol B (Pueden preguntar lo mismo con árbol B+):

- **a)** Puede necesitar la creación de un nodo.
- **b)** Puede no ser necesario acceder al nivel hoja.
- **c)** Puede ser necesario realizar una actualización en un nodo interno.
- **d)** Es necesario acceder al nivel hoja.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **`g) Ninguna de las opciones anteriores es correcta.`**

---

#### Pregunta 10)

- Cuando se realiza una baja en un árbol B+:
- Cuando se realiza una baja en un árbol B:

#### Respuestas

- **a)** Puede ocurrir overflow
- **b)** Ocurre underflow
- **c)** Puede ser necesario liberar un nodo.
- **d)** Puede no ser necesario acceder al nivel hoja.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

> No hay respuesta

---

#### Pregunta 8)

Un indice secundario es:

- **a)** Una estructura de datos adicional que permite asociar una o varias claves primarias con una clave candidata.
- **b)** Una estructura de datos adicional que contiene el mismo volumen de información que el archivo original
- **c)** Una estructura de datos adicional que permite asociar una o varias claves secundarias con una clave primaria.
- **d)** Hay más de una opción válida.
- **e)** Todas las opciones anteriores son correctas.
- **`f) Ninguna de las opciones anteriores es correcta.`**

---

#### Pregunta 7)

Un árbol AVL es un (utilizar sólo 5 palabras, no más):

---

## Otro Final

#### Pregunta 1)

Cuando se produce un desborde en dispersión dinámica:

- **a)** En algunos casos aumenta la cantidad de bits asociado al bloque en donde sucede el desborde.
- **b)** Siempre se duplica la tabla asociada al archivo de datos.
- **c)** No es necesario generar un nuevo bloque para el archivo de datos.
- **d)** Puede no ser necesario escribir en el archivo de datos.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 2)

La siguiente secuencia de instrucciones en un archivo vacío con la siguiente estructura: código de producto y precio:

```
assign (arch, "archivo.dat");
rewrite(arch);
producto.codigo:= 1;
producto.precio:= 5000;
close(arch);
reset(arch);
writeln(filesize(arch));
```

#### Respuestas

- **a)** Pierde Información
- **b)** Modificar el código y el precio del último registro existente en el archivo.
- **c)** Puede imprimir 0 en pantalla
- **d)** Puede imprimir 1 en pantalla **`//Esta no es`**
- **e)** No realiza cambio alguno sobre el archivo.
- **f)** Hay más de una opción valida.
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 3)

Final de septiembre (07/09/2023) Pregunta 6 Alternativa

---

#### Pregunta 4)

Un árbol AVL

- **a)** Es un árbol binario en donde cada nodo puede tener más de un nodo padre.
- **b)** Es un árbol B balanceado en altura
- **c)** Es una estructura de datos lineal que se puede desbalancear.
- **d)** Puede ser árbol B balanceado en altura.
- **d)** Puede ser árbol B+ balanceado en altura.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.


> No hay respuesta 

---

#### Pregunta 5)

Un índice secundario es:

- **a)** Una estructura de datos adicional que permite asociar una o varias claves primarias con una clave secundaria.
- **b)** Una estructura de datos adicional que contiene el mismo volumen de información que el archivo original
- **c)** Una estructura de datos adicional que permite asociar una o varias claves secundarias con una clave primaria.
- **d)** Una estructura de datos adicional que establece un orden lógico del archivo original.
- **e)** Una estructura de datos adicional que permite relacionar una clave primaria con otra clave candidata.
- **f)** Hay más de una opción válida.
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

> No hay respuesta

---

#### Pregunta 6)

Cuando se realiza una baja en un árbol B+ de prefijos simples:

- **a)** Necesita la creación de más de un nodo.
- **b)** Siempre se accede al nivel hoja.
- **c)** Es necesario realizar una actualización en un nodo interno.
- **d)** Nunca puede aumentar el nivel del árbol
- **e)** Se promociona una copia de la expresión en un nodo interno. **`//Esta no es`**
- **f)** Hay más de una opción válida.
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 7)

Cuando se realiza un alta en un árbol B:

- **a)** El nuevo elemento debe ir en un nodo interno.
- **b)** Ocurre un overflow
- **c)** Puede ocurrir un underflow. **`//Esta no es`**
- **d)** Puede ser necesario liberar un nodo.
- **e)** El árbol nunca puede descender de nivel.
- **f)** No es necesario acceder al nivel hoja.
- **g)** Hay más de una opción válida.
- **h)** Todas las opciones anteriores son correctas.
- **i)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 8)

Cuando se realiza un alta y produce una colisión en dispersión estática:

- **a)** Siempre se genera desborde.
- **b)** Nunca se genera desborde.
- **`c) Se puede generar desborde.`**.
- **d)** Se puede generar una colisión.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

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

#### Pregunta 10)

Cuando una clave **x** y otra clave **y** generan, por Función de Dispersión, la misma dirección, entonces:

- **a)** Puede ocurrir un desborde.
- **b)** Puede ocurrir una colisión.
- **c)** **x** e **y** no son claves sinónimas.
- **d)** Todas las opciones anteriores son correctas. **`//Esta no es`**
- **e)** Hay más de una opción válida.
- **f)** Ninguna de las opciones anteriores es correcta.

---

## Final de Julio (06/07/2023)

En cada caso marcar una sola opción correcta. Cada respuesta correcta suma 1 punto, cada respuesta incorrecta resta 0.5 y un inciso sin respuesta es neutro.

#### Pregunta 1)

Dado un archivo maestro que almacena código de producto y stock, y dado dos archivos de detalle que almacenan fecha de venta, código de producto y cantidad vendida. El archivo maestro ordenado por stock y los detalles por  código ded producto, entonces en la implementación de un algoritmo ded actualización maestro/detalle:

- **a)** No se pueden procesar ambos archivos de detalle simultáneamente. **`//Esta no es`**
- **b)** No es necesario procesar todos los registros del archivo maestro.
- **c)** Puede no ser necesario procesar todos los registros de los archivos detalle.
- **d)** Hay más de una opción válida.
- **e)** Todas las opciones anteriores son correctas.
- **f)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 2)

La siguiente secuencia de instrucciones en un archivo con al menos un registro y con la siguiente estructura: código de producto y precio:

```	
assign (arch, "archivo.dat");
rewrite(arch);
producto.codigo:= 1;
producto.precio:= 5000;
write(arch, producto);
close(arch);
reset(arch);
writeln(filesize(arch));
```

#### Respuestas

- **a)** Puede perder información. **`//Esta no es`**
- **b)** Modifica el código y el precio del último registro existente en el archivo.
- **c)** Imprime 0 en pantalla
- **d)** Imprime 1 en pantalla
- **e)** No realiza cambio alguno sobre el archivo.
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

---

#### Pregunta 4)

Un índice primario es:

- **a)** Una estructura de datos adicional que permite asociar una o varias claves primarias con una clave secundaria.
- **b)** Una estructura de datos adicional que contiene el mismo volumen de información que el archivo original
- **c)** Una estructura de datos adicional que permite asociar una o varias claves secundarias con una clave primaria.
- **`d) Una estructura de datos adicional que establece un orden lógico del archivo original.`**
- **e)** Una estructura de datos adicional que permite relacionar una clave primaria con otra clave candidata.
- **f)** Hay más de una opción válida.
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 5)

Un árbol AVL

- **a)** Es un árbol binario en donde cada nodo puede tener más de un nodo padre.
- **b)** Es un árbol B balanceado en altura
- **c)** Es una estructura de datos lineal que se puede desbalancear.
- **d)** Puede ser árbol B balanceado en altura.
- **d)** Puede ser árbol B+ balanceado en altura.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta. **`//Esta no es`**

---

#### Pregunta 6)

Cuando se realiza un alta en un árbol B+ de prefijos simples:

- **a)** No necesita la creación de más de un nodo.
- **b)** Siempre se accede al nivel hoja.
- **c)** Puede no ser necesario realizar una actualización en un nodo interno.
- **d)** Nunca puede aumentar el nivel del árbol
- **e)** Siempre se promociona una copia de la expresión minima de la clave.
- **`f) Hay más de una opción válida.`**
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 7)

Cuando se realiza una baja en un árbol B:

- **a)** El elemento que se elimina no puede estar en un nod interno del árbol.
- **b)** Puede existir underflow y no propagarse hasta el nodo raíz.
- **c)** Puede existir underflow y progagarse hasta el nodo raíz.
- **d)** Siempre es necesario liberar un nodo.
- **e)** El árbol desciende de nivel.
- **f)** No es necesario acceder al nivel hoja.
- **`g) Hay más de una opción válida.`**
- **h)** Todas las opciones anteriores son correctas.
- **i)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 8)

Cuando se realiza un alta se produce una colisión en dispersión estática:

- **a)** Siempre se genera desborde.
- **b)** Nunca se genera desborde.
- **c)** **`Se puede generar desborde.`**
- **d)** Se puede generar una colisión.
- **e)** Hay más de una opción válida.
- **f)** Todas las opciones anteriores son correctas.
- **g)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 9)

Cuando una clave **x** y otra clave **y** generan, por Función de Dispersión, distinta dirección, entonces:

- **a)** Puede ocurrir un desborde.
- **b)** Puede ocurrir una colisión.
- **c)** **x** e **y** no son claves sinónimas. **`//Esta no es`**
- **d)** Todas las opciones anteriores son correctas.
- **e)** Hay más de una opción válida.
- **f)** Ninguna de las opciones anteriores es correcta.

---

#### Pregunta 10)

Cuando se produce un desborde en dispersión dinámica:

- **a)** En algunos casos aumenta la cantidad de bits asociado al bloque en donde sucede el desborde.
- **b)** Siempre se duplica la tabla asociada al archivo de datos.
- **c)** Se debe generar un nuevo bloque para el archivo de datos.
- **d)** Puede no ser necesario duplicar la tabla asociada al archivo de datos.
- **e)** Puede no ser necesario escribir en el archivo de datos.
- **f)** Hay más de una opción válida. **`//Esta no es`**
- **g)** Todas las opciones anteriores son correctas.
- **h)** Ninguna de las opciones anteriores es correcta.

---

## Mas Finales


![WhatsApp Image 2023-12-16 at 16 39 02](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/a8deffe9-b4a4-4f84-bdf1-695ed6aac347)
![WhatsApp Image 2023-12-16 at 16 39 02 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/83eada33-faa7-42e0-b94d-ef3189f6f92d)
![WhatsApp Image 2023-12-16 at 16 39 01](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/b9f4ba65-064f-4f65-9d95-b591c8c17762)
![WhatsApp Image 2023-12-16 at 16 39 01 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/67be5cd8-7bcd-49d7-9e64-9e0165ac4f1b)
![WhatsApp Image 2023-12-16 at 16 39 01 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/233d0050-f4fc-4a46-929a-07396e1baa33)
![WhatsApp Image 2023-12-16 at 16 39 00](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/0af57699-e23f-4234-865d-288efb9b1171)
![WhatsApp Image 2023-12-16 at 16 39 00 (3)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/30d556e1-48a2-4c65-af9e-03bb8ff94354)
![WhatsApp Image 2023-12-16 at 16 39 00 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/469d40c4-4e58-4270-9c44-6021a362dd26)
![WhatsApp Image 2023-12-16 at 16 39 00 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/92ac08ab-25a1-4645-9037-ddb18c3c7db0)
![WhatsApp Image 2023-12-16 at 16 38 59](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/be5e116d-8ac6-4d10-97d9-a157920696b3)
![WhatsApp Image 2023-12-16 at 16 38 59 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/6dae533a-fc8a-4632-9534-5af9ae16bf85)
![WhatsApp Image 2023-12-16 at 16 38 59 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/8ca511f4-813e-49e1-bb98-9adf56b64740)
![WhatsApp Image 2023-12-16 at 16 38 58](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/58a1baac-d101-4a1e-a590-6a33fbf6fd26)
![WhatsApp Image 2023-12-16 at 16 38 58 (3)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/fab2d9bb-e109-4e90-9ad4-03753d3f3f24)
![WhatsApp Image 2023-12-16 at 16 38 58 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/d0093a4d-11ca-442d-b2dc-c14574010664)
![WhatsApp Image 2023-12-16 at 16 38 58 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/589a6eeb-045f-4818-b7ba-9bd27dc04eee)
![WhatsApp Image 2023-12-16 at 16 38 57](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/72397470-c8a4-4f03-9f60-30218e2f51e0)
![WhatsApp Image 2023-12-16 at 16 38 57 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/e47c2b62-57e8-4d7c-a0a6-572c674bd53a)
![WhatsApp Image 2023-12-16 at 16 38 55](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/e58c120b-c1de-41d1-ad04-6f905f2d66e6)
![WhatsApp Image 2023-12-16 at 16 38 55 (3)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/13d57bbc-dbd8-4865-a624-9d0cc095867b)
![WhatsApp Image 2023-12-16 at 16 38 55 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/b4b330e0-193f-4246-a3d5-26bdaeca81d5)
![WhatsApp Image 2023-12-16 at 16 38 55 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/db9c3498-d3cc-4441-9252-a817a19a46f6)
![WhatsApp Image 2023-12-16 at 16 38 54](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/f7f0164b-e460-4b34-8ab1-25bdfb255ab9)
![WhatsApp Image 2023-12-16 at 16 38 54 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/8a4b1060-8608-4110-8614-41e54e9fa894)
![WhatsApp Image 2023-12-16 at 16 38 15](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/087773db-1ab7-4bc5-bea0-8f9d433d97aa)
![WhatsApp Image 2023-12-16 at 16 38 14](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/84277822-3e82-4d46-b463-aa239e3d85eb)
![WhatsApp Image 2023-12-16 at 16 38 14 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/a3bf7ea3-e8a5-4726-bab5-5abca7a3e982)
![WhatsApp Image 2023-12-16 at 16 38 14 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/09c496cd-ca64-4a76-a0be-7862a50d2112)
![WhatsApp Image 2023-12-16 at 16 37 57](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/25986578-3201-487d-baeb-87880fa1e500)
![WhatsApp Image 2023-12-16 at 16 37 57 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/8d2905aa-7507-497c-9377-e0c7a2bd2f98)
![WhatsApp Image 2023-12-16 at 16 37 56](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/27da657b-fca8-4262-94b4-ff2ef3a931a8)
![WhatsApp Image 2023-12-16 at 16 37 56 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/65d20f49-8b78-41f5-9137-62d282e2ba6c)
![WhatsApp Image 2023-12-16 at 16 37 56 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/aa5ced84-3c8f-488a-ad2e-65797f303390)

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
- **LA RAIZ** no posee descendientes directos o posee al menos dos.
- **UN NODO CON** x descendietes directos directos contiene x-1 elementos
- **TODOS LOS NODOS TERMINALES** Se encuentran al mismo nivel

#### Arbol B

Son arboles multicamino con una construcción especial que permite mantenerlos balanceados a bajo costo

- **NODOS TERMINALES** Tienen como 
    - **minimo** [M/2]-1 Elementos y como 
    - **maximo** M-1 Elementos

**Inserción**

Todos los elementos de datos se insertan en los nodos terminales. Por ese motivo es necesario realizar H lecturas para poder encontrar el nodo donde el elemento será almacenado (desde la raiz hasta un nodo temrinal)

Si tengo lugar en el nodo, se inserta normal (siempre ordenado)

Si no se produce overflow, solo hago una escritura. En caso de overflow, como se divide el nodo, se necesita la escritura de dos nodos en el nivel terminal, mas la escritura de la raiz.

Si se produce overflow

- Se crea un nodo nuevo..
- La primera mitad de las claves se mantienen en el nodo viejo.
- La segunda mitad de las claves se trasladan al nodo nuevo.
- La menor de las claves de la segunda mitad se promociona al nodo padre.

**Busqueda**

El procceso de busqueda realiza el mismo proceso que la inserción

- Se comienza desde el nodo raiz, se procede a buscar el elemento en cuestión

**Eficiencia de busqueda**: Consiste en contar los accesos al archivo de datos, que se requieren para localizar un elemento o para determinar que el elemento no se encuentra.

El resultado es un valor acotado en el rango entero [1, H], siendo H la altura del árbol, tal como fuera definida previamente. 

Si el elemento se encuentra ubicado en el nodo raíz, la cantidad de **accesos requeridos es 1**. En caso de localizar al elemento en un nodo terminal, (o que el elemento no se encuentre), **serán requeridos H accesos**

**Eliminación**

Para poder eliminar un elemento el mismo debe estar en un nodo terminal.

Si es un nodo interno, se intercambia con el mayor de sus claves menores, o la menor de sus claves menores.

Existes dos situaciones 

- Si se elimina un elemento del nodo terminal y los elementos restantes no están por debajo de la cantidad minima [M/2]-1, no se genera **underflow**
- Cuando se produce **underflow** por tener menos que el minimo
    - La opción más inmediata es la **concatenación**, pero el nodo no puede superar la cantidad maxima de elementos.
    - La otra opción es la **redistribución** plantea que algun nodo adyacente hermano ceda elementos al nodo que precenta insuficiencia (La ventaja es que no cambia la cantidad de nodos)


**Eficiencia en la eliminación**

- **Mejor caso** Cuando se borra un elemento del nodo y no tiene insuficiencia
    - H Lecturas y 1 Escritura
- **Peor caso** Cuando se borra un elemento del nodo y tiene insuficiencia
    - 2*H-1 Lecturas y H-1 Escrituras

**Actualización**

Es pensar en una baja mas un alta de un elemento.



#### Nodos Hermanos

Son aquellos nodos que tienen el mismo nodo padre

#### Nodos adyacentes hermanos

Son aquellos nodos que, siendo hermanos, son además dependientes de punteros consecutivos del padre.

#### Arbol B*

Es casi igual al **arbol B** pero en lugar de dividir y generar un nuevo nodo en los casos de overflow, este mismo distribuye en esos casos. Al crear menos nodos, el arbol tarda más en aumentar de altura.

En saturación reubica sus elementos en un nodo adyacente hermano. Cuando no sea posible esta redistribución, se estará en una situación donde tanto el nodo que genera overflow como su adyacente hermano están completos. Esto abre la posibilidad de dividir partiendo de dos nodos completos en dos terceras partes (2/3)

- **NODOS TERMINALES** Tienen, como 
    - **minimo** [(2M-1)/3]-1 Elementos y como 
    - **maximo** M-1 Elementos
- **NODOS NO TERMINALES NI RAIZ** Tienen, como 
    - **minimo** (2M-1)/3 Descendientes

***Busqueda**

Es igual que el arbol B

***Baja***

Es igual que el arbol B

***Inserción***

Tenemos diferentes formas de aplicar la redistribución
- Politica de un lado
- Politica de un lado u otro lado
- Politica de un lado y otro lado

### Acceso secuencial Indizado

Es aquel que permite dos formas de visualizar la información 

- **Indizada**: El archivo puede verse como un conjunto de registros, ordenados por una clave o llave.
- **Secuencial**: Se puede acceder secuencialmente al archivo, con registros físicamente contiguos y ordenados nuevamente por una clave o llave

#### Arboles B+

Los arboles anteriores nos permiten recuperar elementos en forma ordenada a bajo costo, sin necesitad de reacomodamientos fisicos costosos.

Ahora necesitamos un mecanismo que nos permita localizar los datos contenidos en los nodos a bajo costo

La estructura intermedia se denomina **arbol B** e incorpora las caracteristicas discutidas para árboles B, ademas del tratamiento secuencial ordenado del archivo.

**Importante:** Se pueden realizar busquedas aleatorias rapidas de información, en conjunto con acceso secuencial eficiente

**SOLO ACCESO SECUENCIAL NO BUSQUEDA**

- Los nodos terminales representan un conjunto de datos y son enlazados entre ellos.

**Insetar**

- **Sin Overflow** no pasa nada
- **Con Overflow** el nodo se divide, y se crea una copia de la menor de las claves del hijo derecho. Solo ante la saturación de un nodo terminal se promociona una copia, en caso contrario, se promociona el elemento normal.

#### Árbol B+ de prefijos simples

Es un arbol B+ donde los separadores estar representados por la mínima expresión posible de la clave, que permite decidir si la busqueda se realiza hacia la izquierda o hacia la derecha

**LOS ARBOLES SON IMPORTANTES PARA BUSQUEDAS ALEATORIAS Y ACCESO SECUENCIAL**

---

## Resumen capitulo 8


### Dispersión (Hashing)

**Definiciones**
- Tecnica para generar dirección base única para una clave dada. La **dispersión** se usa cuando se requiere acceso rápido mediante una clave.
- Técnica que convierte la clave asociada a un registro de datos en un numero aleatorio, el cual posteriormente es utilizado para determinar dónde se almacena dicho registro.
- Técnica de almacenamiento y recuperación que usa una función para mapear registros en direcciones de almacenamiento secundario.

**Ventajas**

- Inserción y Borrado más eficientes (en promedio un acceso)
- Para busquedas lo mismo, en promedio es 1

**Desventajas**
- No es posible aplicar HASHING sobre registros de longitud variable
- No es posible obtener un orden logico de los datos. Los indices imponen la propiedad de orden, esto en hashing no es posible.
- No es posible tratar con claves duplicadas( No se puede aplicar una función de hash sobre una clave secundaria)

#### Tipos de Dispersión (Hashing)

**Hashing con espacio de direccionamiento Estatico**: Es aquella politica donde el espacio disponible para dispersar los registros de un archivo de datos está fijado previamente.

Asi, la función de hash aplicada a una clave da como resultado una dirección física posible dentro del espacio disponible para el archivo.

**Hashing con espacio de direccionamiento Dinamico**: Es aquella politica donde el espacio disponible para dispersar los registros de un archivo de datos aumenta o disminuye en función de las necesidades de espacio que en cada momento tiene el archivo. 

Asi, la función de hash aplicada a una clave da como resultad un valor intermedio que sera utilizado para obtener la dirección física posible para el archivo. Estas direcciones físicas no están establecidas a priori y son generadas de manera dinámica.

#### Parametros de disperción

- **Función de hash**
- **Tamaño de cada nodo de almacenamiento**
- **Densidad de empaquetamiento**
- **Metodos de tratamiento de desbordes (overflow)**

#### Función de hash

Es una función que transforma un valor, que representa una llave primaria de un registro, en otro valor dentro de un determindo rango, que se utiliza como dirección fisica de acceso para insertar un registro en un archivo de datos.

#### Densidad de empaquetamiento

Es la relación entre el espacio disponible para el archivo de datos y la cantidad de registros que integran dicho archivo

---

>> Me fui a rendir, ya fue
