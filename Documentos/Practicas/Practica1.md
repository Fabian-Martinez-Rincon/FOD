<h1 align="center">Practica 1 Vieja</h1>

```1)``` Realizar un algoritmo que cree e incorpore datos, a un archivo de números enteros ordenados. Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado por el usuario. La carga finaliza cuando se ingrese el número 0 (cero), que no debe incorporarse al archivo. [Resolución](#Ejercicio_1)

```2)``` Realizar un algoritmo que utilizando el archivo de numeros enteros no ordenados en el ejercicio 1, y recorriendolo una unica vez, informe por pantalla la cantidad de numeros multiplos de 2 y la cantidad de numeros mayores a 100000. El nombre del archivo a procesar debe ser proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el contenido del archivo en pantalla. [Resolución](#Ejercicio_2)

```3)``` Realizar un programa que presente un menú con opciones para: [Resolución](#Ejercicio_3)

```a)``` Crear un archivo de registros no ordenados de personas y completarlo con datos ingresados desde teclado. De cada persona se registra apellido, nombre , edad y DNI. Algunas personas se ingresan con DNI 0. La carga finaliza cuando se ingresa el String ```"``` como apellido.

```b)``` Abrir el archivo anteriormente generado y

1) Listar en pantalla los datos de personas que tengan un apellido determinado
2) Listar en pantalla las personas de "a" una por linea
3) Listar en pantalla personas mayores de 18 años

***NOTA:***  El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una única vez.

```4)``` Agregar al menú del programa del ejercicio 3, opciones para. [Resolución](#Ejercicio_4)

1) Añadir una o más personas al final del archivo con sus datos ingresados por teclado
2) Modificar la edad de a una o más personas.
3) Exportar el contenido del archivo a un archivo del texto llamado "personas.txt"
4) Exportar a un archivo de texto llamado: "erroneos.txt", las personas que no tengan cargado el DNI (DNI en 0) 

***NOTA:*** Las búsquedas deben realizarse por apellido y nombre

```5)``` Realizar un programa para una cadena de zapatería, que presente un menú con opciones para: [Resolución](#Ejercicio_5)

1) Crear un archivo de registros no ordenados de articulos de zapateria y cargarlo con datos ingresados desde un archivo de texto denominado "zapatos.txt". Los registros correspondientes a los articulos, deben contener: el nombre de artículo, descripción, precio y el stock disponible.
2) Listar en pantalla los datos de aquellos articulos que tengan un stock inferior a 100 unidades.
3) Listar en pantalla los articulos del archivo cuya descripcion contenga una cadena de caracteres proporcionada por el usuario.
4) Exportar el archivo creado en el inciso "a)" a un archivo de texto denominado "zapateria.txt" con todos los articulos del mismo.

***NOTA 1:*** El nombre del archivo binario de artículos debe ser proporciononado por el usuario una única vez.

***NOTA 2:*** El archivo de carga debe editarse de manera que cada artículo se especifique en dos lineas consecutivas: En la primera linea sólo se especifica el precio y nombre, y en la segunda el stock disponible y la descripcion, en ese orden. Cada articulo se carga leyendo dos lineas de archivo "carga.txt"

```6)``` Agregar al menú del programa del ejercicio 5, opciones para: [Resolución](#Ejercicio_6)

 1) Añadir uno o más articulos al final del archivo con sus datos ingresados por teclado.
 2) Modificar el stock de un articulo dado
 3) Exportar el contenido del archivo binario a un archivo de texto denominado: "SinStock.txt", con aquellos articulos que tengan stock 0.
 
 ***NOTA:*** Las búsquedas deben realizarse por nombre de artículo.

