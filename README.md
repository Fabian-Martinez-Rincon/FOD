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

</td></tr></table>

<img src= 'https://i.gifer.com/origin/8c/8cd3f1898255c045143e1da97fbabf10_w200.gif' height="20" width="100%">

> [!IMPORTANT]
> Todas las preguntas van a estar justificadas segun el libro [Introducción a las Bases de Datos](/Introducción%20a%20las%20Bases%20de%20Datos%20-%20Bertone-Thomas.pdf) y mi sentido común


<div align='center'>

# Finales 

![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWd6dmU4eHZmZ3N3dTA0NTIxMmplNHphMjV5YnlsYThsOW9pczRpZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o7TKSxdQJIoiRXHl6/giphy.gif)

</div>

> [!NOTE]  
> Es un recopilatorio de preguntas que estan marcadas por la catedra

## Temario de Preguntas

- [Archivos](#archivos)
- [Indices](#indices)
- [Arboles](#arboles)
- [Hashing]()

> [!TIP]
> La strat del final este es responder 7/10 preguntas, porque tenes margen para errarle en 2 preguntas :D


## Archivos

> [!IMPORTANT]  
> Siempre se selecciona UNA SOLA respuesta

<table><tr><th>Registro de Longitud Fija</th><th>Registro de Longitud Variable</th></tr>

<tr><td>

- Marca de fin del archivo (EOF)
- Información siempre homogénea
    - Enteros (2bytes)
    - Caracteres (1bytes)
    - Registro (Suma de los campos)
- Altas y Bajas más comodas
- Desperdicio de espacio (en grandes cantidades)
- Lectura y Escritura más rápida

</td><td>

- Marca de fin del archivo (EOF)
- Cada campo debe descomponerse 
    - caracter x caracter
    - cifra x cifra
- Delimitador para Campos # y Registros @ 
- Lectura y Escritura más lenta (de a un caracter)

</td></tr>
</table>


Un archivo con registro de longitud variable

- [ ] a. Puede estar ordenado por algun criterio 
- [ ] b. Debe estar ordenado por algun criterio 
- [ ] c. Nunca puede ordenarse por algun criterio 
- [ ] d. Puede tener un carácter delimitador, por ejemplo & 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>

Algunas de las anteriores

> a, d

</details>

---


Un archivo en el cual se accede a un registro luego de acceder a su predecesor en orden físico 

- [ ] a. puede ser un archivo serie 
- [ ] b. puede ser un archivo secuencial 
- [ ] c. debe ser un archivo serie 
- [ ] d. debe ser un archivo secuencial 
- [ ] e. algunas de las anteriores son correctas 
- [ ] f. ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>

Debe ser un archivo serie

> Sin ningún orden preestablecido más que el físico, donde, para acceder a un registro determinado, se deben visitar todos los registros previos en el orden en que estos fueron almacenados.

Secuencial es la forma de acceder a un archivo (no un tipo de archivo)

</details>

---

Un archivo con registro de longitud fija 

- [ ] a. Puede tener un delimitador de fin de registro 
- [ ] b. Debe tener un delimitador de fin de registro 
- [ ] c. Puede tener registros del mismo tamaño 
- [ ] d. Puede tener registros con distinto tamaño 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>

La respuesta correcta es: Ninguna de las anteriores 

No es puede tener registros del mismo tamaño, es DEBE tener registros del mismo tamaño (Estricto)

</details>

---

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

> [!CAUTION]
> Consultar respecto al orden de los archivos

Para realizar un algoritmo de actualización maestro-detalle 

- [ ] a. Se requiere al menos 2 archivos. 
- [ ] b. Se requiere que los archivos estén ordenados 
- [ ] c. Se requiere que los archivos estén desordenados 
- [ ] d. Se requiere que al menos uno de los archivos esté ordenado 
- [ ] e. Se requiere que los archivos tengan la misma estructura 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

 
<details><summary>👀 Respuesta</summary>

La respuesta correcta es: Se requiere al menos 2 archivos. 

### Justificación

Presenta la variante más simple del proceso de actualización. Las precondiciones del problema son las siguientes:

- Existe un archivo maestro.
- Existe un único archivo detalle que modifica al maestro.
- Cada registro del detalle modifica a un registro del maestro. Esto  significa que solamente aparecerán datos en el detalle que se correspondan con datos del maestro. Se descarta la posibilidad de generar altas en ese archivo.
- No todos los registros del maestro son necesariamente modificados.
- Cada elemento del maestro que se modifica es alterado por uno y 
solo un elemento del archivo detalle.
- Ambos archivos están ordenados por igual criterio. Esta precondición, considerada esencial, se debe a que hasta el momento se trabaja con archivos de datos de acuerdo con su orden físico. Más adelante, se discutirán situaciones donde los archivos respetan un orden lógico de datos.


> El proceso de actualización finaliza cuando se termina de recorrer el  archivo detalle. Una vez procesados todos los registros del archivo  detalle, el algoritmo finaliza, sin la necesidad de recorrer el resto del  archivo maestro.

</details>

---

<table>
<tr>
<th>Fragmentación Interna</th>
<th>Fragmentación Externa</th>
</tr>
<tr>
<td>Se produce cuando a un elemento de dato se le asigna mayor espacio del necesario. (Casi siempre en Registros con Longitud Fija , pero la tecnica de primer y mejor ajuste tambien la producen en Registros con Longitud Dinamica)</td>
<td>
Se denomina fragmentación externa al espacio disponible entre dos registros, pero que es demasiado pequeño para poder ser reutilizado (La puede generar la tecnica de peor ajuste en Registros con Longitud Dinamica)
</td>
</tr>
</table>

El concepto de fragmentación interna en un archivo

- [ ] a. Se puede dar solo en registros de longitud fija 
- [ ] b. Se puede dar solo en registros de longitud variable 
- [ ] c. Se puede dar solo en archivos ordenados de longitud variable 
- [ ] d. Se puede analizar solamente en archivos ordenados de longitud fija 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

Para que tenga sentido un algoritmo de corte de control 

- [ ] a. El archivo no necesita estar ordenado
- [ ] b. El archivo puede estar ordenado 
- [ ] c. El archivo puede estar organizado por dispersión
- [ ] d. El archivo debe estar organizado por dispersión 
- [ ] e. El archivo necesita al menos un índice asociado 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 


<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

La operación RESET() 

- [ ] a. Se realiza luego de la operación REWRITE() 
- [ ] b. Se realiza previo a la operación ASSIGN() 
- [ ] c. Abre un archivo para leer o escribir 
- [ ] d. Abre un archivo sólo para escribir 
- [ ] e. Abre un archivo 

<details><summary>👀 Respuesta</summary>

Abre un archivo

No es leer o escribir, es leer y escribir

</details>

---

La operación REWRITE() 

a. Se realiza luego de la operación RESET() 
b. Se realiza previo a la operación ASSIGN() 
c. Abre un archivo para leer o escribir 
d. Abre un archivo sólo para leer 
e. Abre un archivo 

<details><summary>👀 Respuesta</summary>
Abre un archivo

Solo lo abre en modo escritua

</details>

---

### Recuperación de espacio

El proceso de baja lógica marca la información de un archivo como  borrada. Ahora bien, esa información sigue ocupando espacio en el  disco rígido. La pregunta a responder sería: ¿qué hacer con dicha  información? Esta pregunta tiene dos respuestas posibles:

<table>
<tr>
<th>Recuperación de espacio</th>
<th>Reasignación de espacio</th></tr><tr>
<td>Periódicamente utilizar el proceso de  baja física para realizar un proceso de compactación del archivo. El  mismo consiste en quitar todos aquellos registros marcados como  borrados, utilizando para ello cualquiera de los algoritmos discutidos  anteriormente para borrado físico</td>
<td>

Otra alternativa posible consiste en recuperar el espacio, utilizando los lugares indicados como borrados para el ingreso (altas) de nuevos elementos al archivo
</td>

</tr>
</table>

> [!CAUTION]
> Consultar justificación

El proceso de alta de registro con recuperación de espacio 

- [ ] a. Se debe realizar con registros de longitud variable 
- [ ] b. Se debe realizar con registros de longitud fija 
- [ ] c. Se realiza sólo con registros de longitud fija 
- [ ] d. Se realiza solo con registros de longitud variable 
- [ ] e. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores

> Es ninguna porque no existe recuperación de espacio con altas, es reasignación de espacio
</details>

---

El proceso de baja lógica

- [ ] a. Esta diseñado para borrar un registro de un archivo 
- [ ] b. Necesita que el archivo este ordenado 
- [ ] c. Necesita que el archivo este desordenado 
- [ ] d. Se aplica solamente a archivos con registros con longitud fija 
- [ ] e. Se aplica solamente a archivos con registros con longitud variable 
- [ ] f. Todas las anteriores 
- [ ] g. Alguna de las anteriores

<details><summary>👀 Respuesta</summary>
Esta diseñado para borrar un registro de un archivo
</details>

---

Mientras que con registros de longitud fija los elementos a eliminar e insertar son del mismo tamaño, utilizando registros de longitud variable esta precondición no está presente. Para insertar un elemento no basta con disponer de lugar; es necesario, además, que el lugar sea del tamaño suficiente

El proceso de inserción debe localizar el lugar dentro del archivo más  adecuado al nuevo elemento. Existen tres formas genéricas para la  selección de este espacio:

<table>
  <tr>
    <th>Primer ajuste</th>
    <th>Mejor ajuste</th>
    <th>Peor ajuste</th>
  </tr>
  <tr>
    <td>Consiste en seleccionar el primer espacio disponible donde quepa el registro a insertar.</td>
    <td>Consiste en seleccionar el espacio más adecuado para el registro. Se considera el espacio más adecuado como aquel de menor tamaño donde quepa el registro.</td>
    <td>Consiste en seleccionar el espacio de mayor tamaño, asignando para el registro solo los bytes necesarios</td>
  </tr>
</table>

La tecnica de primer ajuste 

- [ ] a. asigna un registro nuevo (alta) en un la posición que quepa de tamaño menor 
- [ ] b. asigna un registro nuevo (alta) en un la posición que quepa de tamaño mayor 
- [ ] c. asigna el registro al final del archivo si no hay lugar en posiciones intermedias 
- [ ] d. Todas las anteriores son correctas 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas 


<details><summary>👀 Respuesta</summary>
Asigna el registro al final del archivo si no hay lugar en posiciones intermedias
</details>

---

La técnica de altas reutilizando espacio borrado, conocida como mejor ajuste, en archivos de longitud fija: 

- [ ] a. asigna al registro en el primer espacio que encuentra donde quepa 
- [ ] b. asigna el registro en el espacio donde quepa, de tamaño menor 
- [ ] c. asigna el registro en el espacio donde quepa, de tamaño mayor 
- [ ] d. algunas de las anteriores 
- [ ] e. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores

> Las tecnicas de **Ajustes** solo se dan en archivos de longitud variable
</details>

---

> [!CAUTION]
> No tengo mucha idea sobre la justificación

Dado un archivo con registros de longitud fija. Suponga que tiene un indice correspondiente a una clave univoca. 

Suponga que se crea un arbol de orden 200 para almacenar ese indice univoca. Si archivo y el arbol generado tuvieran 300 elementos insertados entonces: 

- a. si se creara un arbol b tendria la misma altura que crear un arbol b* 
- b. si se creara un arbol b tendria mayor altura que un arbol b* 
- c. si se creara un arbol b tendria menor altura que un arbol b* 
- d. no tengo datos suficientes para contestar la pregunta 

<details><summary>👀 Respuesta</summary>
si se creara un arbol b tendria la misma altura que crear un arbol b* 
</details>


---

> [!CAUTION]
> Dudas sobre la respuesta dada

Una clave permite

- [ ] a. identificar un elemento particular dentro de un archivo 
- [ ] b. reconocer un conjunto de elementos con igual valor 
- [ ] c. ordenar logicamente al archivo por los atributos que la componen 
- [ ] d. todas las anteriores son validas 
- [ ] e. algunas de las anteriores son validas 
- [ ] f. ninguna de las anteriores es valida 

<details><summary>👀 Respuesta</summary>
algunas de las anteriores son valida

> La **a** sabes que es, pero con las otras dos tengo dudas
</details>

---

El acceso promedio para recuperar un dato en un archivo desordenado

- [ ] a. Tiene orden lineal. 
- [ ] b. Tiene orden logarítmico. 
- [ ] c. Tiene orden constante (uno). 
- [ ] d. Las opciones a y b son correctas. 
- [ ] e. Ninguna opción es correcta. 

<details><summary>👀 Respuesta</summary>
Tiene orden lineal.
</details>

---

El concepto de framentación externa en un archivo

- [ ] a. Se da solo en registros de longitud fija 
- [ ] b. Se da solo en registros de longitud variable 
- [ ] c. Se da en archivos ordenados de longitud variable 
- [ ] d. Se debe analizar solamente en archivos ordenados de longitud fija 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Se da solo en registros de longitud variable
</details>

---

El proceso de alta de registro por ajuste optimo

- [ ] a. Se puede realizar con registros de longitud fija 
- [ ] b. Se debe realizar con registros de longitud fija 
- [ ] c. Se puede realizar con registros de longitud variable 
- [ ] d. Se debe realizar con registros de longitud variable 
- [ ] e. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores

> No existe el ajusto optimo, troleado :,(
</details>

---

En el caso de realizar una alta de un registro

- [ ] a. se reaprovecha algún espacio de registro dado de baja previamente 
- [ ] b. se puede reaprovechar algún espacio de registro dado de baja previamente 
- [ ] c. se debe reaprovechar si los registros son de longitud fija 
- [ ] d. se debe reaprovechar si los registros son de longitud variable 
- [ ] e. algunas de las anteriores son correctas 
- [ ] f. ninguna de las anteriores son correctas

<details><summary>👀 Respuesta</summary>
se puede reaprovechar algún espacio de registro dado de baja previamente 
</details>

---

La tecnica de primer ajuste

- [ ] a. permite borrar elementos de un archivo que contiene registros de longitud fija 
- [ ] b. permite borrar elementos de un archivo que contiene registros de longitud variable 
- [ ] c. permite hacer baja logica 
- [ ] d. permite hacer baja fisica 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas

<details><summary>👀 Respuesta</summary>
Ninguna de las respuestas anteriores son validas

> LAS TECNICAS SON DE ALTAS NO DE BAJAS!!!!!!!!
</details>

---

La tecnica de mejor ajuste

- [ ] a. permite borrar elementos de un archivo que contiene registros de longitud fija 
- [ ] b. permite borrar elementos de un archivo que contiene registros de longitud variable 
- [ ] c. permite hacer baja logica 
- [ ] d. permite hacer baja fisica 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas

<details><summary>👀 Respuesta</summary>
Ninguna de las respuestas anteriores son validas

> LAS TECNICAS SON DE ALTAS NO DE BAJAS!!!!!!!!

![image](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/067569cb-254f-4e1f-9077-001fc7601638)

</details>

---

El algoritmo de actualizacion maestro – detalle 

- [ ] a. Solo se puede implementar si los archivos (maestro y detalles) estan ordenados 
- [ ] b. Solo se puede implementar si el archivo maestro esta ordenado 
- [ ] c. Solo se puede implementar si los archivos detalles estan ordenados 
- [ ] d. Solo se puede implementar si los archivos (maestro y detalles) estan desordenados 
- [ ] e. Todas las anteriores 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores

> NO IMPORTA ABSOLUTAMENTE NINGUN TIPO DE ORDEN (SI ESO)
</details>

---

Fragmentación interna es:

- [ ] a. aquella que se produce cuando un elemento de dato se le asigna mayor espacio del necesario 
- [ ] b. el espacio disponible entre dos registros, disponible pero no utilizado 
- [ ] c. el espacio disponible entre dos registros, disponible y utilizado 
- [ ] d. algunas de las anteriores defienen fragmentación interna 
- [ ] e. ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>
aquella que se produce cuando un elemento de dato se le asigna mayor espacio del necesario
</details>

---

> CUALQUIER TIPO DE ARCHIVOS PUEDEN TENER CUALQUIER TIPO DE REGISTROS (Fija o Variable)

Un archivo directo

- [ ] a. debe contener registros de longitud fija 
- [ ] b. debe contener registros de longitud variable 
- [ ] c. puede contener registros de longitud fija 
- [ ] d. puede contener registros de longitud variable 
- [ ] e. permite que a y b sean correctas 
- [ ] f. permite que a y c sean correctas 
- [ ] g. permite que c y d sean correctas 
- [ ] h. permite que b y d sean correctas 

<details><summary>👀 Respuesta</summary>
Permite que c y d sean correctas
</details>

---

<table>
<tr><th>Archivo directo</th><th>Archivo serie</th></tr><tr>
<td>

Es un archivo en el cual cualquier registro puede ser accedido sin acceder antes a otros registros, es decir, cualquier registro puede ser accedido directamente

</td>
<td>

En cambio, un registro está disponible solo cuando el 
registro predecesor fue procesado
</td>
</tr>

</table>

Un archivo directo

a. permite acceso secuencial unicamente 
b. permite acceso secuencia indizado 
c. permite acceso directo 
d. respeta a, b y c 
e. no tengo datos suficientes para contestar 

<details><summary>👀 Respuesta</summary>
permite acceso directo
</details>

---

Para que tenga sentido un algoritmo de corte de control 

- [ ] a. El archivo no necesita estar ordenado 
- [ ] b. El archivo puede estar ordenado 
- [ ] c. El archivo puede estar organizado por dispersión 
- [ ] d. El archivo debe estar organizado por dispersión 
- [ ] e. El archivo necesita al menos un índice asociado 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

Para realizar un algoritmo de actualización maestro-detalle

- [ ] a. Se requiere al menos 2 archivos. 
- [ ] b. Se requiere que los archivos estén ordenados 
- [ ] c. Se requiere que los archivos estén desordenados 
- [ ] d. Se requiere que al menos uno de los archivos esté ordenado 
- [ ] e. Se requiere que los archivos tengan la misma estructura 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>
Se requiere al menos 2 archivos.
</details>

---

El acceso promedio para recuperar un dato en un archivo desordenado: 

- [ ] a. Tiene orden lineal. 
- [ ] b. Tiene orden logarítmico. 
- [ ] c. Tiene orden constante (uno). 
- [ ] d. Las opciones a y b son correctas. 
- [ ] e. Ninguna opción es correcta. 

<details><summary>👀 Respuesta</summary>
Tiene orden lineal.
</details>

---

Un algoritmo de corte de control 

- [ ] a. Se puede aplicar sobre un archivo con registros de longitud fija 
- [ ] b. Se puede aplicar sobre un archivo con registros de longitud variable 
- [ ] c. Se aplica sobre un archivo con registros de longitud fija 
- [ ] d. Se aplica sobre un archivo con registros de longitud variable 
- [ ] e. Todas las anteriores son correctas 
- [ ] f. Algunas de las anteriores son correctas 
- [ ] g. Ninguna de las anteriores son correctas 

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores son correctas

> Al corte de control le importa un bledo como esten los registros, solo nos importa el contenido
</details>

---

El acceso promedio para recuperar un dato en un archivo desordenado:

- [ ] a. Puede tener orden lineal. 
- [ ] b. Puede tener orden logarítmico. 
- [ ] c. Tiene orden constante (uno). 
- [ ] d. Las opciones a y b son correctas. 
- [ ] e. Ninguna opción es correcta. 

<details><summary>👀 Respuesta</summary>

Ninguna opción es correcta

> NO ES **Puede tener orden lineal.** ES **Tiene orden lineal.**
</details>

---

> [!CAUTION]
> La respuesta es rara

El proceso de merge de archivos

- [ ] a. Requiere que todos los archivos estén ordenados 
- [ ] b. Requiere que todos los archivos estén ordenados por el mismo criterio XXXX
- [ ] c. Puede realizarse con los archivos ordenados 
- [ ] d. No puede realizarse sin los archivos ordenados 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Puede realizarse con los archivos ordenados
</details>

---

> [!NOTE]
> En todas las tecnicas en caso de no haber lugar, la alta se realiza al final del archivo

La tecnica de mejor ajuste

- [ ] a. asigna un registro nuevo (alta) en un la posición que quepa de tamaño menor 
- [ ] b. asigna un registro nuevo (alta) en un la posición que quepa de tamaño mayor 
- [ ] c. asigna el registro al final del archivo si no hay lugar en posiciones intermedias 
- [ ] d. Todas las anteriores son correctas 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas 

<details><summary>👀 Respuesta</summary>
Algunas de las respuestas anteriores son correctas
</details>

---

La tecnica de primer ajuste

- [ ] a. se aplica a archivos con registro de longitud fija 
- [ ] b. se aplica a archivos con registro de longitud variable 
- [ ] c. se combina con la tecnica de baja fisica de datos 
- [ ] d. Todas las anteriores son correctas 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas

<details><summary>👀 Respuesta</summary>
Se aplica a archivos con registro de longitud variable 
</details>

---

La tecnica de mejor ajuste

- [ ] a. permite borrar elementos de un archivo que contiene registros de longitud fija 
- [ ] b. permite borrar elementos de un archivo que contiene registros de longitud variable 
- [ ] c. permite hacer baja logica 
- [ ] d. permite hacer baja fisica 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas 

<details><summary>👀 Respuesta</summary>
Ninguna de las respuestas anteriores son validas

> LAS TECNICAS SON DE ALTAS NO DE BAJAS!!!!!!!!

![image](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/067569cb-254f-4e1f-9077-001fc7601638)

</details>

---

El proceso de alta de registro por Peor Ajuste

- [ ] a. Se puede realizar con registros de longitud fija
- [ ] b. Se debe realizar con registros de longitud fija
- [ ] c. Se puede realizar con registros de longitud variable 
- [ ] d. Se debe realizar con registros de longitud variable
- [ ] e. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>
Se debe realizar con registros de longitud variable
</details>

---

Para que tenga sentido un algoritmo de corte de control 

- [ ] a. El archivo debe estar ordenado 
- [ ] b. El archivo puede estar ordenado 
- [ ] c. El archivo puede estar organizado por dispersión 
- [ ] d. El archivo debe estar organizado por dispersión 
- [ ] e. El archivo necesita al menos un índice asociado 
- [ ] f. Algunas de las anteriores
- [ ] g. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>
El archivo debe estar ordenado 
</details>

---

> [!CAUTION]
> Puede ser serie y secuencial pero pensaba que solo existian archivos serie y secuencial es solo un tipo de acceso

Un archivo en el cual se accede a un registro luego de acceder a su predecesor en algún orden 

- [ ] a. puede ser un archivo serie 
- [ ] b. puede ser un archivo secuencial 
- [ ] c. debe ser un archivo serie 
- [ ] d. debe ser un archivo secuencial 
- [ ] e. algunas de las anteriores son correctas 
- [ ] f. ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores son correctas
</details>

---

El concepto de framentación interna en un archivo

- [ ] a. Se puede dar solo en registros de longitud fija 
- [ ] b. Se puede dar solo en registros de longitud variable 
- [ ] c. Se puede dar solo en archivos ordenados de longitud variable 
- [ ] d. Se puede analizar solamente en archivos ordenados de longitud fija 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

La tecnica de primer ajuste 

- [ ] a. permite borrar elementos de un archivo que contiene registros de longitud fija 
- [ ] b. permite borrar elementos de un archivo que contiene registros de longitud variable 
- [ ] c. permite hacer baja logica 
- [ ] d. permite hacer baja fisica 
- [ ] e. Algunas de las respuestas anteriores son correctas 
- [ ] f. Ninguna de las respuestas anteriores son validas 

<details><summary>👀 Respuesta</summary>

Ninguna de las respuestas anteriores son validas

> LAS TECNICAS SON DE ALTAS NO DE BAJAS!!!!!!!!

</details>

---

El proceso de baja lógica 

- [ ] a. Esta diseñado para borrar un registro de un archivo 
- [ ] b. Necesita que el archivo este ordenado 
- [ ] c. Necesita que el archivo este desordenado 
- [ ] d. Se aplica solamente a archivos con registros con longitud fija 
- [ ] e. Se aplica solamente a archivos con registros con longitud variable 
- [ ] f. Todas las anteriores 
- [ ] g. Alguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Esta diseñado para borrar un registro de un archivo
</details>

---

> [!CAUTION]
> Necesito otro confirmación je

El proceso de alta de registro con recuperación de espacio 

- [ ] a. Se debe realizar con registros de longitud variable 
- [ ] b. Se debe realizar con registros de longitud fija 
- [ ] c. Se realiza sólo con registros de longitud fija 
- [ ] d. Se realiza solo con registros de longitud variable 
- [ ] e. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores

> Es ninguna porque no existe recuperación de espacio con altas, es reasignación de espacio
</details>

---

El proceso de baja lógica

- [ ] a. Esta diseñado para borrar un registro de un archivo 
- [ ] b. No Necesita que el archivo este ordenado 
- [ ] c. Necesita que el archivo este desordenado 
- [ ] d. Se aplica solamente a archivos con registros con longitud fija 
- [ ] e. Se aplica solamente a archivos con registros con longitud variable 
- [ ] f. Todas las anteriores 
- [ ] g. Alguna de las anteriores

<details><summary>👀 Respuesta</summary>
Alguna de las anteriores
</details>

---

## Indices

> [!CAUTION]
> Dudas sobre la estructura lineal (con un ejemplo)

Supóngase el problema de buscar un tema en un libro; independientemente de si este estuviera ordenado por temas, la acción natural sería buscar el material deseado en el índice temático del libro, y luego, acceder directamente a la página que se incluya en dicho índice. Es de notar que en este caso se busca la información en una fuente de datos adicional (el índice), que es de tamaño considerablemente menor, para luego acceder directamente a dicha información.

Un indice primario 

- [ ] a. Se puede generar a partir de una clave unívoca de un registro 
- [ ] b. Se puede generar a partir de una clave no unívoca de un registro 
- [ ] c. Puede implementarse con una estructura de datos lineal 
- [ ] d. Debe implementarse con una estructura eficiente no lineal 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Puede implementarse con una estructura de datos lineal
</details>

---

**Indices Secundarios (sacado del libro!)**

La pregunta que seguramente surgió al buscar el compositor de la canción “Here Come The Rain Again” por la clave primaria (ARI2313) es cómo saber este dato, la clave primaria. No es natural ni intuitivo solicitar un dato por clave primaria, sino por el nombre de la canción o eventualmente por autor, que son atributos mucho más fáciles de recordar. Estos atributos, nombre de canción o autor, podrían contener  valores repetidos en el archivo original. Por este motivo, no es posible  pensarlos como parte de una clave primaria. La clave que soporta valores repetidos se denomina clave secundaria.

Por lo tanto, es necesario crear otro tipo de índice mediante el cual se pueda acceder a la información de un archivo, pero con datos fáciles de recordar. De esta manera surge el uso de índices secundarios.

---

En un índice secundario

- [ ] a. Encontrar un registro es a veces mas lento que sobre un indice primario 
- [ ] b. Encontrar un registro es igual de rápido que sobre un indice primario 
- [ ] c. Encontrar un registro puede ser mas rápido que sobre un indice primario 
- [ ] d. si la clave a buscar no se repitiera puede ser igual de rapida su búsqueda que en un indice unívoco 
- [ ] e. Algunas de las anteriores son validas 
- [ ] f. ninguna de las anteriores son validas

<details><summary>👀 Respuesta</summary>
ninguna de las anteriores son validas

> En comparacíon nunca es mas rapido que un indice primario ya que se requieren dos accesos desde un indice secundario, mientras que desde un indice primario solo se requiere uno

</details>

---

Sea un problema donde un indice correspondiente a una clave unívoca se implementa como un arbol balanceado. 

- [ ] a. el archivo de datos debe ser de registros de longitud fija 
- [ ] b. el archivo de datos puede ser de registros de longitud variable 
- [ ] c. el archivo de datos no puede admitir bajas con recuperación de espacio 
- [ ] d. las opciones a y b son correctas 
- [ ] e. las opciones a y c son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. ninguna opción es correcta 

<details><summary>👀 Respuesta</summary>
el archivo de datos puede ser de registros de longitud variable

> El archivo de datos puede tener cualquier tipo de registros, no importa
</details>

---

> [!CAUTION]
> COMO QUE NO ES NINGUNA

Un índice secundario tiene eficiencia de búsqueda 

- [ ] a. lineal 
- [ ] b. logaritmica 
- [ ] c. contante y es 1 
- [ ] d. constante y pude tender a 1 
- [ ] e. Algunas de las anteriores son validas 
- [ ] f. ninguna de las anteriores son validas

<details><summary>👀 Respuesta</summary>
ninguna de las anteriores son validas
</details>

---

Sea un archivo de alumnos, que maneja registros de **longitud fija** y que utiliza la **técnica de primer** ajuste para recuperar espacio en el caso de borrado. Si se implementa un indice por clave unívoca legajo 

- [ ] a. se puede generar un arbol b para implantar ese indice 
- [ ] b. se puede generar un arbol b* para implantar ese indice 
- [ ] c. se puede generar un arbol b+ para implantar ese indice 
- [ ] d. se puede implantar un arbol b+ de prefijos simples para implantar ese indice 
- [ ] e. Todas las opciones anteriores son correctas 
- [ ] f. algunas de las opciones anteriores son correctas 
- [ ] g. la pregunta es inconsistente no hay respuestas correctas 

<details><summary>👀 Respuesta</summary>
la pregunta es inconsistente no hay respuestas correctas

> Longitud fija y las tecnicas no van de la mano
</details>

---

> [!CAUTION]
> No seria se puede sino que seria, tiene que generar a partir de una clave unívoca?

Un indice primario 

- [ ] a. Se puede generar a partir de una clave unívoca de un registro 
- [ ] b. Se puede generar a partir de una clave no unívoca de un registro 
- [ ] c. Puede implementarse con una estructura de datos lineal 
- [ ] d. Debe implementarse con una estructura eficiente no lineal 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>

Puede implementarse con una estructura de datos lineal
</details>

---

## Arboles

**Libro**

> [!CAUTION]
> Siento que faltan datos

Suponga que se genera un árbol binario para implantar un indice de un archivo. El indice es por la clave unívoca legajo que ocupa 10 bytes. Entonces, cada nodo del árbol ocupara:

- [ ] a. 18 bytes 
- [ ] b. a lo sumo 18 bytes 
- [ ] c. mas de 21 bytes 
- [ ] d. 10 bytes 
- [ ] e. ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
mas de 21 bytes
</details>

---

> [!CAUTION]
> Se supone que  no puede saber si un arbol tiende a llenarse?

Cuando un arbol B tiende a llenarse 

- [ ] a. se debe procurar mas espacio para el archivo que lo contiene, reacomodando todos los nodos 
- [ ] b. se debe procurar mas espacio para el archivo que lo contiene, reacomodando el nodo padre y sus hermanos 
- [ ] c. se debe procurar mas espacio para el archivo 
- [ ] d. todas las anteriores 
- [ ] e. algunas de las anteriores 
- [ ] f. ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
ninguna de las anteriores
</details>

---

- M : Orden del árbol
- H : Altura del árbol

> La eficiencia de búsqueda en un árbol B consiste en contar los 
accesos al archivo de datos, que se requieren para localizar un elemento o para determinar que el elemento no se encuen

### Propiedades que comparten los 3 tipos de arboles

> [!WARNING]  
> En Arboles B se habla sobre descendientes directos mientras que en B* y B+ se habla sobre descendientes (SOLO)

- **1)** Cada nodo del árbol puede contener, como máximo, M descendientes y M-1 elementos.
- **2)** La raíz no posee descendientes directos o tiene al menos dos.
- **3)** Un nodo con x descendientes directos contiene x-1 elementos.
- **6)** Todos los nodos terminales se encuentran al mismo nivel.

