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
> Las justificaciones son en base a mi criterio y tratando de reforsar con el libro (Puede haber errores)


<div align='center'>

# Finales 

![](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWd6dmU4eHZmZ3N3dTA0NTIxMmplNHphMjV5YnlsYThsOW9pczRpZSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o7TKSxdQJIoiRXHl6/giphy.gif)

</div>

> [!NOTE]  
> Es un recopilatorio de preguntas que estan marcadas por la catedra

- [Archivos](#archivos)
- [Indices]()
- [Arboles]()
- [Hashing]()

> [!TIP]
> Todas las preguntas van a estar justificadas segun el libro [Introducción a las Bases de Datos - Bertone-Thomas](/Introducción%20a%20las%20Bases%20de%20Datos%20-%20Bertone-Thomas.pdf)

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