```7)``` Realizar un programa que permita: [Resolución](#Ejercicio_7)

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

Ejercicio_4
===========
```Pas
program cuatro; //Fabian Martinez Rincon
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
procedure Agregar(var arch_logico:archivo);
var
    p:persona;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,p);
    LeerPersona(p);
    write(arch_logico, p);
	close(arch_logico);
end;
//_______________________________________________________________
procedure ModificarEdades(var arch_logico:archivo);
var
    p:persona;
    edad:integer;
    dni_persona:Integer;
    cont,cant:integer; 
    Encontro:Boolean;
begin
    cont:=0;
    WriteLn('Ingrese la cantidad de edades que quiere modificar: ');
    ReadLn(cant);
    reset(arch_logico);
    while cont<cant do
    begin
        WriteLn('Ingrese el dni de una persona para modificar su edad: ');
        ReadLn(dni_persona);
        Encontro:=false;
        while(not eof(arch_logico))and(not Encontro) do 
        begin
			read(arch_logico, p);
			if(dni_persona = p.dni) then Encontro:=true;
		end;
        if Encontro then
        begin
            writeln('Edad para Remplazar: '); readln(edad);
			seek(arch_logico, filepos(arch_logico)-1);
			p.edad:= edad;
			write(arch_logico, p);
        end   
        else
            WriteLn('No existe el empleado');
        cont:=cont+1;
        
    end;
    close(arch_logico);
end;
//_______________________________________________________________
procedure Exportar_Txt(var arch_logico:archivo);
var
	carga: text;
	p: persona;
begin
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\Personas.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,p);
		with p do
			writeln(carga,' ',apellido,' ',nombre,' ', edad,' ', dni);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_______________________________________________________________
procedure ExportarErroneos(var arch_logico:archivo);
var
    carga: text;
	p: persona;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\erroneos.txt');
	reset(arch_logico);
	rewrite(carga);
    while(not eof(arch_logico)) do begin
		read(arch_logico,p);
        if (p.dni = 0) then
        begin
            with p do
			    writeln(carga,' ',apellido,' ',nombre,' ', edad,' ', dni);
		    end;
        end;
		
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
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
    arch_fisico:='Tres';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 9)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Personas con un apellido predeterminado');
		writeln('3 | Mostrar Todas la Personas');
		writeln('4 | Mostrar las personas mayores de 18');
        writeln('5 | Agregar una persona');
        writeln('6 | Modifica edad de Personas');
        writeln('7 | Exportar a .txt');
        writeln('8 | Exportar a erroneos a .txt');
        writeln('9 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico,apellidoPre);
			3: ListarDatosii(arch_logico);
			4: ListarDatosiii(arch_logico);
            5: Agregar(arch_logico);
            6: ModificarEdades(arch_logico);
            7: Exportar_Txt(arch_logico);
            8: ExportarErroneos(arch_logico);
            9: WriteLn('Archivo Cerrado');
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
Ejercicio_5
===========
```Pas
program cinco; //Fabian Martinez Rincon
uses crt;
type
    cadena20 = string[20];
    articulo = record
        nombre:cadena20;
        descripcion:cadena20;
        precio:real;
        stock:integer;
    end;
    archivo = file of articulo;
//__________________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	art: articulo;
begin
	writeln('Nombre del archivo fisico: ');
	assign(arch_logico,arch_fisico);
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\carga2.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with art do readln(carga, precio, nombre);
		with art do readln(carga, stock, descripcion);
		write(arch_logico, art);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//__________________________________________________
procedure ListarStock(var arch_logico:archivo);
var
    art:articulo;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, art);
		if art.stock < 100 then 
        begin
            writeln('Nombre:', art.nombre);
            writeln('Descripcion:', art.descripcion);
            writeln('Precio:', art.precio:2:2);
            writeln('Stock:', art.stock);
            WriteLn('_________');
        end;
	end;
	close(arch_logico);
end;
//__________________________________________________
procedure ListaUsuario(var arch_logico:archivo);
var
    ingresado:cadena20;
    art:articulo;
begin
    WriteLn('Ingrese una cadena'); ReadLn(ingresado);
    ingresado:=Concat(' ',ingresado);   
    {
    Lo de arriba lo hago para que me tome el nombre de la descripcion sin necesidad de poner un espacio al principio.
    Ya que si pongo los datos juntos, pascal no los separa a no ser de que pongas un espacio.
    Y en este caso, el espacio lo toma tanto en la descripcion como en el nombre
    }
    Reset(arch_logico);
    while (not eof(arch_logico)) do
    begin
        Read(arch_logico,art);
        if(art.descripcion = ingresado)then
        begin
            writeln('Nombre:', art.nombre);
            writeln('Descripcion:', art.descripcion);
            writeln('Precio:', art.precio:2:2);
            writeln('Stock:', art.stock);
            WriteLn('_________');
        end;
    end;
    close(arch_logico);
