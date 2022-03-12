<h1 align="center">Practica 1</h1>

```1)``` Realizar un algoritmo que cree e incorpore datos, a un archivo de números enteros ordenados. Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado por el usuario. La carga finaliza cuando se ingrese el número 0 (cero), que no debe incorporarse al archivo. [Resolución](#Ejercicio_1)

```2)``` Realizar un algoritmo que utilizando el archivo de numeros enteros no ordenados en el ejercicio 1, y recorriendolo una unica vez, informe por pantalla la cantidad de numeros multiplos de 2 y la cantidad de numeros mayores a 100000. El nombre del archivo a procesar debe ser proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el contenido del archivo en pantalla. [Resolución](#Ejercicio_2)

```3)``` Realizar un programa que presente un menú con opciones para: [Resolución](#Ejercicio_3)

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
	cadena20 = string[20];

var 
	fileName:cadena20;
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

Ejercicio_2
===========
```Pas
program dos;
uses crt;
type 
    archivo = file of integer;
    cadena20 = string[20];
var 
    arch_logico: archivo;
    arch_fisico: cadena20;
    num, cant, multiplosDos: integer;
    contador:integer;
begin
    clrscr;
    multiplosDos:=0; 
    cant:=0; 
    writeln('Ingrese el nombre del archivo: ');     //a.data
    arch_fisico:='Pruebas';                         //direccion del archivo fisico
    assign(arch_logico, arch_fisico);
    reset(arch_logico); 
    writeln('Elementos del archivo: ');
    while(not eof(arch_logico)) do begin
	read(arch_logico, num);
	if ((num mod 2) = 0) then 
            multiplosDos:= multiplosDos + 1;       
        if (num > 100000) then
            cant:= cant+1;
	contador:= contador +  1;                    //sumador de cantidad de numeros
	writeln(contador,' ) ', num);                //enlisto los registros
    end;
    close(arch_logico);
    writeln(multiplosDos,' es la cantidad de numeros que son multiplos de 2 .');
    writeln(cant,' Numeros mayores que 100000.');
end.
```

Ejercicio_3
===========
```Pas
program tres;
uses crt;
type
    cadena20 = string[20];
    persona = record
        apellido:cadena20;
        nombre:cadena20;
        edad:integer;
        dni:integer;
    end;
    archivo = file of persona;
//_______________________________________________________________
procedure LeerPersona(var p:persona);
begin
    Write('Apellido: '); ReadLn(p.apellido);
    if(p.apellido <> '"')then
    begin
        Write('Nombre: '); ReadLn(p.nombre);
        Write('Edad: '); ReadLn(p.edad);
        Write('Dni: '); ReadLn(p.dni);
    end;
end;
//_______________________________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    p:persona;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    LeerPersona(p);                
    while p.apellido <> '"' do          
    begin
        write( arch_logico, p ); 
        LeerPersona(p);
    end;
    close( arch_logico ); 
end;
//_______________________________________________________________
procedure MostarPersona(p:persona);
begin
    WriteLn('Apellido: ',p.apellido);
    WriteLn('Nombre: ',p.nombre);
    WriteLn('Dni: ',p.dni);
    WriteLn('Edad: ',p.edad);
end;
//_______________________________________________________________
procedure ListarDatosi(var arch_logico: archivo ;apellidoPre:cadena20);
var
    p:persona;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, p);
		if (p.apellido = apellidoPre) then 
            MostarPersona(p);
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure ListarDatosii(var arch_logico:archivo);
var
    p:persona;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, p);
		WriteLn('Apellido: ',p.apellido);
        WriteLn('Nombre: ',p.nombre);
        WriteLn('Dni: ',p.dni);
        WriteLn('Edad: ',p.edad);
        WriteLn('__________');
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure ListarDatosiii(var arch_logico:archivo);
var
    p:persona;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, p);
        if (p.edad > 18) then
		begin
            WriteLn('Apellido: ',p.apellido);
            WriteLn('Nombre: ',p.nombre);
            WriteLn('Dni: ',p.dni);
            WriteLn('Edad: ',p.edad);
            WriteLn('__________');
        end;
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure Menu();
var 
    categoria:integer;
    apellidoPre:cadena20;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    apellidoPre:= 'Cosa';
	while (categoria <> 5)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Personas con un apellido predeterminado');
		writeln('3 | Mostrar Todas la Personas');
		writeln('4 | Mostrar las personas mayores de 18');
        writeln('5 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico,apellidoPre);
			3: ListarDatosii(arch_logico);
			4: ListarDatosiii(arch_logico);
            5: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
    //Los archivos no se pueden para por valor (Necesito una explicacion)
begin                     
    clrscr;
    // //A
    Menu();
end.
```
