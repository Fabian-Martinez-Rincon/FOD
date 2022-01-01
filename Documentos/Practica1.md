<h1 align="center">Practica 1</h1>

```1)``` Realizar un algoritmo que cree e incorpore datos, a un archivo de números enteros ordenados. Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado por el usuario. La carga finaliza cuando se ingrese el número 0 (cero), que no debe incorporarse al archivo. [Resolución](#Ejercicio_1)

```2)``` Realizar un algoritmo que utilizando el archivo de numeros enteros no ordenados en el ejercicio 1, y recorriendolo una univa vez, informe por pantalla la cantidad de numeros multiplos de 2 y la cantidad de numeros mayores a 100000. El nombre del archivo a procesar debe ser proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el contenido del archivo en pantalla. [Resolución](#Ejercicio_2)

```3)``` Realizar un programa que presente un menú con opciones para:

```a)``` Crear un archivo de registros no ordenados de personas y completarlo con datos ingresados desde teclado. De cada persona se registra apellido, nombre , edad y DNI. Algunas personas se ingresan con DNI 0. La carga finaliza cuando se ingresa el String ```"``` como apellido.

```b)``` Abrir el archivo anteriormente generado y

1) Listar en pantalla los datos de personas que tengan un apellido determinado
2) Listar en pantalla las personas de "a" una por linea
3) Listar en pantalla personas mayores de 18 años

***NOTA:***  El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una única vez.

```4)``` Agregar al menú del programa del ejercicio 3, opciones para.

1) Añadir una o más personas al final del archivo con sus datos ingresados por teclado
2) Modificar la edad de a una o más personas.
3) Exportar el contenido del archivo a un archivo del texto llamado "personas.txt"
4) Exportar a un archivo de texto llamado: "erroneos.txt", las personas que no tengan cargado el DNI (DNI en 0) 

***NOTA:*** Las búsquedas deben realizarse por apellido y nombre

```5)``` Realizar un programa para una cadena de zapatería, que presente un menú con opciones para:

1) Crear un archivo de registros no ordenados de articulos de zapateria y cargarlo con datos ingresados desde un archivo de texto denominado "zapatos.txt". Los registros correspondientes a los articulos, deben contener: el nombre de artículo, descripción, precio y el stock disponible.
2) Listar en pantalla los datos de aquellos articulos que tengan un stock inferior a 100 unidades.
3) Listar en pantalla los articulos del archivo cuya descripcion contenga una cadena de caracteres proporcionada por el usuario.
4) Exportar el archivo creado en el inciso "a)" a un archivo de texto denominado "zapateria.txt" con todos los articulos del mismo.

***NOTA 1:*** El nombre del archivo binario de artículos debe ser proporciononado por el usuario una única vez.

***NOTA 2:*** El archivo de carga debe editarse de manera que cada artículo se especifique en dos lineas consecutivas: En la primera linea sólo se especifica el precio y nombre, y en la segunda el stock disponible y la descripcion, en ese orden. Cada articulo se carga leyendo dos lineas de archivo "carga.txt"

```6)``` Agregar al menú del programa del ejercicio 5, opciones para:

 1) Añadir uno o más articulos al final del archivo con sus datos ingresados por teclado.
 2) Modificar el stock de un articulo dado
 3) Exportar el contenido del archivo binario a un archivo de texto denominado: "SinStock.txt", con aquellos articulos que tengan stock 0.
 
 ***NOTA:*** Las búsquedas deben realizarse por nombre de artículo.

```7)``` Realizar un programa que permita:

1) Crear un archivo binario a partir de la informacion almacenada en un archivo de texto. El nombre del archivo de texto es: "novelas.txt"
2) Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar una novela y modificar una existente. La búsquedas se realizan por codigo de novela.

***NOTA:*** La informacion en el archivo de texto consiste en: codigo novela, nombre, genero y precio de diferentes novelas argentinas. De cada novela se almacena la informacion en dos lineas en el archivo de texto. La primera linea contendra la siguiente informacion: codigo novela, precio y genero, y la segunda linea almacenara el nombre de la novela.

Ejercicio_1
===========
```Pas
program FabianMartinezPrograma1;

uses crt;
type 

archivoNumeros= file of integer;

var 
	fileName:string;
	archivo:archivoNumeros;
	numero:integer;
BEGIN
	clrscr;
	write('Ingrese nombre de archivo:' ); 
	readln(fileName);
	assign(archivo,fileName);
	rewrite (archivo); // se crea el archivo
	write (' Ingrese un numero : ');
	readln(numero);
	while numero <> 0 do begin
		write(archivo,numero);
		write (' Ingrese un numero : ');
		readln(numero);
	end;
	close (archivo);
END.
```
