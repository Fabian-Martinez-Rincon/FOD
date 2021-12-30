Indice
=================

<!--ts-->
   * [Base de Datos](#Base_de_Datos)
   * [Archivos](#Archivos)
   * [Indices](#Indices)
   * [Arboles](#Arboles)
   * [Hashing](#Hashing)

Base_de_Datos
=============

***¿Qué es una Base de Datos?***

- Es una colección de datos relacionados.
- Colección de ***archivos*** diseñado para servir a múltiples aplicaciones.
- Un dato representa hechos conocidos que pueden registrarse y que tienen un resultado implicito

***Propiedades implícitas de una BD:***

- Una ***BD*** representa algunos aspectos del mundo real, a veces denominado Universo de Discurso
- Una ***BD*** es una colección coherente de datos con significados inherentes. Un conjunto aleatorio de datos no puede considerarse una ***BD***. O sea los datos deben tener cierta lógica.
- Una ***BD*** se diseña, construye y complementa de datos para un propósito específico. Está destinada a un grupo de usuarios concretos y tiene algunos aplicaciones preconcebidas en las cuales están interesados los usuarios.
- Una ***BD*** está sustentada físicamente en archivos en dispositivos de almacenamiento persistente de datos.

Archivos
========

### Definiciones

- Colección de registros guardados en almacenamiento secundario.
- Colección de datos almacenados en dispositivos secundarios de memoria.
- Colección de registros que abarcan entidades con un aspecto común y originadas para algún propósito particular

### Hardware

- Almacenamiento primario
- Almacenamiento secundario (DR)
- Acceso a RAM vs Acceso a DR

### Organización

```Secuencia de bytes``` 
- No se puede determinar fácilmente comienzo y fin de cada dato.
- Archivos de texto

```Registros y Campos```
- Campo: Unidad más pequeña, lógicamente significativa de un archivo
- Registros: Conjunto de campos agrupados que definen un elemento del archivo

### Acceso

```Secuencial Físico: ``` Acceso a los registros uno tras otro y en el orden físico en el que están guardados

```Secuencial indizado (lógico): ```Acceso a los registros de acuerdo al orden establecido por otra estructura (Ej: una guía telefonica, o indice tematico de un libro)

```Directo: ``` Se accede a un registro determinado sin necesidad de haber accedido a los predecesores.