<table>
<tr><th>Árboles B</th><th>Árboles B* (Variante del B)</th><th>Árboles B+</th></tr>
<tr><td>

Los árboles B son árboles multicamino con una construcción especial que permite mantenerlos balanceados a bajo costo.

</td>
<td>

Precisamente, la algorítmica que planteara Knuth define una alternativa para los casos de overflow. Así, antes de dividir y generar nuevos nodos se dispone de una variante, redistribuir también ante una saturación.
</td>
<td>

La estructura intermedia resultante se denomina árbol B+ e incorpora las características discutidas para árboles B, además del tratamiento secuencial ordenado del archivo. Así, se podrán realizar búsquedas aleatorias rápidas de información, en conjunto con acceso secuencial eficiente.
</td></tr>
<tr>
<td>


- **4)** Los nodos terminales (hojas) tienen, como mínimo, [M/2] – 1 elementos, y como máximo, M-1 elementos.
- **5)** Los nodos que no son terminales ni raíz tienen, como mínimo, [M / 2] elementos.


</td>
<td>

- **4)** Los nodos terminales tienen, como mínimo, [(2M-1)/3] -1 elementos, y como máximo, M-1 elementos.
- **5)** Los nodos que no son terminales ni raíz tienen, como mínimo, [(2M-1) / 3] descendientes.