end;
//__________________________________________________
procedure ExportarArchivo(var arch_logico:archivo);
var
    carga:text;
    art:articulo;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\zapatos.txt');
    Reset(arch_logico);
    Rewrite(carga);
    while (not eof(arch_logico)) do
    begin
        read(arch_logico,art);
        with art do
        begin
            writeln(carga,'  |  ',nombre,'  |  ',descripcion,'  |  ',stock,'  |  ',precio:2:2);
        end;
    end;
    Close(arch_logico);close(carga);
end;
//__________________________________________________
var
	arch_logico: archivo;
    arch_fisico:cadena20;
	opcion: integer;
begin
    clrscr;
    opcion:=0;
    arch_fisico:='cinco';                        
	//assign(arch_logico, arch_fisico);
	while(opcion <> 5)do 
    begin
        writeln('Ingrese una opcion: ');
        writeln('1| Crear archivo');
        writeln('2| Listar Objetos');
        WriteLn('3| Lista de Usuario');
        WriteLn('4| Exportar Archivo');
        writeln('5| Cerrar Archivo');
        readln(opcion);
        case opcion of
            1: crearArchivo(arch_logico,arch_fisico);
            2: ListarStock(arch_logico);
            3: ListaUsuario(arch_logico);
            4: ExportarArchivo(arch_logico);
            5: WriteLn('Archivo Cerrado');
            else
                WriteLn('Numero invalido');
        end;
	end;
end.
```
Ejercicio_6
===========
```Pas
program seis; //Fabian Martinez Rincon
uses crt;
type
    cadena20 = string[20];
    articulo = record
        nombre:cadena20;
        descripcion:cadena20;
        precio:real;
        stock:integer;
    end;
    archivo = file of articulo;
//__________________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	art: articulo;
begin
    arch_fisico:='Seis';
	writeln('Nombre del archivo fisico: ',arch_fisico);                        
	assign(arch_logico,arch_fisico);
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\carga2.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with art do readln(carga, precio, nombre);
		with art do readln(carga, stock, descripcion);
		write(arch_logico, art);
	end;
    clrscr;
	writeln('-----Archivo Creado Exitosamente-----');
	close(arch_logico); 
end;
//__________________________________________________
procedure ListarStock(var arch_logico:archivo);
var
    art:articulo;
begin
    clrscr;
	writeln('-----Litas con Stock menor a 100-----');
    WriteLn();
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, art);
		if art.stock < 100 then 
        begin
            writeln('Nombre:', art.nombre);
            writeln('Descripcion:', art.descripcion);
            writeln('Precio:', art.precio:2:2);
            writeln('Stock:', art.stock);
            WriteLn('_________');
        end;
	end;
	close(arch_logico);
end;
//__________________________________________________
procedure ListaUsuario(var arch_logico:archivo);
var
    ingresado:cadena20;
    art:articulo;
begin
    clrscr;
	writeln('-----Lista de Usuario-----');
    Write('Nombre del articulo: '); 
    ReadLn(ingresado);      //Este readln no entiendo porque se lo salta
    ReadLn(ingresado);
    ingresado:=Concat(' ',ingresado);   
    WriteLn();
    {
    Lo de arriba lo hago para que me tome el nombre de la descripcion sin necesidad de poner un espacio al principio.
    Ya que si pongo los datos juntos, pascal no los separa a no ser de que pongas un espacio.
    Y en este caso, el espacio lo toma tanto en la descripcion como en el nombre
    }
    Reset(arch_logico);
    while (not eof(arch_logico)) do
    begin
        Read(arch_logico,art);
        if(art.nombre = ingresado)then
        begin
            writeln('Nombre:', art.nombre);
            writeln('Descripcion:', art.descripcion);
            writeln('Precio:', art.precio:2:2);
            writeln('Stock:', art.stock);
            WriteLn('_________');
        end;
    end;
    close(arch_logico);
