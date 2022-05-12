<h1 align="center">Practica 1 Nueva</h1>


<h1 align="center">Creación, consulta y mantenimiento de archivos secuenciales</h1>

```1)``` Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando se ingrese el número 30000, que no debe incorporarse al archivo. [Resolución](#Ejercicio_1)

```2)``` Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el promedio de los números ingresados. El nombre del archivo a procesar debe ser proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el contenido del archivo en pantalla. [Resolución](#Ejercicio_2)

```3)``` Realizar un programa que presente un menú con opciones para: [Resolución](#Ejercicio_3)

```a.``` Crear un archivo de registros no ordenados de empleados y completarlo con datos ingresados desde teclado. De cada empleado se registra: número de empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con DNI 00. La carga finaliza cuando se ingresa el String ```fin``` como apellido.
 
 ```b.``` Abrir el archivo anteriormente generado y: 

- ```i.``` Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado
- ```ii.``` Listar en pantalla los empleados de a uno por línea
- ```ii.``` Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.

***NOTA:*** El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una única vez.

```4)``` Agregar al menú del programa del ejercicio 3, opciones para: [Resolución](#Ejercicio_4)

- ```a).``` Añadir una o más empleados al final del archivo con sus datos ingresado por teclado
- ```b).``` Modificar edad a una o más empleados
- ```c).``` Exportar el contenido del archivo a un archivo de texto llamado ```todos_empleados.txt```
- ```d).``` Exportar a un archivo de texto llamado: ```faltaDNIEmpleados.txt```, los empleados que no tengan cargado el DNI (DNI en 00)

***NOTA:*** Las búsquedas deben realizarse por número de empleado

```5)``` Realizar un programa para una tienda de celulares, que presente un menú con opciones para: [Resolución](#Ejercicio_5)

- ```a).``` Crear un archivo de registros no ordenados de celulares y cargarlo con datos ingresados desde un archivo de texto denominado ```celulares.txt```. Los registros correspondientes a los celulares, deben contener: código de celular, el nombre, descripcion, marca, precio, stock mínimo y el stock disponible.
- ```b).``` Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock mínimo.
- ```c).``` Listar en pantalla los celulares del archivo cuya descripción contenga una cadena de caracteres proporcionada por el usuario. 
- ```d).``` Exportar el archivo creado en el inciso a) a un archivo de texto denominado ```celulares.txt``` con todos los celulares del mismo.

***NOTA 1:*** El nombre del archivo binario de celulares debe ser proporcionado por el usuario una única vez.

***NOTA 2:***  El archivo de carga debe editarse de manera que cada celular se especifique en tres líneas consecutivas: en la primera se especifica: código de celular, el precio y marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo ```celulares.txt```.

```6)``` Agregar al menú del programa del ejercicio 5, opciones para:  [Resolución](#Ejercicio_6)

- ```a.``` Añadir uno o más celulares al final del archivo con sus datos ingresados por teclado.
- ```b.``` Modificar el stock de un celular dato.
- ```c.``` Exportar el contenido del archivo binario a un archivo de texto denominado: ```SinStock.txt```

***NOTA:*** Las búsquedas deben realizarse por numero de celular.

```7)``` Realizar un programa que permita: [Resolución](#Ejercicio_7)

- ```a.``` Crear un archivo binario a partir de la información almacenada en un archivo de texto. El nombre del archivo de texto es: ```novelas.txt```
- ```b.``` Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar una novela y modificar una existente. Las búsquedas se realizan por código de novela.

***NOTA:*** La información en el archivo de texto consiste en: código de novela, nombre,género y precio de diferentes novelas argentinas. De cada novela se almacena la información en dos líneas en el archivo de texto. La primera línea contendrá la siguiente información: código novela, precio, y género, y la segunda línea almacenará el nombre de la novela.


Ejercicio_1
===========
```Pas
program uno;
uses crt;
type 
	archivo= file of integer;
	cadena20 = string[20];
//_______________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    num:Integer;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    WriteLn('Ingrese un nro: ');
    readln(num);                
    while num <> 30000 do          
    begin
        write( arch_logico, num);
        WriteLn('Ingrese un nro: '); 
        readln(num);
    end;
    close( arch_logico ); 
end;
//_______________________________________________
var 
	arch_fisico:cadena20;
	arch_logico:archivo;
begin
    clrscr;
    CrearArchivo(arch_logico,arch_fisico);
end.
```
Ejercicio_2
===========
```Pas
program dos;
uses crt;
type 
    archivo = file of integer;
    cadena20 = string[20];
//_______________________________________________
procedure ImprimirArchivo(var arch_logico:archivo);
var
    x:integer;
    cantidad:integer;
    cantMenor:integer;
    total:integer;
    promedio:real;
begin
    reset(arch_logico); 
    cantidad:=0;
    promedio:=0;
    cantMenor:=0;
    total:=0;
    while(not eof(arch_logico)) do 
    begin
        cantidad:=cantidad+1;
		read(arch_logico, x);
        if (x < 1500) then begin
            total:=total+x;
            cantMenor:=cantMenor+1;
        end;
    end;
    close(arch_logico);
    promedio:=(total/cantidad);
    WriteLn('Los num menores a 1500: ',cantMenor);
    WriteLn('El promedio de los nros ingresados es: ',promedio:2:2);
end;
//_______________________________________________
var 
    arch_logico: archivo;
    arch_fisico: cadena20;
begin
    clrscr;
    arch_fisico:='uno';
    assign( arch_logico, arch_fisico );
    ImprimirArchivo(arch_logico);
end.
```
Ejercicio_3
===========
```Pas
program tres;
uses crt;
type
    cadena20 = string[20];
    empleado = record
        nro:integer;
        apellido:cadena20;
        nombre:cadena20;
        edad:integer;
        dni:integer;
    end;
    archivo = file of Empleado;
//_______________________________________________
procedure LeerEmpleado(var emp:Empleado);
begin
    Write('Apellido: '); ReadLn(emp.apellido);
    if(emp.apellido <> 'fin')then
    begin
        Write('Nombre: '); ReadLn(emp.nombre);
        Write('Edad: '); ReadLn(emp.edad);
        Write('Dni: '); ReadLn(emp.dni);
        Write('Nro Empleado: '); ReadLn(emp.nro);
    end;
end;
//_______________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    emp:Empleado;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    LeerEmpleado(emp);                
    while emp.apellido <> 'fin' do          
    begin
        write( arch_logico, emp); 
        LeerEmpleado(emp); 
    end;
    close( arch_logico ); 
end;

//_______________________________________________
procedure MostarPersona(emp:empleado);
begin
    WriteLn('Nro Empleado: ',emp.nro);
    WriteLn('Apellido: ',emp.apellido);
    WriteLn('Nombre: ',emp.nombre);
    WriteLn('Dni: ',emp.dni);
    WriteLn('Edad: ',emp.edad);
end;
//_______________________________________________
procedure ListarDatosi(var arch_logico: archivo );
var
    emp:empleado;
    cadenaPred:cadena20;
begin
    WriteLn('Ingrese un nombre o apellido a buscar: ');
    ReadLn(cadenaPred);
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
		if ((emp.apellido = cadenaPred) or (emp.nombre = cadenaPred)) then 
            MostarPersona(emp);
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure ListarDatosii(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        WriteLn('Nro: ',emp.nro);
		WriteLn('Apellido: ',emp.apellido);
        WriteLn('Nombre: ',emp.nombre);
        WriteLn('Dni: ',emp.dni);
        WriteLn('Edad: ',emp.edad);
        WriteLn('__________');
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure ListarDatosiii(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        if (emp.edad > 70) then
		begin
            WriteLn('Nro: ', emp.nro);
            WriteLn('Apellido: ',emp.apellido);
            WriteLn('Nombre: ',emp.nombre);
            WriteLn('Dni: ',emp.dni);
            WriteLn('Edad: ',emp.edad);
            WriteLn('__________');
        end;
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure Menu();
var 
    categoria:integer;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    arch_fisico:='Tres';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 5)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Empleados con un apellido predeterminado');
		writeln('3 | Mostrar todos la Empleados');
		writeln('4 | Mostrar las Empleados mayores de 70');
        writeln('5 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico);
			3: ListarDatosii(arch_logico);
			4: ListarDatosiii(arch_logico);
            5: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
//_______________________________________________
begin
    clrscr;
    Menu();
end.
```
Ejercicio_4
===========
```Pas
program tres;
uses crt;
type
    cadena20 = string[20];
    empleado = record
        nro:integer;
        apellido:cadena20;
        nombre:cadena20;
        edad:integer;
        dni:integer;
    end;
    archivo = file of Empleado;
//_______________________________________________
procedure LeerEmpleado(var emp:Empleado);
begin
    Write('Apellido: '); ReadLn(emp.apellido);
    if(emp.apellido <> 'fin')then
    begin
        Write('Nombre: '); ReadLn(emp.nombre);
        Write('Edad: '); ReadLn(emp.edad);
        Write('Dni: '); ReadLn(emp.dni);
        Write('Nro Empleado: '); ReadLn(emp.nro);
    end;
end;
//_______________________________________________
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    emp:Empleado;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    LeerEmpleado(emp);                
    while emp.apellido <> 'fin' do          
    begin
        write( arch_logico, emp); 
        LeerEmpleado(emp); 
    end;
    close( arch_logico ); 
end;

//_______________________________________________
procedure MostarPersona(emp:empleado);
begin
    WriteLn('Nro Empleado: ',emp.nro);
    WriteLn('Apellido: ',emp.apellido);
    WriteLn('Nombre: ',emp.nombre);
    WriteLn('Dni: ',emp.dni);
    WriteLn('Edad: ',emp.edad);
end;
//_______________________________________________
procedure ListarDatosi(var arch_logico: archivo );
var
    emp:empleado;
    cadenaPred:cadena20;
begin
    WriteLn('Ingrese un nombre o apellido a buscar: ');
    ReadLn(cadenaPred);
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
		if ((emp.apellido = cadenaPred) or (emp.nombre = cadenaPred)) then 
            MostarPersona(emp);
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure ListarDatosii(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        WriteLn('Nro: ',emp.nro);
		WriteLn('Apellido: ',emp.apellido);
        WriteLn('Nombre: ',emp.nombre);
        WriteLn('Dni: ',emp.dni);
        WriteLn('Edad: ',emp.edad);
        WriteLn('__________');
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure ListarDatosiii(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, emp);
        if (emp.edad > 70) then
		begin
            WriteLn('Nro: ', emp.nro);
            WriteLn('Apellido: ',emp.apellido);
            WriteLn('Nombre: ',emp.nombre);
            WriteLn('Dni: ',emp.dni);
            WriteLn('Edad: ',emp.edad);
            WriteLn('__________');
        end;
    end;
    close(arch_logico);
end;
//_______________________________________________
procedure Agregar(var arch_logico:archivo);
var
    emp:empleado;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,emp);
    LeerEmpleado(emp);
    write(arch_logico, emp);
	close(arch_logico);
end;
//_______________________________________________________________
procedure ModificarEdades(var arch_logico:archivo);
var
    emp:empleado;
    edad:integer;
    nroEmpleado:Integer;
    cont,cant:integer; 
    Encontro:Boolean;
begin
    cont:=0;
    WriteLn('Ingrese la cantidad de edades que quiere modificar: ');
    ReadLn(cant);
    reset(arch_logico);
    while cont<cant do
    begin
        WriteLn('Ingrese el nro de una empleado para modificar su edad: ');
        ReadLn(nroEmpleado);
        Encontro:=false;
        while(not eof(arch_logico))and(not Encontro) do 
        begin
			read(arch_logico, emp);
			if(nroEmpleado = emp.nro) then Encontro:=true;
		end;
        if Encontro then
        begin
            writeln('Edad para Remplazar: '); readln(edad);
			seek(arch_logico, filepos(arch_logico)-1);
			emp.edad:= edad;
			write(arch_logico, emp);
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
	emp: empleado;
begin
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\todos_empleados.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,emp);
		with emp do
			writeln(carga,' ',nro,' ',apellido,' ',nombre,' ', edad,' ', dni);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_______________________________________________________________
procedure ExportarErroneos(var arch_logico:archivo);
var
    carga: text;
	emp: empleado;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\faltaDNIEmpleados.txt');
	reset(arch_logico);
	rewrite(carga);
    while(not eof(arch_logico)) do begin
		read(arch_logico,emp);
        if (emp.dni = 0) then
        begin
            with emp do
			    writeln(carga,' ',nro,' ',apellido,' ',nombre,' ', edad,' ', dni);
		    end;
        end;
		
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_______________________________________________
procedure Menu();
var 
    categoria:integer;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    arch_fisico:='Tres';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 9)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Datos de Empleados con un apellido predeterminado');
		writeln('3 | Mostrar todos la Empleados');
		writeln('4 | Mostrar las Empleados mayores de 70');
        writeln('5 | Agregar Empleados');
        writeln('6 | Modifica edad de Empleados');
        writeln('7 | Exportar a .txt');
        writeln('8 | Exportar a erroneos a .txt');
        writeln('9 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarDatosi(arch_logico);
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
//_______________________________________________
begin
    clrscr;
    Menu();
end.
```
Ejercicio_5
===========
```Pas
program cinco;
uses crt;
type
    cadena20 = string[20];
    celular = record
        codigo:integer;
        nombre:cadena20;
        descripcion:cadena20;
        marca:cadena20;
        precio:real;
        stockMin:integer;
        stock:integer;
    end;
    archivo = file of celular;
//_______________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	cel: celular;
begin
	writeln('Nombre del archivo fisico: ');
	assign(arch_logico,arch_fisico);
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\celulares.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with cel do readln(carga, codigo, precio, marca);
		with cel do readln(carga, stock, stockMin,descripcion);
        with cel do readln(carga, nombre);
		write(arch_logico, cel);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_______________________________________________
procedure ListarStock(var arch_logico:archivo);
var
    cel:celular;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, cel);
		if cel.stock > cel.stockMin then 
        begin
            WriteLn('Codigo: ',cel.codigo);
            writeln('Nombre:', cel.nombre);
            writeln('Descripcion:', cel.descripcion);
            WriteLn('Marca: ',cel.marca);
            writeln('Precio:', cel.precio:2:2);
            WriteLn('Stock Minimo:',cel.stockMin);
            writeln('Stock:', cel.stock);
            WriteLn('_________');
        end;
	end;
	close(arch_logico);
end;
//_______________________________________________
procedure listarDescUsuario(var arch_logico:archivo);
var
	desc: cadena20;
	cel:celular;
begin
	reset(arch_logico);
	writeln('Ingrese una descripcion: '); readln(desc);
    desc:=Concat(' ',desc); 
	while(not eof(arch_logico)) do begin
		read(arch_logico, cel);
		if(cel.descripcion = desc) then writeln('Nombre: ',cel.nombre,' - Codigo:', cel.codigo);
	end;
	close(arch_logico);
end;
//_______________________________________________
procedure ExportarArchivo(var arch_logico:archivo);
var
    carga:text;
    cel:celular;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\celularesExportados.txt');
    Reset(arch_logico);
    Rewrite(carga);
    while (not eof(arch_logico)) do
    begin
        read(arch_logico,cel);
        with cel do
        begin
            writeln(carga,'  |  ',codigo,'  |  ',nombre,'  |  ',descripcion,'  |  ');
            writeln(carga,'  |  ',marca,'  |  ',stockMin,'  |  ',stock,'  |  ',precio:2:2);
        end;
    end;
    Close(arch_logico);close(carga);
end;
//_______________________________________________
procedure Menu();
var 
    categoria:integer;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    arch_fisico:='Cinco';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 5)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Mostrar los celulares con stock menor al stock minimo');
		writeln('3 | Mostrar celulares cuya descripcion contenga una cadena');
        writeln('4 | Exportar a .txt');
        writeln('5 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarStock(arch_logico);
			3: listarDescUsuario(arch_logico);
            4: ExportarArchivo(arch_logico);
            5: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
begin
    clrscr;
    Menu();
end.
```
Ejercicio_6
===========
```Pas
program seis;
uses crt;
type
    cadena20 = string[20];
    celular = record
        codigo:integer;
        nombre:cadena20;
        descripcion:cadena20;
        marca:cadena20;
        precio:real;
        stockMin:integer;
        stock:integer;
    end;
    archivo = file of celular;
//_______________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	cel: celular;
begin
	writeln('Nombre del archivo fisico: ');
	assign(arch_logico,arch_fisico);
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\celulares.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with cel do readln(carga, codigo, precio, marca);
		with cel do readln(carga, stock, stockMin,descripcion);
        with cel do readln(carga, nombre);
		write(arch_logico, cel);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_______________________________________________
procedure ListarStock(var arch_logico:archivo);
var
    cel:celular;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, cel);
		if cel.stock > cel.stockMin then 
        begin
            WriteLn('Codigo: ',cel.codigo);
            writeln('Nombre:', cel.nombre);
            writeln('Descripcion:', cel.descripcion);
            WriteLn('Marca: ',cel.marca);
            writeln('Precio:', cel.precio:2:2);
            WriteLn('Stock Minimo:',cel.stockMin);
            writeln('Stock:', cel.stock);
            WriteLn('_________');
        end;
	end;
	close(arch_logico);
end;
//_______________________________________________
procedure listarDescUsuario(var arch_logico:archivo);
var
	desc: cadena20;
	cel:celular;
begin
	reset(arch_logico);
	writeln('Ingrese una descripcion: '); readln(desc);
    desc:=Concat(' ',desc); 
	while(not eof(arch_logico)) do begin
		read(arch_logico, cel);
		if(cel.descripcion = desc) then writeln('Nombre: ',cel.nombre,' - Codigo:', cel.codigo);
	end;
	close(arch_logico);
end;
//_______________________________________________
procedure ExportarArchivo(var arch_logico:archivo);
var
    carga:text;
    cel:celular;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\celularesExportados.txt');
    Reset(arch_logico);
    Rewrite(carga);
    while (not eof(arch_logico)) do
    begin
        read(arch_logico,cel);
        with cel do
        begin
            writeln(carga,'  |  ',codigo,'  |  ',nombre,'  |  ',descripcion,'  |  ');
            writeln(carga,'  |  ',marca,'  |  ',stockMin,'  |  ',stock,'  |  ',precio:2:2);
        end;
    end;
    Close(arch_logico);close(carga);
end;
//_______________________________________________
procedure LeerCelular(var cel:celular);
begin
    writeln('Codigo:');     ReadLn(cel.codigo);
    writeln('Nombre:');     ReadLn(cel.nombre);
    writeln('Descripcion:');ReadLn(cel.descripcion);
    writeln('Marca:');     ReadLn(cel.marca);
    writeln('Precio:');ReadLn(cel.precio);
    writeln('Stock Minimo:');ReadLn(cel.stockMin);
    writeln('Stock:');ReadLn(cel.stock);
end;
//_______________________________________________
procedure Agregar(var arch_logico:archivo);
var
    cel:celular;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,cel);
    LeerCelular(cel);
    write(arch_logico, cel);
    close(arch_logico);
end;
//_______________________________________________
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
//_______________________________________________
procedure Actualizar(var arch_logico:archivo);
var
    nro:Integer;
    stockRemplazo:integer;
    actual:celular;
    Encontro:Boolean;
begin
    clrscr;
	writeln('-----MODIFICAR STOCK DE ARTICULOS-----');
    reset(arch_logico);
    WriteLn('Ingrese un nro: ');
    ReadLn(nro);
    Encontro:=false;
    while(not eof(arch_logico))and(not Encontro) do 
    begin
        WriteLn(actual.nombre);
        read(arch_logico, actual);
        if(actual.codigo = nro) then Encontro:=true;
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
//_______________________________________________
procedure ExportarArchivo2(var arch_logico:archivo);
var
    carga:text;
    cel:celular;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\SinStock.txt');
    reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do 
    begin
		read(arch_logico,cel); 
		if(cel.stock = 0) then 
        begin
            with cel do
            begin
                writeln(carga,'  |  ',codigo,'  |  ',nombre,'  |  ',descripcion,'  |  ');
                writeln(carga,'  |  ',marca,'  |  ',stockMin,'  |  ',stock,'  |  ',precio:2:2);
            end;
        end;
	end;
	close(arch_logico); close(carga);
    clrscr;
	writeln('-----Archivo Exportado Exitosamente-----');
end;
//_______________________________________________
procedure Menu();
var 
    categoria:integer;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    arch_fisico:='Cinco';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 8)do begin
		writeln('_______________________');
		writeln('Menu 100% real no fake: ');
		writeln('1 | Crear un Archivo con empleados(Siempre lo primero)');
		writeln('2 | Mostrar los celulares con stock menor al stock minimo');
		writeln('3 | Mostrar celulares cuya descripcion contenga una cadena');
        writeln('4 | Exportar a .txt');
        WriteLn('5| Agregar un Celular');
        WriteLn('6| Modificar stock de un celular dato');
        WriteLn('7| Exportar el contenido del archivo binario a un archivo de texto denominado: SinStock.txt');
        writeln('8 | Cerrar Menu');
		write('Numero: ');
		readln(categoria);
		writeln('_______________________');
		case categoria of
			1: CrearArchivo(arch_logico,arch_fisico);
			2: ListarStock(arch_logico);
			3: listarDescUsuario(arch_logico);
            4: ExportarArchivo(arch_logico);
            5: AgregarArchivo(arch_logico);
            6: Actualizar(arch_logico);
            7: ExportarArchivo2(arch_logico);
            8: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
begin
    clrscr;
    Menu();
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
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1 Nueva\Archivos_txt\novelas.txt');
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