</td>
<td>

- **4)** Los nodos terminales tienen, como mínimo, ([M/2] – 1) elementos, y como máximo, M-1 elementos.
- **5)** Los nodos que no son terminales ni raíz tienen, como mínimo, [M/2] descendientes.
- **7)** Los nodos terminales representan un conjunto de datos y son enlazados entre ellos.

</td>
</tr>

</table>

> Es esta última propiedad la que establece la principal diferencia entre un árbol B y un árbol B+. Para poder realizar acceso secuencial ordenado a todos los registros del archivo, es necesario que cada elemento (clave asociada a un registro de datos) aparezca almacenado en un nodo terminal. Así, los árboles B+ diferencian los elementos que constituyen datos de aquellos que son separadores


Un Arbol B+ 

- [ ] a. Siempre tiene más claves que un árbol B, para el mismo archivo de datos 
- [ ] b. Siempre tiene más claves que un árbol B*, para el mismo archivo de datos 
- [ ] c. Siempre es mas alto que un árbol B 
- [ ] d. Siempre es más alto que un árbol B* 
- [ ] e. Todas de las anteriores 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

> [!NOTE]
> EL PREFIJO SIMPLE ES SOLO DEL B+

El agregado de la opción prefijos simples a un árbol B+ intenta 
aprovechar mejor el uso de espacio físico