end;
//__________________________________________________
procedure ExportarArchivo(var arch_logico:archivo);
var
    carga:text;
    art:articulo;
begin

    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\zapatos.txt');
    Reset(arch_logico);
    Rewrite(carga);
    while (not eof(arch_logico)) do
    begin
        read(arch_logico,art);
        with art do
        begin
            writeln(carga,'  |  ',nombre,'  |  ',descripcion,'  |  ',stock,'  |  ',precio:2:2);
        end;
    end;
    Close(arch_logico);close(carga);
    clrscr;
	writeln('-----Archivo Exportado Exitosamente-----');
end;
//__________________________________________________
procedure LeerArticulo(var art:articulo);
begin
    writeln('Nombre:');     ReadLn(art.nombre);
    writeln('Descripcion:');ReadLn(art.descripcion);
    writeln('Precio:');ReadLn(art.precio);
    writeln('Stock:');ReadLn(art.stock);
end;
//__________________________________________________
procedure Agregar(var arch_logico:archivo);
var
    x:articulo;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,x);
    LeerArticulo(x);
    write(arch_logico, x);
    close(arch_logico);
end;
//__________________________________________________
procedure AgregarArchivo(var arch_logico:archivo);
var
    cant,cont:integer;
begin
    cont:=0;
    WriteLn('Cuantos articulos quiere agregar ?'); readln(cant);
    while cont<cant do
    begin
        Agregar(arch_logico);
        cont:=cont+1;
    end;
end;
//__________________________________________________
procedure Actualizar(var arch_logico:archivo);
var
    nomArticulo:cadena20;
    stockRemplazo:integer;
    actual:articulo;
    Encontro:Boolean;
begin
    clrscr;
	writeln('-----MODIFICAR STOCK DE ARTICULOS-----');
    reset(arch_logico);
    WriteLn('Ingrese un nombre: ');
    ReadLn(nomArticulo);
    ReadLn(nomArticulo);
    nomArticulo:=Concat(' ',nomArticulo); 
    Encontro:=false;
    while(not eof(arch_logico))and(not Encontro) do 
    begin
        read(arch_logico, actual);
        if(actual.nombre = nomArticulo) then Encontro:=true;
    end;
    if Encontro then
    begin
        writeln('Stock de Remplazo: '); readln(stockRemplazo);
        seek(arch_logico, filepos(arch_logico)-1);
        actual.stock:=stockRemplazo;
        write(arch_logico, actual);
    end   
    else
        WriteLn('No existe el nro');
    Close(arch_logico);
end;
//__________________________________________________
procedure ExportarArchivo2(var arch_logico:archivo);
var
    carga:text;
    art:articulo;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\SinStock.txt');
    reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do 
    begin
		read(arch_logico,art); 
		if(art.stock = 0) then 
        begin
            with art do
				writeln(carga,' ',nombre,' ',descripcion,' ', stock,' ',precio:2:2);
        end;
	end;
	close(arch_logico); close(carga);
    clrscr;
	writeln('-----Archivo Exportado Exitosamente-----');
end;
//__________________________________________________
var
	arch_logico: archivo;
    arch_fisico:cadena20;
	opcion: integer;
begin
    clrscr;
    opcion:=0;
    
	while(opcion <> 9)do 
    begin
        writeln('------MENU------ ');
        writeln('1| Crear archivo');
        writeln('2| Listar Objetos');
        WriteLn('3| Lista de Usuario');
        WriteLn('4| Exportar Archivo "zapateria.txt"');
        WriteLn('5| Agregar un Archivo');
        WriteLn('6| Modificar el stock de un articulo');
        WriteLn('7| Exportar Archivo "SinStock.txt"');
        WriteLn('8| Limpiar consola');
        writeln('9| Cerrar Archivo');
        writeln('------MENU------ ');
        WriteLn();
        write('Opcion: ');read(opcion);
        case opcion of
            1: crearArchivo(arch_logico,arch_fisico);
            2: ListarStock(arch_logico);
            3: ListaUsuario(arch_logico);
            4: ExportarArchivo(arch_logico);
            5: AgregarArchivo(arch_logico);
            6: Actualizar(arch_logico);
            7: ExportarArchivo2(arch_logico);
            8: clrscr;
            9: WriteLn('Archivo Cerrado');
            else
                WriteLn('Numero invalido');
        end;
        WriteLn();
	end;
