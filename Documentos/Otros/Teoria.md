<h1 align="center">Teoria 1</h1>

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

```Secuencial Físico:``` Acceso a los registros uno tras otro y en el orden físico en el que están guardados

```Secuencial indizado (lógico):``` Acceso a los registros de acuerdo al orden establecido por otra estructura (Ej: una guía telefonica, o indice tematico de un libro)

```Directo:``` Se accede a un registro determinado sin necesidad de haber accedido a los predecesores.

### Tipos

```De acuerdo a la forma de acceso```

- ***Serie:*** cada registro es accesible solo luego de procesar su antecesor, simples de acceder (acceso secuencial físico)
- ***Secuencial:*** los registros son accesibles en orden de alguna clave (acceso secuencial lógico)
- ***Directo:*** se accede al registro deseado (Acceso directo)

### Buffers

- Memoria intermedia entre un archivo yu un programa, donde los datos residen provisoriamente hasta ser almacenados definitivamente en memoria secundaria o donde los datos residen provisoriamente hasta ser almacenados definitivamente en memoria secundaria o donde los datos residen una vez recuperados de dicha memoria secundaria.
- Los buffers ocuman lugar en RAM
- SO encargado de manipular los buffers
- Como trabaja?


![Imagen1](https://user-images.githubusercontent.com/55964635/147784122-9baeb6a7-2dc1-4a41-b15f-922c1393c571.png)

### Operaciones básicas

```Dos niveles```

- Físico (almacenamiento secundario)
- Lógico (dentro del programa)
  - Operaciones
    - Crear
    - Abrir
    - Read/Write
    - Eof
    - Seek (localización)  

### Declaraciones

```Utilizaremos la notación Pascal```

```Declaración de archivos```

- Variables 
  - ```Var archivo: file of Tipo_de_dato;``` 
- Tipo
  - ```Type archivo: file of Tipo_de_dato;```
  - ```Var arch: archivo``` 

```Pas
  Type emple = record
    nombre: string [20];
    direccion: string [40];
    edad: integer;
  end;
  numero = file of integer;
  empleado = file of emple;
Var arch_num: numero;
Var arch_emp: empleado,
```

Relacion con el sistema operativo

- Se tiene que establecer la correspondencia entre el nombre físico y nombre lógico

```Assign (n_logico, N_fisico)```

- Ejemplo

```Pas
Program archivos;
uses crt;
Type 
    emple = record
        nombre: string [20];
        direccion: string [40];
        edad: integer;
    end;
    numero = file of integer;
    empleado = file of emple;

Var arch_num:numero;
Var arch_emp:empleado;

Begin
    clrscr;
    Assign( arch_num, 'pepe.dat' );
    Assign( arch_emp, 'pipo.dat' );

End.

```

```Pas
Rewrite(nombre_logico); //De solo escritura (Creacion)
Crea y mantiene el archivo abierto, para esto tenemos que usar un close al final de la carga
Ojo con usarlo con un archivo que ya esta cargado, ya que lo reescribe y lo formatea
Reset (nombre_logico);  //Lectura Escritura (Apertura)
//Nombre logico representa una variable de tipo archivo sobre la que se realizó la asignación
Close(nombre_logico);   //Cierre de archivo
//Esta instruccion indica que no se va a trabajar mas sobre el archivo. Significa poner una marca de 
//EOF (end of file) al final del mismo

Read(nombre_logico, variable);
Tiene que ser del mismo tipo de dato del archivo 
Write(nombre_logico, variable);

{
Estas operaciones leen y/o escriben los buffers relacionados a los archivos
No se realizan directamente sobre el DR
En ambos casos la variable debe ser del mismo tipo que los elementos que se declararon como parte del archivo
}
```

Operaciones Adicionales
-----------------------

```Pas
EOF(nombre_logico); (funcion)
{
Fin de archivo
Como trabaja?
Hay que preguntar eso primero
}

FilePos(nombre_logico); (funcion)
// Posicion dentro del archivo

Seek(nombre_logico, posicion); (Procedimiento)
{
Ir a una posición del archivo
La posición se cuenta como siempre desde el comienzo del archivo
El primer lugar es el cero
}
```