Un árbol B+ de prefijos simples es un árbol B+ donde los separadores están representados por la mínima expresión posible de la clave, que permita decidir si la búsqueda se realiza hacia la izquierda o hacia la derecha.

| Arbol B+ | Arbol B+ de prefijos simples |
|---|---|
| ![image](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/eb40a046-7ed1-4a72-a5ac-f4e3587cf20a) | ![image](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/3c44cefd-1bcd-4b3a-90ea-1f4c202b0293) |

---

Suponga que el nodo terminal de un arbol B+ de prefijos simples de orden 7 tiene las claves GONZALEZ, GOÑEZ, GOODMAN, GOPLANI, GORBA y en dicho nodo se inserta una clave nueva GUTIERREZ, entonces: 

 

- [ ] a. se produce overflow, y luego de dividir, al padre del nodo se sube la clave GOP 
- [ ] b. se produce overflow, y luego de dividir, al padre del nodo se sube la clave GOO 
- [ ] c. se produce overflow, y luego de dividir se sube la clave GO 
- [ ] d. Todas las anteriores pueden ser correctas, depende el algoritmo utilizado 
- [ ] e. a y b pueden se correctas, dependen del algoritmo utilizado 
- [ ] f. a y c pueden ser correctas, dependen del algoritmo utilizado 
- [ ] g. b y c pueden ser correctas, dependen del algoritmo utilizado 
- [ ] h. ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores es correcta

> Ya que al ser de orden 7, y tener 5 claves, no se produce overflow
</details>

---

> Se debe tener en cuenta que otra de las propiedades de los árboles B determina que todos los elementos de datos se insertan en los nodos  terminales

Cuando se inserta un elemento en un árbol binario 

- [ ] a. siempre se crea un nuevo nodo 
- [ ] b. siempre es necesario acceder al nivel hoja 
- [ ] c. puede siempre insertarse a derecha del padre 
- [ ] d. Puede aumentar la altura del árbol 
- [ ] e. Todas las anteriores son validas 
- [ ] f. algunas de las anteriores son validas 
- [ ] g. ninguna de las anteriores son validas 