end.
```
Ejercicio_7
===========

```Pas
program siete;
uses crt;
type
    cadena20 = string[20];
    novela = record
        codigo:integer;
        nombre:cadena20;
        genero:cadena20;
        precio:Real;
    end;
    archivo = file of novela;
//_________________________________________________
procedure Imprimir(var arch_logico:archivo);
var
    n:novela;
begin
    
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, n);
        writeln('Nombre:', n.nombre);
        writeln('Genero:', n.genero);
        writeln('Precio:', n.precio:2:2);
        writeln('Codigo:', n.codigo);
        WriteLn('_________');
	end;
	close(arch_logico);
end;
//_________________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	n: novela;
begin
    arch_fisico:='siete';
	writeln('Nombre del archivo fisico: ',arch_fisico);                        
	assign(arch_logico,arch_fisico);
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\novelas.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with n do readln(carga, codigo, precio,genero);
		with n do readln(carga, nombre);
		write(arch_logico, n);
	end;
    clrscr;
	writeln('-----Archivo Creado Exitosamente-----');
	close(arch_logico); 
end;
//_________________________________________________
procedure leerNovela(var n:novela);
begin
    WriteLn('Ingrese los datos de la nueva novela: ');
    WriteLn('Codigo: '); ReadLn(n.codigo);
    WriteLn('Nombre: '); ReadLn(n.nombre);
    WriteLn('Genero: '); ReadLn(n.genero);
    WriteLn('Precio: '); ReadLn(n.precio);
end;
//_________________________________________________
procedure AgregarArchivo(var arch_logico:archivo);
var
    n:novela;
begin
    Reset(arch_logico);
    Seek(arch_logico,FileSize(arch_logico));
    leerNovela(n);
    Write(arch_logico,n);
    Close(arch_logico);
end;
//_________________________________________________
procedure Actualizar(var arch_logico:archivo);
var
    nomNovela:cadena20;
    novRemplazo:novela;
    actual:novela;
    Encontro:Boolean;
begin
    clrscr;
	writeln('-----MODIFICAR STOCK DE ARTICULOS-----');
    reset(arch_logico);
    WriteLn('Ingrese un nombre: ');
    ReadLn(nomNovela);
    ReadLn(nomNovela);
    nomNovela:=Concat(' ',nomNovela); 
    Encontro:=false;
    while(not eof(arch_logico))and(not Encontro) do 
    begin
        read(arch_logico, actual);
        if(actual.nombre = nomNovela) then Encontro:=true;
    end;
    if Encontro then
    begin
        writeln('Novela de Remplazo: ');
        leerNovela(novRemplazo);
        seek(arch_logico, filepos(arch_logico)-1);
        actual:=novRemplazo;
        write(arch_logico, actual);
    end   
    else
        WriteLn('No existe el nro');
    Close(arch_logico);
end;
//_________________________________________________
var
	arch_logico: archivo;
    arch_fisico:cadena20;
	opcion: integer;
begin
    clrscr;
    opcion:=0;
    
	while(opcion <> 6)do 
    begin
        writeln('------MENU------ ');
        writeln('1| Crear archivo');
        writeln('2| Agregar una Novela');
        WriteLn('3| Modificar una Novela');
        WriteLn('4| Imprimir');
        WriteLn('5| Limpiar consola');
        writeln('6| Cerrar Archivo');
        writeln('------MENU------ ');
        WriteLn();
        write('Opcion: ');read(opcion);
        case opcion of
            1: crearArchivo(arch_logico,arch_fisico);
            2: AgregarArchivo(arch_logico);
            3: Actualizar(arch_logico);
            4: Imprimir(arch_logico);
            5: clrscr;
            6: WriteLn('Archivo Cerrado');
            else
                WriteLn('Numero invalido');
        end;
        WriteLn();
	end;
end.
```