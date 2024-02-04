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

> Todas las preguntas van a estar justificadas segun el libro [Introducción a las Bases de Datos](/Introducción%20a%20las%20Bases%20de%20Datos%20-%20Bertone-Thomas.pdf) y mi sentido común :D


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
> La strat del final este es responder 7 preguntas, porque tenes margen para errarle en 2 preguntas :D


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

> no tengo datos suficientes para contestar la pregunta