<details><summary>👀 Respuesta</summary>
Todas las anteriores son validas 
</details>

---

> [!CAUTION]
> para para para, como que la D no es?

un arbol balanceado de orden 200 

- [ ] a. se desbalancea cuando la raiz es el unico nodo del arbol y esta produce overflow en una inserción. 
- [ ] b. puede contener un nodo con 99 hijos y 99 claves 
- [ ] c. dos nodos adyacentes hermanos, de diferente padre, pueden estar completos, es decir con 199 elementos 
- [ ] d. todos los nodos terminales están a la misma distancia de todos los nodos raiz 
- [ ] e. todas las anteriores son correctas 
- [ ] f. algunas de las anteriores son correctas 
- [ ] g. ninguna de las anteriores son correctas 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores son correctas
</details>

---

Un arbol b de orden 130 

- [ ] a. puede tener la raiz con solamente dos hijos 
- [ ] b. tienen todos los nodos terminales en igual nivel 
- [ ] c. puede tener todos sus nodos ocupados en al menos 2/3 de su capacidad 
- [ ] d. Todas las anteriores son correctas 
- [ ] e. las opciones a y b son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. las opciones a y c son correctas 
- [ ] h. ninguna opción es correcta 

<details><summary>👀 Respuesta</summary>
Todas las anteriores son correctas
</details>

---

Suponga que sobre un nodo de un árbol B* se produce overflow. En dicho caso se puede

a. Aplicar saturación progresiva encadenada 
b. Aplicar doble dispersión 
c. Aplicar un área de desborde separada para el nodo 
d. Redistribución 
e. Division 
f. Toddas las anteriores 
g. Algunas de las anteriores 
h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores
</details>

---

Un árbol que se encuentra balanceado 

- [ ] a. Puede ser un arbol binario 
- [ ] b. Puede ser un árbol multicamino 
- [ ] c. Puede ser un árbol B+ 
- [ ] d. Puede ser un árbol B* 
- [ ] e. Todas las anteriores son correctas 
- [ ] f. c y de son correctas 
- [ ] g. b, c y d son correctas 
- [ ] h. b y d son correctas 
- [ ] i. Ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Todas las anteriores son correctas
</details>

---

La eficiencia de de búsqueda de una clave en un arbol b+ es

- [ ] a. de orden lineal 
- [ ] b. de orden logaritmico similar a un arbol b 
- [ ] c. de orden logaritmico, similar a un arbol b* 
- [ ] d. de orden fijo, dado que los elementos de los nodos terminales estan linkeados juntos 
- [ ] e. las respuestas a, b y c son correctas 
- [ ] f. las respuestas b, c y d son correctas 
- [ ] g. las respuestas b y c son correctas 
- [ ] h. ninguna de las respuestas anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Las respuestas b y c son correctas 
</details>

---

> [!CAUTION]
> Creo que hay más de una falsa

Cuales de las siguientes propiedades no corresponde a un arbol b* de orden M

- [ ] a. Cada nodo del arbol puede contener maximo M descendientes y M-1 elementos 
- [ ] b. La raiz no posee descendientes o posee [M/2] descendientes
- [ ] c. Todos los nodos terminales se encuentran al mismo nivel
- [ ] d. Los nodos no terminales ni raiz tienen mas de [M/2] y a lo sumo M descendientes (Tengo dudas con esta)
- [ ] e. Un nodo con x descendientes contienen x-1 elementos

<details><summary>👀 Respuesta</summary>
La raiz no posee descendientes o posee [M/2] descendientes

> Es o posee 2 descendientes
</details>

---

Un árbol binario 

- [ ] a. puede tener eficiencia de búsqueda logaritmica 
- [ ] b. puede estar balanceado si tiene 127 elementos 
- [ ] c. puede tener eficiencia de búsqueda lineal 
- [ ] d. todas las anteriores son correctas 
- [ ] e. algunas de las anteriores son validas 
- [ ] f. ninguna de las anteriores son validas 

<details><summary>👀 Respuesta</summary>
Todas las anteriores son correctas

> 2^h - 1 = 127 Que es lo que tiene un arbol binario balanceado
> para h = 7
</details>

---

Cuales de las siguientes propiedades no corresponde a un arbol b* de orden M 

- [ ] a. Cada nodo del arbol puede contener maximo M descendientes y M-1 elementos 
- [ ] b. La raiz no posee descendientes o posee [M/2] descendientes 
- [ ] c. Todos los nodos terminales se encuentran al mismo nivel 
- [ ] d. Los nodos no terminales ni raiz tienen mas de [M/2] y a lo sumo M descendientes 
- [ ] e. Un nodo con x descendientes contienen x-1 elementos

<details><summary>👀 Respuesta</summary>
La raiz no posee descendientes o posee [M/2] descendientes
</details>

---

> [!CAUTION]
> Necesito un ejemplo visual loco

Dado un arbol b* de orden 100

- [ ] a. el nodo raíz pude tener solamente 3 hijos en algun momento de su construcción 
- [ ] b. un nodo terminal puede producir un underflow, si al borrar un elemento quedan 48 en el nodo 
- [ ] c. puede ser que un nodo terminal con 50 elementos, tenga 51 hijos
- [ ] d. todas las respuestas anteriores son correctas 
- [ ] e. las opciones a y b son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. las opciones a y c son correctas 
- [ ] h. ninguna opción anteirior es correcta 

<details><summary>👀 Respuesta</summary>
el nodo raíz pude tener solamente 3 hijos en algun momento de su construcción
</details>

---

Una inserción en un nodo cualquiera (terminal) de arbol b

- [ ] a. puede generar overflow 
- [ ] b. puede generar división de un solo nodo 
- [ ] c. pueden dividirse tres nodos 
- [ ] d. todas las anteriores son correctas 
- [ ] e. las dos primeras son correctas 
- [ ] f. la segunda y tercera son correctas 
- [ ] g. la primera y la tercera son correctas


<details><summary>👀 Respuesta</summary>
Todas las anteriores son correctas
</details>

---

Dado un arbol b de prefijos simples de orden 100 

- [ ] a. un nodo entra en underflow si se borra un elemento y solo quedan 48 
- [ ] b. un nodo no terminal ni raiz tendrá al menos [M/2] hijos 
- [ ] c. puede ser que la raiz tenga solamente dos hijos en algun momento 
- [ ] d. todas las anteriores son correctas 
- [ ] e. algunas de las anteriores son correcta 
- [ ] f. ninguna de las anteriores son correctas 

<details><summary>👀 Respuesta</summary>
Todas las anteriores son correctas
</details>

---


***PALABRAS DEL LIBRO***

> [!NOTE] 
> Es probable que el lector haya implementado algoritmos de árboles binarios sobre memoria RAM. Sin embargo, para poder utilizar estas ideas como soporte de índices de búsqueda, es necesario que los árboles binarios se implanten sobre almacenamiento secundario.

Un arbol b 

- [ ] a. puede ser un arbol AVL
- [ ] b. puede guardarse en memoria RAM 
- [ ] c. puede implementar una clave no univoca 
- [ ] d. puede tener acceso secuencial eficiente y rápido 
- [ ] e. Todas las anteriores son correctas 
- [ ] f. Algunas de las anteriores son correctas 
- [ ] g. ninguna de las anteriores son correctas 

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores son correctas
</details>

---

> [!CAUTION]
> La e es sobre el arbol B*

Cuales de las siguientes propiedades NO corresponde a un arbol b+ de orden M 

- [ ] a. cada nodo del arbol puede contener como maximo M descendientes y M-1 elementos 
- [ ] b. la raiz no posee descendientes o tiene al menos dos 
- [ ] c. un nodo con x descendientes tiene x-1 elementos 
- [ ] d. los nodos terminales tiene como maximo M-1 elementos 
- [ ] e. los nodos no terminales pueden contener como minimo [ 2M/3 ] descendientes 
- [ ] f. los nodos no terminales puede contener como minimo [M/2] descendientes 
- [ ] g. todas las respuestas anteriores corresponden a propiedades de arboles b+

<details><summary>👀 Respuesta</summary>
Todas las espuestas anteriores corresponden a propiedades de arboles b+
</details>

---

> [!CAUTION]
> Como se que se tiende a llenar?

Cuando un arbol B+ de prefijos simples tiende a llenarse 

- [ ] a. se debe procurar mas espacio para el archivo que lo contiene, reacomodando todos los nodos 
- [ ] b. se debe procurar mas espacio para el archivo que lo contiene, reacomodando el nodo padre y sus hermanos 
- [ ] c. se debe procurar mas espacio para el archivo 
- [ ] d. todas las anteriores 
- [ ] e. algunas de las anteriores 
- [ ] f. ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

Un Arbol B+ 

- [ ] a. Siempre tiene más claves que un árbol B, para el mismo archivo de datos 
- [ ] b. Siempre tiene más claves que un árbol B*, para el mismo archivo de datos 
- [ ] c. Siempre es mas alto que un árbol B 
- [ ] d. Siempre es más alto que un árbol B* 
- [ ] e. Todas de las anteriores 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

Un árbol avl

- [ ] a. tiene eficiencia de búsqueda logaritmica 
- [ ] b. puede tener eficiencia de búsqueda logarítmica 
- [ ] c. puede tener eficiencia de búsqueda lineal 
- [ ] d. Las opciones a y b son correctas 
- [ ] e. Las opciones b y c son correctas 
- [ ] f. Las opciones a y c son correctas 
- [ ] g. Ninguna opción es correcta

<details><summary>👀 Respuesta</summary>
tiene eficiencia de búsqueda logaritmica
</details>

---

Dado un arbol b* de orden 100

- [ ] a. el nodo raíz pude tener solamente 3 hijos en algun momento de su construcción 
- [ ] b. un nodo terminal puede producir un underflow, si al borrar un elemento quedan 48 en el nodo 
- [ ] c. puede ser que un nodo terminal con 50 elementos, tenga 51 hijos 
- [ ] d. todas las respuestas anteriores son correctas 
- [ ] e. las opciones a y b son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. las opciones a y c son correctas 
- [ ] h. ninguna opción anteirior es correcta 

<details><summary>👀 Respuesta</summary>
el nodo raíz pude tener solamente 3 hijos en algun momento de su construcción
</details>

---

Un árbol que se encuentra balanceado 

- [ ] a. Puede ser un arbol binario 
- [ ] b. Puede ser un árbol multicamino 
- [ ] c. Puede ser un árbol B+ 
- [ ] d. Puede ser un árbol B* 
- [ ] e. Todas las anteriores son correctas 
- [ ] f. c y de son correctas 
- [ ] g. b, c y d son correctas 
- [ ] h. b y d son correctas 
- [ ] i. Ninguna de las anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Todas las anteriores son correctas
</details>

---

> [!CAUTION]
> Para mi tambien es la b

La eficiencia de busqueda de un arbol b

- [ ] a. es de orden lineal
- [ ] b. puede ser de orden lineal, bajo alguna circunstancia del arbol generado
- [ ] c. es de orden logaritmico
- [ ] d. es de orden constante (orden del arbol)
- [ ] e. b y c son correctas
- [ ] f. b, c y d son correctas 
- [ ] g. ninguna opción es correcta

<details><summary>👀 Respuesta</summary>
Es de orden logaritmico
</details>

---

> [!CAUTION]
> Preguntar sobre la pregunta c y d

Un árbol B+ de prefijos simples 

- [ ] a. A veces no tiene prefijos 
- [ ] b. Puede no tener prefijos simples 
- [ ] c. Si tiene prefijos simples, las hojas están enlazadas 
- [ ] d. Sino tiene prefijos simples, las hojas están enlazadas 
- [ ] e. Todas las anteriores 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Todas las anteriores
</details>

---

Un Arbol B+ 

- [ ] a. Al realizar un inserción, puede tener nodos hojas con underflow 
- [ ] b. Al realizar una baja, puede tener nodos hojas con overflow 
- [ ] c. Al realizar un inserción, puede requerirse concatenación 
- [ ] d. Al realizarse una baja, puede requerirse división 
- [ ] e. Al realizarse un alta puede requerirse redistribución 
- [ ] f. Todas las anteriores 
- [ ] g. Algunas de las anteriores 
- [ ] h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores
</details>

---

Dado un arbol b de orden 100 

- [ ] a. el nodo raíz puede tener solamente 3 hijos en algun momento de su construcción 
- [ ] b. El proceso de borrar un elemento del nodo raiz, puede producir un underflow en un nodo terminal 
- [ ] c. puede ser que un nodo terminal con 50 elementos, tenga 51 hijos 
- [ ] d. todas las respuestas anteriores son correctas 
- [ ] e. las opciones a y b son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. las opciones a y c son correctas 
- [ ] h. ninguna opción anteirior es correcta 

<details><summary>👀 Respuesta</summary>
Las opciones a y b son correctas
</details>

---

Dado un archivo con registros de longitud fija. Suponga que tiene un indice correspondiente a una clave univoca. Suponga que se crea un arbol de orden 200 para almacenar ese indice univoca. Si archivo y el arbol generado tuvieran 300 elementos insertados entonces: 

- [ ] a. un arbol b tiene la misma cantidad de nodos que un arbol b* creado para la misma finalidad 
- [ ] b. un arbol b tiene mas cantidad de nodos que un arbol b* creado para la misma finalidad 
- [ ] c. un arbol b tiene menos cantidad de nodos que un arbol b* creado para la misma finalidad 
- [ ] d. no tengo datos suficientes para contestar la pregunta 


<details><summary>👀 Respuesta</summary>
no tengo datos suficientes para contestar la pregunta
</details>

---

> [!CAUTION]
> Preguntar o mirar de nuevo

Un arbol b* 

- [ ] a. todos los nodos menos la raiz seguro estan llenos a 2/3 de su capacidad en todo momento 
- [ ] b. los nodos terminales puede, en situaciones especiales, tener menos de 2/3 de su capacidad ocupada 
- [ ] c. el nodo adyacente hermano de uno que entra en overflow siempre se puede usar para redistribuir, si no estuviera completo 
- [ ] d. todas las anteriores son correctas 
- [ ] e. las opciones a y b son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. las opciones a y c son correctas 
- [ ] h. ninguna opción es correcta 


<details><summary>👀 Respuesta</summary>
La respuesta correcta es: los nodos terminales puede, en situaciones especiales, tener menos de 2/3 de su capacidad ocupada 
</details>

---

Cuando un arbol B+ de prefijos simples tiende a llenarse 

- [ ] a. se debe procurar mas espacio para el archivo que lo contiene, reacomodando todos los nodos 
- [ ] b. se debe procurar mas espacio para el archivo que lo contiene, reacomodando el nodo padre y sus hermanos 
- [ ] c. se debe procurar mas espacio para el archivo 
- [ ] d. todas las anteriores 
- [ ] e. algunas de las anteriores 
- [ ] f. ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
ninguna de las anteriores
</details>

---

> [!CAUTION]
> Tengo dudas

Un arbol b es mas eficiente que un arbol b+ 

- [ ] a. porque tiene un algoritmo de inserción mas eficiente 
- [ ] b. porque tiene un algoritmo de borrado mas eficiente 
- [ ] c. porque tiene un algoritmo de busqueda mas eficiente 
- [ ] d. no, un arbol b no es más eficiente que un arbol b+ 
- [ ] e. por todas las anteriores 
- [ ] f. por algunas de las anteriores 
- [ ] g. por ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
por ninguna de las anteriores
</details>

---

Un Arbol B+ 

- [ ] a. Al realizar un inserción, puede tener nodos hojas con underflow 
- [ ] b. Al realizar una baja, puede tener nodos hojas con overflow 
- [ ] c. Al realizar un inserción, puede requerirse concatenación 
- [ ] d. Al realizarse una baja, puede requerirse división 
- [ ] e. Al realizarse un alta puede requerirse redistribución 
- [ ] f. Todas las anteriores 
- [ ] g. Algunas de las anteriores 
- [ ] h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores

> Te juega con la gramatica, es sentido común
</details>

---

Un arbol b+ de prefijos simples de orden M 

- [ ] a. se puede aplicar a una clave unica, cuyo atributo es un string 
- [ ] b. se puede aplicar a una clave secundaria, cuyo atributo es un storing 
- [ ] c. se puede aplicar a una clave primaria, cuyo atributo es un entero 
- [ ] d. se puede aplicar solamente a una clave unívoca, cuyo atributo es string 
- [ ] e. todas las anteriores son correctas 
- [ ] f. a y b son las opciones correctas 
- [ ] g. a, c y d son las opciones correctas 
- [ ] h. a, b y d son las opciones correctas 
- [ ] i. ninguna de las opciones que tengo es correcta 

<details><summary>👀 Respuesta</summary>
a y b son las opciones correctas
</details>

---

## Hashing

#### densidad de empaquetamiento

> Se define la Densidad de Empaquetamiento (DE) como la relación entre el espacio disponible para el archivo de datos y la cantidad de registros que integran dicho archivo.

Cuales de los siguientes parámetros no corresponde a hashing 

- a. Función de hash 
- b. Tamaño del nodo (capacidad para almacenar registros) 
- c. Densidad de busqueda 
- d. Forma de tratar los desbordes 
- e. Todas las anteriores corresponden 

<details><summary>👀 Respuesta</summary>

Densidad de busqueda 

### Justificación

El método de dispersión, cuando utiliza espacio de direccionamiento estático, presenta cuatro parámetros esenciales que definen su comportamiento. En este apartado, se abordan estos parámetros y se analiza con detalle la influencia que ejercen sobre el método.


Los cuatro parámetros a estudiar son los siguientes:
- Función de hash.
- Tamaño de cada nodo de almacenamiento.
- Densidad de empaquetamiento.
- Métodos de tratamiento de desbordes (overflow).

</details>

---

> [!CAUTION]
> Consultar cuales

Cual de los siguientes parámetros afecta la eficiencia de la dispersión 

- [ ] a. Cantidad de elementos del archivo 
- [ ] b. Cantidad de espacio para almacenar el archivo 
- [ ] c. Densidad de Empaquetamiento x
- [ ] d. Función de Dispersión x
- [ ] e. Algoritmos para el tratamiento de registros sinónimos 
- [ ] f. Todas las anteriores 
- [ ] g. Algunas de las anteriores 
- [ ] h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores

> istribuir los registros de la forma más aleatoria posible. Las colisiones se presentan cuando dos o más claves compiten por la misma dirección física de memoria. Para ello, se debe buscar una función de dispersión que distribuya su resultado de la forma más aleatoria posible
</details>

---

> [!CAUTION]
> SOLO EXISTE FRAGMENTACIÓN INTERNA

Un archivo tratado con hash estatico, que tiene una densidad de empaquetamiento del 10% 

- [ ] a. tiene mucha fragmentación interna 
- [ ] b. tiene mucha fragmentación externa 
- [ ] c. presenta un nivel de colisiones bajo 
- [ ] d. presenta un nivel de overflow bajo 
- [ ] e. Todas las anteriores son correctas 
- [ ] f. las opciones b y c son correctas 
- [ ] g. las opciones a y c son correctas 
- [ ] h. las opciones a, c y d son correctas 
- [ ] i. las opciones b,c y d son correctas 
- [ ] j. ninguna opción es correcta 

<details><summary>👀 Respuesta</summary>
las opciones a, c y d son correctas

Por el contrario, si la DE se mantiene baja, se dispone de mayor espacio para esparcir registros y, por ende, disminuye la probabilidad de colisiones.

Por otra parte, cuando la DE se mantiene baja, se desperdicia espacio en el disco, dado que se utiliza menor espacio que el reservado, generando fragmentación.

</details>

---

La función de hashing 

- [ ] a. Afecta a la densidad de empaquetamiento 
- [ ] b. Puede afectar a la densidad de empaquetamiento
- [ ] c. Afecta la densidad de empaquetamiento sólo en casos especiales 
- [ ] d. Afecta la densidad de empaquetamiento en la mayoría de los casos 
- [ ] e. Todas las anteriores 
- [ ] f. Algunas de las anteriores 
- [ ] g. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores


Esta función debe esparcir los registros de la manera más uniforme posible, es decir, que a cada clave se le asigne una dirección física distinta.

No tiene nada que ver una cosa con la otra

</details>

---

La técnica de Area de desoborde por separado: 

- [ ] a. Utiliza un área de memoria separada para las claves en overflow.
- [ ] b. Reduce la densidad de empaquetamiento. 
- [ ] c. Utiliza una segunda función de dispersión siempre que se desee almacenar un registro en un archivo.
- [ ] d. Solo se aplica a la dispersión extensible. 
- [ ] e. Ayuda a predecir la cantidad de claves en overflow. 
- [ ] f. Hay más de una opción correcta. 
- [ ] g. Ninguna de las opciones anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Utiliza un área de memoria separada para las claves en overflow.
</details>

---

El metodo de area de desborde separada 

- [ ] a. Reubica los registros en overflow 
- [ ] b. Utiliza una segunda funcion de hash en caso de ser necesaria 
- [ ] c. Puede generar areas de overflow dentro del archivo 
- [ ] d. Todas las anteriores son validas 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores. 

<details><summary>👀 Respuesta</summary>
Reubica los registros en overflow 
</details>

---

Si se tiene una política de hash con espacio de direccionamiento dinámico 


- [ ] a. la densidad de empaquetamiento puede ser mayor que 1 
- [ ] b. cuando la densidad de empaquetemiento supera el 75% se debe reacomodar al archivo 
- [ ] c. cuando la densidad de empaquetamiento supera el 75% se debe utilizar mas espacio para nodos 
- [ ] d. cuando la densidad de empaquetamiento supera el 75% debe activarse una política de tratamiento de overflow, como por ejemplo area de desborde separado 
- [ ] e. Algunas de las anteriores son validas 
- [ ] f. ninguna de las anteriores son validas 

<details><summary>👀 Respuesta</summary>

Ninguana de las anteriores son validas

Se denomina hashing con espacio de direccionamiento dinámico a aquella política donde el espacio disponible para dispersar los registros de un archivo de datos aumenta o disminuye en función de las necesidades de espacio que en cada momento tiene el archivo.

</details>

---

A partir de un archivo dispersado con hashing extensible

- [ ] a. Siempre es posible agregar elementos al archivo X
- [ ] b. Algunas veces no es posible agregar elementos al archivo 
- [ ] c. Se puede utilizar Saturación Progresiva Encadenada para tratar registros en saturación 
- [ ] d. No se puede utilizar Dispersión Doble para tratar registros en saturación
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores
</details>

---

#### Sacado del libro

> El principal problema que se tiene con los métodos dinámicos en general y con el hash extensible en particular es que las direcciones de nodos no están prefijadas a priori, y por lo tanto la función de hash no puede retornar una dirección fija. Entonces, es necesario cambiar la política de trabajo de la función de dispersión.

#### Ejemplo

Suponga que la función de hash retorna 32 bits. En ese caso es posible direccionar 2(Elevado)32 direcciones de nodos diferentes, si fuera necesario. 

Si se tiene en cuenta que cada dirección podría almacenar 100 registros, por ejemplo, la cantidad de claves a dispersar es importante.

La tecnica de hashing extensible 

- [ ] a. No utiliza una función de hash porque debe cambiar dinámicamente 
- [ ] b. No utiliza una función de hash porque encuentra los registros siempre en un acceso 
- [ ] c. Utiliza una función de hash pero esta función no devuelve la dirección donde guardar el registro 
- [ ] d. Utiliza area de desborde por separado para los registros en overflow 
- [ ] e. Todas las anteriores son validas 
- [ ] f. Las respuestas a y c son correctas 
- [ ] g. Las respuestas b y c son correctas 
- [ ] h. Las respuestas a, c y d son correctas 
- [ ] i. Ninguna es correcta 

<details><summary>👀 Respuesta</summary>

Utiliza una función de hash pero esta función no devuelve la dirección donde guardar el registro

</details>

---

> [!CAUTION]
> Puede tener un tratamiento de desbordes 

El hash con espacio de direccionamiento estatico 

- [ ] a. Puede tener densidad de empaquetamiento menor que uno 
- [ ] b. Puede tener un tratamiento de desbordes 
- [ ] c. Puede tener una funcion aleatoria y uniforme 
- [ ] d. Todas de las anteriores 
- [ ] e. Las opciones a y b son correctas 
- [ ] f. las opciones a y c son correctas 
- [ ] g. las opciones b y c son correctas 
- [ ] h. ninguna de las anteriores son correctas

<details><summary>👀 Respuesta</summary>
ninguna de las anteriores son correctas 
</details>

---

Si se quiere dispersar un archivo de 40.000 elementos 

- [ ] a. Se requiere un archivo de 40.000 cubetas 
- [ ] b. Se requiere un archivo de al menos 40.000 cubetas 
- [ ] c. Se requiere un archivo de menos de 40.000 cubetas 
- [ ] d. Todas las anteriores 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores

<details><summary>👀 Respuesta</summary>
NINGUNA DE LAS ANTERIORES
</details>

---

Si la densidad de empaquetamiento tiene a 1 ( o el 100%):

- [ ] a. Es conveniente utilizar dispersion doble para el tratamiento de overflow. 
- [ ] b. Se debe cambiar la función de dispersión. 
- [ ] c. Debe aumentarse el tamaño del archivo. 
- [ ] d. Debe aumentarse el tamaño de los nodos 
- [ ] e. Todas las anteriores son validas 
- [ ] f. Las opciones b y c son correctas 
- [ ] g. Las opciones b y d son correctas 
- [ ] h. Las opciones c y d son correctas 
- [ ] i. Las opciones b, c y d son correctas 
- [ ] j. Ninguna de las opciones anteriores es correcta. 

<details><summary>👀 Respuesta</summary>
Debe aumentarse el tamaño del archivo., Las opciones b y c son correctas

</details>

---

> Aquí se debe tener en cuenta que uno de los parámetros que afectan la eficiencia del hash, y que aún no se han discutido, es precisamente el método de tratamiento de colisiones

Cual de los siguientes parámetros afecta la eficiencia de la dispersión 

- [ ] a. Cantidad de elementos del archivo 
- [ ] b. Cantidad de espacio para almacenar el archivo 
- [ ] c. Densidad de Empaquetamiento 
- [ ] d. Función de Dispersión 
- [ ] e. Algoritmos para el tratamiento de registros en saturación 
- [ ] f. Todas las anteriores 
- [ ] g. Algunas de las anteriores 
- [ ] h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Todos los anteriores
</details>

---

![image](https://github.com/Fabo-University/FOD/assets/55964635/e098aaaf-54af-43d8-b003-5ed4ef4c9d4f)

Cual de los siguientes métodos sirve para el tratamiento de colisiones en hash estático 

> TODO ESTO ES DEL TRATAMIENTO DE OVERFLOW

- [ ] a. area de desborde por separado 
- [ ] b. saturación progresiva 
- [ ] c. saturación progresiva encadenada 
- [ ] d. doble dispersión 
- [ ] e. Todas las anteriores 
- [ ] f. ninguna de las anteriores son validas

<details><summary>👀 Respuesta</summary>
Ninguna de las anteriores son validas
</details>

---

El metodo de area de desborde por separado 

- [ ] a. Utiliza una segunda funcion de hash para ubicar los registros en saturación de un archivo 
- [ ] b. direcciona el overflow de un nodo a otro nodo diferente 
- [ ] c. Evita generar zonas contiguas de nodos en overflow 
- [ ] d. todas las anteriores son validas 
- [ ] e. Las opciones a y b son verdaderas 
- [ ] f. Las opciones a y c son verdaderas 
- [ ] g. Las opciones b y c son verdaderas 
- [ ] h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Las opciones b y c son verdaderas 
</details>

---

La tecnica de hashing extensible 

- [ ] a. No utiliza una función de hash porque debe cambiar dinámicamente 
- [ ] b. No utiliza una función de hash porque encuentra los registros siempre en un acceso 
- [ ] c. Utiliza una función de hash pero esta función no devuelve la dirección donde guardar el registro 
- [ ] d. Utiliza area de desborde por separado para los registros en overflow 
- [ ] e. Todas las anteriores son validas 
- [ ] f. Las respuestas a y c son correctas 
- [ ] g. Las respuestas b y c son correctas 
- [ ] h. Las respuestas a, c y d son correctas 
- [ ] i. Ninguna es correcta 

<details><summary>👀 Respuesta</summary>
Utiliza una función de hash pero esta función no devuelve la dirección donde guardar el registro
</details>

---

> [!CAUTION]
> Consultar Joaquina :,(

La eficiencia de búsqueda de un registro en un archivo organizado mediante dispersión estática : 

- [ ] a. Es de Orden lineal 
- [ ] b. tiende a uno 
- [ ] c. Siempre es uno 
- [ ] d. Es de Orden Logarítmico 
- [ ] e. Algunas de las anteriores son correctas 
- [ ] f. Ninguno de las opciones anteriores es correcta 

<details><summary>👀 Respuesta</summary>
Tiende a uno
</details>

---

A partir de un archivo dispersado con hashing extensible 

- [ ] a. Siempre es posible agregar elementos al archivo 
- [ ] b. Algunas veces no es posible agregar elementos al archivo 
- [ ] c. Se puede utilizar Saturación Progresiva Encadenada para tratar registros en saturación 
- [ ] d. No se puede utilizar Dispersión Doble para tratar registros en saturación 
- [ ] e. Algunas de las anteriores 
- [ ] f. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
Algunas de las anteriores
</details>

---

> [!CAUTION]
> COMO QUE NINGUNA

El hash con espacio de direccionamiento estatico

- [ ] a. Puede tener densidad de empaquetamiento menor que uno 
- [ ] b. Puede tener un tratamiento de desbordes 
- [ ] c. Puede tener una funcion aleatoria y uniforme 
- [ ] d. Todas de las anteriores 
- [ ] e. Las opciones a y b son correctas 
- [ ] f. las opciones a y c son correctas 
- [ ] g. las opciones b y c son correctas 
- [ ] h. ninguna de las anteriores son correctas 

<details><summary>👀 Respuesta</summary>
ninguna de las anteriores son correctas
</details>

---

# EL ESTATICO TIENDE A 1 Y EL DINAMICO ES 1

El metodo de doble dispersión, para el tratamiento de Colisiones 

- [ ] a. Utiliza una segunda funcion de hash para ubicar a todos los registros del archivo 
- [ ] b. Utiliza una segunda funcion de hash para ubicar algunos registros del archico 
- [ ] c. Evita generar zonas contiguas de nodos en overflow 
- [ ] d. todas las anteriores son validas 
- [ ] e. Las opciones a y b son verdaderas 
- [ ] f. Las opciones a y c son verdaderas 
- [ ] g. Las opciones b y c son verdaderas 
- [ ] h. Ninguna de las anteriores 

<details><summary>👀 Respuesta</summary>
qsy
</details>

---

La dispersión dinamica, denominata hash extensible: 

Seleccione una: 

 

- [ ] a. Siempre requiere el uso de una estructura auxiliar. 
- [ ] b. Guarda los registros de forma ordenada por algún criterio 
- [ ] c. Necesita de dos funciones de dispersión. 
- [ ] d. Varia el tamaño del espacio de direcciones disponible, sin afectar a la función de has 
- [ ] e. las opciones a y b son correctas 
- [ ] f. las opciones a y d son correctas 
- [ ] g. Ninguna de las opciones anteriores es correcta 

 

<details><summary>👀 Respuesta</summary>

La respuesta correcta es: las opciones a y d son correctas 

</details>


---

> [!WARNING]
> Ya estoy cansado jefe

# Examenes en imagenes



![WhatsApp Image 2023-12-16 at 16 39 02](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/a8deffe9-b4a4-4f84-bdf1-695ed6aac347)

- **1)** 
- **2)** 
- **3)** 
- **4)** 
- **5)** 


![WhatsApp Image 2023-12-16 at 16 39 02 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/83eada33-faa7-42e0-b94d-ef3189f6f92d)

- **1)** 
- **2)** 
- **3)** 
- **4)** 
- **5)** 


![WhatsApp Image 2023-12-16 at 16 39 01](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/b9f4ba65-064f-4f65-9d95-b591c8c17762)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**


![WhatsApp Image 2023-12-16 at 16 39 01 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/67be5cd8-7bcd-49d7-9e64-9e0165ac4f1b)

- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 39 01 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/233d0050-f4fc-4a46-929a-07396e1baa33)

- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 39 00](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/0af57699-e23f-4234-865d-288efb9b1171)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**
- **6)**
- **7)**

![WhatsApp Image 2023-12-16 at 16 39 00 (3)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/30d556e1-48a2-4c65-af9e-03bb8ff94354)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 39 00 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/469d40c4-4e58-4270-9c44-6021a362dd26)

- **23)**
- **24)**
- **25)**
- **26)**
- **27)**
- **28)**
- **29)**
- **30)**

![WhatsApp Image 2023-12-16 at 16 39 00 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/92ac08ab-25a1-4645-9037-ddb18c3c7db0)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 38 59](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/be5e116d-8ac6-4d10-97d9-a157920696b3)

- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 38 59 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/6dae533a-fc8a-4632-9534-5af9ae16bf85)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**
- **6)**

![WhatsApp Image 2023-12-16 at 16 38 59 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/8ca511f4-813e-49e1-bb98-9adf56b64740)

- **1)**
- **2)**
- **3)**
- **4)**


![WhatsApp Image 2023-12-16 at 16 38 58 (3)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/fab2d9bb-e109-4e90-9ad4-03753d3f3f24)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**
- **6)**

![WhatsApp Image 2023-12-16 at 16 38 58 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/d0093a4d-11ca-442d-b2dc-c14574010664)

- **7)**
- **8)**
- **9)**
- **10)**


![WhatsApp Image 2023-12-16 at 16 38 57](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/72397470-c8a4-4f03-9f60-30218e2f51e0)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 38 57 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/e47c2b62-57e8-4d7c-a0a6-572c674bd53a)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 38 55](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/e58c120b-c1de-41d1-ad04-6f905f2d66e6)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 38 55 (3)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/13d57bbc-dbd8-4865-a624-9d0cc095867b)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 38 55 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/b4b330e0-193f-4246-a3d5-26bdaeca81d5)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 38 55 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/db9c3498-d3cc-4441-9252-a817a19a46f6)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**


![WhatsApp Image 2023-12-16 at 16 38 54](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/f7f0164b-e460-4b34-8ab1-25bdfb255ab9)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 38 54 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/8a4b1060-8608-4110-8614-41e54e9fa894)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 38 15](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/087773db-1ab7-4bc5-bea0-8f9d433d97aa)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 38 14](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/84277822-3e82-4d46-b463-aa239e3d85eb)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 38 14 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/a3bf7ea3-e8a5-4726-bab5-5abca7a3e982)

- **6)**
- **7)**
- **8)**
- **9)**
- **10)**

![WhatsApp Image 2023-12-16 at 16 38 14 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/09c496cd-ca64-4a76-a0be-7862a50d2112)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**

![WhatsApp Image 2023-12-16 at 16 37 57](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/25986578-3201-487d-baeb-87880fa1e500)

- **23)**
- **24)**
- **25)**
- **26)**
- **27)**
- **28)**
- **29)**
- **30)**

![WhatsApp Image 2023-12-16 at 16 37 57 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/8d2905aa-7507-497c-9377-e0c7a2bd2f98)

- **9)**
- **10)**
- **11)**
- **12)**
- **13)**
- **14)**

![WhatsApp Image 2023-12-16 at 16 37 56](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/27da657b-fca8-4262-94b4-ff2ef3a931a8)

- **1)**
- **2)**
- **3)**
- **4)**


![WhatsApp Image 2023-12-16 at 16 37 56 (2)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/65d20f49-8b78-41f5-9137-62d282e2ba6c)

- **1)**
- **2)**
- **3)**
- **4)**
- **5)**
- **6)**
- **7)**

![WhatsApp Image 2023-12-16 at 16 37 56 (1)](https://github.com/Fabian-Martinez-Rincon/Fabian-Martinez-Rincon/assets/55964635/aa5ced84-3c8f-488a-ad2e-65797f303390)

- **15)**
- **16)**
- **17)**
- **18)**
- **19)**
- **20)**
- **21)**