<h1 align="center">Practica 3</h1>

<h1 align="center">Archivos Secuenciales - Bajas</h1>

```1)``` Modificar el ejercicio 4 de la práctica 1 (programa de gestión de empleados), agregándole una opción para realizar bajas copiando el último registro del archivo en la posición del registro a borrar y luego truncando el archivo en la posición del último registro de forma tal de evitar duplicados. 

<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej1;
const
    valorAlto = 9999;
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
	assign(carga, 'todos_empleados.txt');
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
    assign(carga, 'faltaDNIEmpleados.txt');
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
procedure leer(var arch:archivo; var aux:empleado);
begin
	if(not eof(arch))then 
		read(arch,aux)
    else 
		aux.nro:=valorAlto;
end;
//_______________________________________________
{se sabe que existe Carlos Garcia}
procedure bajaLogica(var x:archivo);
var
    datox:empleado;
    ultimoR:empleado;
    nro:integer;
begin 
	assign(x, 'archivo.data');
	reset(x);
    Seek(x,FileSize(x)-1); {Guardo el ultimo Registro}
	leer(x,datox);
    reset(x); {Abro el archivo desde el princio, no se si es buena practica, despues me fijo en el libro}
    leer(x,datox);
    WriteLn('Ingrese el nro del empleado que quiere eliminar: ');
    ReadLn(nro);
	while (datox.nro <> nro) and (datox.nro <> valorAlto) do	leer(x, datox);
    if (datox.nro <> valorAlto) then
    begin
	    seek(x, filepos(x)-1);
	    write(x, datox);
        seek(x, FileSize(x)-1);
	    Truncate(x);
    end
    else
        WriteLn('No se encontro el nro del empleado');
	
	close(x);
end;
//_______________________________________________
procedure Menu();
var 
    categoria:integer;
    arch_logico: archivo;
	arch_fisico: cadena20;
begin
    categoria:= 0;
    arch_fisico:='archivo.data';                        
	assign(arch_logico, arch_fisico);
	while (categoria <> 10)do begin
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
        writeln('9 | Baja Logica del ultimo empleado');
        writeln('10 | Cerrar Menu');
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
            9: bajaLogica(arch_logico);
            10: WriteLn('Archivo Cerrado');
			else writeln('Numero invalido'); 
		end;
	end;
end;
//_______________________________________________
begin
    Menu();
end.
```

</details>

```2)``` Definir un programa que genere un archivo con registros de longitud fija conteniendo
información de asistentes a un congreso a partir de la información obtenida por
teclado. Se deberá almacenar la siguiente información: nro de asistente, apellido y
nombre, email, teléfono y D.N.I. Implementar un procedimiento que, a partir del
archivo de datos generado, elimine de forma lógica todos los asistentes con nro de
asistente inferior a 1000.

Para ello se podrá utilizar algún carácter especial situándolo delante de algún campo
String a su elección. Ejemplo: ```@Saldaño.```

<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej2;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    empleado = record
        codigo:integer;
        apellido:cadena20;
        nombre:cadena20;
        direccion:integer;
        telefono:integer;
        dni:Integer;
        fecha:cadena20;
    end;
    maestro = file of empleado;
//____________________________________________________
procedure CrearMaestro(var m:maestro);
var
	carga: text;
	a: empleado;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
	    with a do readln(carga, codigo, apellido, nombre);
        with a do readln(carga, direccion, telefono, dni);
        with a do readln(carga, fecha);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//____________________________________________________
Procedure Imprimir(var m:maestro);
var  
    nro:empleado;  
begin
    reset(m); 
    while not eof(m) do 
    begin
        WriteLn('_________________');
        read(m, nro );
        write(nro.codigo);
        write(nro.apellido);
        writeln(nro.nombre);
        write(nro.direccion,' ');
        write(nro.telefono,' ');
        writeln(nro.dni);
        writeln(nro.fecha);       
        WriteLn('_________________');    
    end;
    close(m);
end;
//____________________________________________________
procedure leer (var archivo:maestro; var dato:empleado);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.codigo := valoralto;
end;
procedure bajaLogica(var x:maestro);
var
    datox:empleado;
begin 
	assign(x, 'maestro.data');
	reset(x);
	leer(x, datox);
    while datox.codigo <> valorAlto do
    begin
        if (datox.dni<800) then
        begin
            datox.apellido:='*'+datox.apellido;
            seek(x, filepos(x)-1);
            write(x, datox);
        end;
        leer(x, datox);        
    end;
	close(x);
end;
//____________________________________________________
procedure exportarTxt(var x: maestro);
var
	carga:text;
	datox: empleado;
begin
	assign(carga,'eliminados.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,codigo,' ',apellido);
	end;
	close(x); close(carga);
end;
//____________________________________________________
var
    m:maestro;
begin
    CrearMaestro(m);
    Imprimir(m);
    bajaLogica(m);
    Imprimir(m);
    exportarTxt(m);
end.
```

</details>

```3) ``` Realizar un programa que genere un archivo de novelas filmadas durante el presente año. De cada novela se registra: código, género, nombre, duración, director y precio. El programa debe presentar un menú con las siguientes opciones: 

- ```a)``` Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se utiliza la técnica de lista invertida para recuperar espacio libre en el archivo. Para ello, durante la creación del archivo, en el primer registro del mismo se debe almacenar la cabecera de la lista. Es decir un registro ficticio, inicializando con el valor cero (0) el campo correspondiente a código de novela, el cual indica que no hay espacio libre dentro del archivo.

- ```b)``` Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el inciso a., se utiliza lista invertida para recuperación de espacio. En particular, para el campo de ´enlace´ de la lista, se debe especificar los números de registro referenciados con signo negativo, (utilice el código de novela como enlace).Una vez abierto el archivo, brindar operaciones para:

  - ```i)``` Dar de alta una novela leyendo la información desde teclado. Para esta operación, en caso de ser posible, deberá recuperarse el espacio libre. Es decir, si en el campo correspondiente al código de novela del registro cabecera hay un valor negativo, por ejemplo -5, se debe leer el registro en la posición 5, copiarlo en la posición 0 (actualizar la lista de espacio libre) y grabar el nuevo registro en la posición 5. Con el valor 0 (cero) en el registro cabecera se indica que no hay espacio libre.

  - ```ii)```  Modificar los datos de una novela leyendo la información desde teclado. El código de novela no puede ser modificado.

  - ```iii)``` Eliminar una novela cuyo código es ingresado por teclado. Por ejemplo, si se da de baja un registro en la posición 8, en el campo código de novela del registro cabecera deberá figurar -8, y en el registro en la posición 8 debe copiarse el antiguo registro cabecera.

- ```c)``` Listar en un archivo de texto todas las novelas, incluyendo las borradas, que representan la lista de espacio libre. El archivo debe llamarse ```novelas.txt```.

```
NOTA: Tanto en la creación como en la apertura el nombre del archivo 
debe ser proporcionado por el usuario.
```
<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej3;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    novela = record
        codigo:integer;
        genero:integer;
        nombre:cadena20;
        duracion:integer;
        director:cadena20;
        precio:Integer;
    end;
    maestro = file of novela;
//_________________________________________
procedure LeerNovela(var n:novela);
begin
    writeln('Codigo: ');ReadLn(n.codigo);
    if (n.codigo <> valorAlto) then
    begin
        writeln('Genero: ');ReadLn(n.genero);
        writeln('Nombre: ');ReadLn(n.nombre);
        writeln('Duración: ');ReadLn(n.duracion);
        writeln('Director: ');ReadLn(n.director);
        writeln('Precio: ');ReadLn(n.precio);
    end;
    
end;
//_________________________________________
procedure Crear(var m:maestro);
var
    nov:novela;
begin
    assign(m,'maestro.data');
    rewrite(m); 
    nov.codigo:=0;           //lista invertida
    write(m,nov);
    LeerNovela(nov);
    while (nov.codigo <> valorAlto) do 
    begin
        write(m,nov); 
        LeerNovela(nov);
    end;
    close(m);  
end;
//_________________________________________
procedure Leer (var archivo:maestro;var dato:novela);
begin
    if(not EOF(archivo)) then
        read(archivo,dato)
    else
        dato.codigo:=valoralto;
end;
//_________________________________________
procedure Alta(var m:maestro);
var
    cabecera,n:novela;
begin
    Reset(m);
    leer(m,cabecera);
    LeerNovela(n);
    if (cabecera.codigo = 0) then
    begin //Si tengo la cabecera vacia agrego el elemento al final
        Seek(m,FileSize(m));
        Write(m,n);
    end
    else 
        begin
            //Ej si el resultado es -5 voy a la posicion 5
            //(La cabecera siempre tiene que ser un nro negativo o 0)
            Seek(m,(cabecera.codigo*(-1)));
             //Una vez que me ubico, en el lugar libre, remplazo el elemento
            read(m,cabecera);
            Seek(m,FilePos(m)-1);
            Write(m,n);
            Seek(m,0);
            Write(m,cabecera);
            //Guardo el elemento que habia en la posicion 5
        end;
    Close(m);
end;
//_________________________________________
procedure modificar(var arch:maestro);
var
	n:novela;
	cod:integer;
begin
    writeln('Ingrese el codigo de la novela a modificar:');
    readln(cod);
    reset(arch);
    leer(arch,n);
    if(n.codigo <> valoralto)then begin
		while(n.codigo <> cod)do leer(arch,n);
		n.codigo:=cod;
		write('Genero de novela:'); readln(n.genero);
        write('Nombre de novela:'); readln(n.nombre);
        write('Duracion de novela:'); readln(n.duracion);
        write('Director de novela:'); readln(n.director);
        write('Precio de novela:'); readln(n.precio);
		seek(arch,filepos(arch)-1);
		write(arch,n);
    end;
    close(arch);
end;
//_________________________________________
procedure baja(var arch:maestro);
var 
    n,actual:novela;
    num,pos:integer;
begin
    reset(arch);
    read(arch,actual);
    writeln('Ingrese el codigo de la novela a eliminar:'); 
    readln(num);
    leer(arch,n);
    while (n.codigo <> num) do	    //busco hasta encontrar el numero
		leer(arch,n);
    if n.codigo = num then begin //si lo encuentro guardo la posicion
        pos:=filepos(arch)-1; //guardo la posicion de la baja
        n:=actual;
        seek(arch,pos); 
        write(arch,n); //sobreescribo la baja con los datos de cabecera
        actual.codigo:=-pos;

        seek(arch,0); //me paro en el principio de la lista
        write(arch,actual);
    end
    else 
        writeln('No se encuentra el codigo.');
    close(arch);
end;
//_________________________________________
procedure Menu(var m:maestro);
var
    opcion:integer;
begin
    opcion:=0;
    while opcion <= 3 do
    begin
        WriteLn('1| Dar de alta');
        WriteLn('2| Modificar');
        WriteLn('3| Baja');
        WriteLn('4| Cerrar programa');
        ReadLn(opcion);
        case opcion of
            1: Alta(m);
            2: Modificar(m);
            3: Baja(m);
        end;
    end;
  
end;
//_________________________________________
procedure exportarTxt(var x: maestro);
var
	carga:text;
	datox: novela;
begin
	assign(carga,'novelas.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,codigo,' ',nombre, ' ', genero);
	end;
	close(x); close(carga);
end;
//_________________________________________
var
    m:maestro;
begin
    Crear(m);
    Menu(m);
    exportarTxt(m);
end.
```

</details>

```4)``` Dada la siguiente estructura: 

```Pas
type
    tTitulo = String[50];
    tArchRevistas = file of tTitulo;
```

Las bajas se realizan apilando registros borrados y las altas reutilizando registros borrados. El registro 0 se usa como cabecera de la pila de registros borrados: el número 0 implica que no hay registros borrados y N indica que el próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.

- ```a)``` Implemente el siguiente módulo:

```Pas
{Abre el archivo y agrega el título de la revista, recibido como
parámetro manteniendo la política descripta anteriormente}
procedure agregar (var a: tArchRevistas ; titulo: string);
```

- ```b)``` Liste el contenido del archivo omitiendo las revistas eliminados. Modifique lo que considere necesario para obtener el listado.

<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej4;
const
    valorAlto = 'ZZZZ';
type
    tTitulo = String[50];
    tArchRevistas = file of tTitulo ;
//__________________________________________
procedure CrearConTexto(var m:tArchRevistas);
var
	carga: text;
	a: tTitulo;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
	    readln(carga, a);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//__________________________________________
procedure Leer(var archivo:tArchRevistas; var dato:tTitulo);
begin
    if(not EOF(archivo)) then
        read(archivo,dato)
    else
        dato:=valoralto;
end;
//__________________________________________
procedure agregar(var t:tArchRevistas; titulo:tTitulo);
var
    nro:integer;
    nroString,aux:tTitulo;
begin
    Reset(t);
    Leer(t,nroString);
    Val(nroString,nro); //Leo la cabecera y lo convierto a entero
    if (nro <> 0) then
    begin
        Seek(t,nro); Read(t,aux);              //Me posiciono en la cabecera y me quedo con lo que tenia
        Seek(t,FilePos(t)-1); Write(t,titulo); //Agrego el dato en el lugar que tenia una baja 
        Seek(t,0);   Write(t,aux);             //Guardo el dato en aux
    end
    else
        begin
            Seek(t,FilePos(t)); Write(t,aux); //Agrego al final del todo
        end;
    Close(t);
end;
//__________________________________________
procedure listado(var m:tArchRevistas);
var
	t:tTitulo;
    tInt:Integer;
begin
	assign(m,'maestro.data');
	reset(m);
	leer(m,t);
    WriteLn('Los titulos que no se borraron');
	while (t <> valoralto) do begin
        Val(t,tInt);
        if (tInt <> 0) then
            WriteLn(tInt);
        leer(m,t);
	end;
	close(m);
end;
var
    titulo:tTitulo;
    t:tArchRevistas;
begin
    titulo:='Hola';
    CrearConTexto(t);
    agregar(t,titulo);
    listado(t);
end.
```

</details>

```5)``` Dada la estructura planteada en el ejercicio anterior, implemente el siguiente módulo: 

```Pas
{Abre el archivo y elimina el título de la revista recibida como
parámetro manteniendo la política descripta anteriormente}
procedure eliminar (var a: tArchRevistas ; titulo: string);
```

<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej5;
const
    valorAlto = 'ZZZZ';
type
    tTitulo = String[50];
    tArchRevistas = file of tTitulo ;
//__________________________________________
procedure CrearConTexto(var m:tArchRevistas);
var
	carga: text;
	a: tTitulo;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
	    readln(carga, a);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//__________________________________________
procedure Leer(var archivo:tArchRevistas; var dato:tTitulo);
begin
    if(not EOF(archivo)) then
        read(archivo,dato)
    else
        dato:=valoralto;
end;
//__________________________________________
procedure agregar(var t:tArchRevistas; titulo:tTitulo);
var
    nro:integer;
    nroString,aux:tTitulo;
begin
    Reset(t);
    Leer(t,nroString);
    Val(nroString,nro); //Leo la cabecera y lo convierto a entero
    if (nro <> 0) then
    begin
        Seek(t,nro); Read(t,aux);              //Me posiciono en la cabecera y me quedo con lo que tenia
        Seek(t,FilePos(t)-1); Write(t,titulo); //Agrego el dato en el lugar que tenia una baja 
        Seek(t,0);   Write(t,aux);             //Guardo el dato en aux
    end
    else
        begin
            Seek(t,FilePos(t)); Write(t,aux); //Agrego al final del todo
        end;
    Close(t);
end;
//__________________________________________
procedure listado(var m:tArchRevistas);
var
	t:tTitulo;
    tInt:Integer;
begin
	assign(m,'maestro.data');
	reset(m);
	leer(m,t);
    WriteLn('Los titulos que no se borraron');
	while (t <> valoralto) do begin
        Val(t,tInt);
        if (tInt <> 0) then
            WriteLn(tInt);
        leer(m,t);
	end;
	close(m);
end;
//__________________________________________
procedure eliminar(var t:tArchRevistas; titulo:tTitulo);
var
    dato,cabecera,posString:tTitulo;
    pos:integer;
begin
    Assign(t,'maestro.data');
    Reset(t);
    Leer(t,cabecera); //Guardo la cabecera
    while (dato <> valorAlto) and (dato <> titulo) do Leer(t,dato);

    if (dato = titulo) then
    begin
        pos:=(FilePos(t)-1);        //Guardo la posicion del archivo a eliminar
        Seek(t,pos); Write(t,cabecera); //Remplazo el dato
        
        Str(pos,posString);
        Seek(t,0); Write(t,posString);//Pongo en la cabecera el archivo que elimine
    end
    else
        WriteLn('El titulo no se encontro');    
    Close(t);
end;
//__________________________________________
var
    titulo:tTitulo;
    t:tArchRevistas;
begin
    titulo:='Hola';
    CrearConTexto(t);
    agregar(t,titulo);
    listado(t);
    eliminar(t,titulo);
end.
```

</details>

```6)``` Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con la información correspondiente a las prendas que se encuentran a la venta. De cada prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba ambos archivos y realice la baja lógica de las prendas, para ello deberá modificar el stock de la prenda correspondiente a valor negativo.

Por último, una vez finalizadas las bajas lógicas, deberá efectivizar las mismas
compactando el archivo. Para ello se deberá utilizar una estructura auxiliar, renombrando
el archivo original al finalizar el proceso.. Solo deben quedar en el archivo las prendas
que no fueron borradas, una vez realizadas todas las bajas físicas. 

<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej6;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    prenda = record
        cod_prenda:integer;
        descripcion:cadena20;
        colores:cadena20;
        tipo_prenda:cadena20;
        stock:integer;
        precio:real;
    end;
    maestro = file of prenda;
    detalle = file of integer; //Archivo con los codigos de prendas
//____________________________________________
procedure ImportarMaestro(var m:maestro);
var
	carga: text;
	a: prenda;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); Reset(carga);
	while(not eof(carga))do begin
	    with a do readln(carga, cod_prenda,descripcion,colores,tipo_prenda,stock,precio);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//____________________________________________
procedure ImportarDetalle(var d:detalle);
var
	carga: text;
	a: Integer;
begin
	assign(d,'detalle.data');
	assign(carga,'detalle.txt');
	rewrite(d); Reset(carga);
	while(not eof(carga))do begin
        readln(carga, a);
	    write(d,a);
	end;
	close(d); close(carga);
end;
//____________________________________________
procedure LeerD(var arch:detalle; var dato:integer);
begin
	if(not eof(arch))then 
        read(arch,dato)
	else 
        dato:=valoralto;
end;
procedure LeerM(var arch:maestro; var dato:prenda);
begin
	if(not eof(arch))then 
        read(arch,dato)
	else 
        dato.cod_prenda:=valoralto;
end;
//____________________________________________
procedure bajaLogica(var m:maestro;var d:detalle);
var
    datoM:prenda;
    datoD:Integer;
begin
    Reset(m);       Reset(d);
    LeerD(d,datoD);  
    while datoD <> valorAlto do
    begin
        Seek(m,0); LeerM(m,datoM); //Leo lo que tengo en la cabecera
        while datoM.cod_prenda <> valorAlto do 
        begin
            if (datoM.cod_prenda = datoD) then
            begin
                datoM.stock:=-1;
                Seek(m,FilePos(m)-1); Write(m,datoM);
            end;
            LeerM(m,datoM);
        end;
        LeerD(d,datoD); 
    end;
    Close(m); Close(d);
end;
//____________________________________________
procedure bajaFisica(var m,mAux:maestro);
var
    datoM:prenda;
begin
    Reset(m); Rewrite(mAux);
    LeerM(m,datoM);
    while datoM.cod_prenda <> valorAlto do
    begin
        if (datoM.cod_prenda = -1) then
            Write(mAux,datoM);
        LeerM(m,datoM);
    end;
    Close(m); Close(mAux);
    Erase(m); //Elimino el archivo maestro
    Rename(mAux,'maestro');
end;
//____________________________________________
var
    m,mAux:maestro;
    d:detalle;
begin
    Assign(mAux,'maestrox.data');
    ImportarMaestro(m);
    ImportarDetalle(d);
    bajaLogica(m,d);
    bajaFisica(m,mAux);
end.
```

</details>

```7)``` Se cuenta con un archivo que almacena información sobre especies de aves en
vía de extinción, para ello se almacena: código, nombre de la especie, familia de ave,
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice
un programa que elimine especies de aves, para ello se recibe por teclado las especies a
eliminar. Deberá realizar todas las declaraciones necesarias, implementar todos los
procedimientos que requiera y una alternativa para borrar los registros. Para ello deberá implementar dos procedimientos, uno que marque los registros a borrar y posteriormente
otro procedimiento que compacte el archivo, quitando los registros marcados. Para
quitar los registros se deberá copiar el último registro del archivo en la posición del registro
a borrar y luego eliminar del archivo el último registro de forma tal de evitar registros
duplicados.


```
Nota: Las bajas deben finalizar al recibir el código 500000
```

<details>

<summary>📚 Resolución</summary>
<br/>

```Pas
program Ej7;
const
    valorAlto = 9999;
type    
    cadena20 = string[20];
    ave = record
        codigo:integer;
        nombre:cadena20;
        familia:cadena20;
        descripcion:cadena20;
        zona:cadena20;
    end;
    maestro = file of ave;
//_________________________________________
procedure Leer (var archivo:maestro; var dato:ave);
begin
    if (not EOF(archivo)) then
        read(archivo,dato) //en dato=el dato apuntado en archivoDeta
    else
        dato.codigo:=valoralto; //para cortar el while 
end;
//_________________________________________
procedure BajaLogica(var m:maestro);
var
    datoM:ave;
    codigoAve:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);       
    WriteLn('El codigo del ave que quiere eliminar: ');
    ReadLn(codigoAve);
    while codigoAve <> 500 do
    begin
        Leer(m,datoM); //Leo lo que tengo en la cabecera
        while datoM.codigo <> valorAlto do 
        begin
            if (datoM.codigo = codigoAve) then
            begin
                datoM.codigo:=-1;
                Seek(m,FilePos(m)-1); Write(m,datoM);
            end;
            Leer(m,datoM);
        end;
        WriteLn('El codigo del ave que quiere eliminar: ');
        ReadLn(codigoAve);
        Seek(m,0);
    end;
    Close(m); 
end;
{procedure marcar(var arch:archivo); //Esto es para preguntar, no le des mucha bola
var
	reg: viaExtincion;
	cod: integer;
begin
	reset(arch);
	cod:=0;
	leer(arch,reg);
	while (reg.cod <> valoralto) and (cod <> valoralto) do begin
		writeln('Ingrese el codigo de especie a eliminar: ');
		read(cod);
		if(cod <> valoralto)and(reg.cod <> valoralto)then begin
			while(cod <> reg.cod)and(valoralto <> reg.cod) do leer(arch,reg);
			if cod = reg.cod then begin
				reg.cod := -1;
				seek(arch,filepos(arch)-1);
				writeln(reg.cod);
				write(arch,reg);
			end;
		end;
		reset(arch);
	end;
	close(arch);
end;}
//_________________________________________
procedure BuscarUltimo(var m:maestro;var ultimo:ave; var posUlt:Integer);
begin
    Seek(m,posUlt); //Nos vamos moviendo para atras
    Read(m,ultimo);
    while ultimo.codigo = -1 do //Busco el ultimo registro no borrado
    begin
        Seek(m,posUlt-1);   //Voy al anterior
        posUlt:=FilePos(m); //Guardo el anterior
        Read(m,ultimo);     //Continuo leyendo normal
    end;
end;
//_________________________________________
procedure BajaFisica(var m:maestro);
var
    datox,ultimo:ave;
    pos,posUlt:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);
    Leer(m,datox);
    //Me quedo con la ultima posicion en la que tengo un registro
    //ya que es mas facil manejar el corte del archivo
    posUlt:=FilePos(m)-1; 
    while (datox.codigo <> valorAlto) and (FilePos(m) <= posUlt) do
    begin
        pos:=FilePos(m);
        if (datox.codigo = -1) then
        begin
            BuscarUltimo(m,ultimo,posUlt);
            posUlt:=posUlt-1;               //Decremento mi posUlt ya que encontre el eliminado
            Seek(m,pos-1); Write(m,ultimo); //remplazo el dato
        end;
        Leer(m,datox);
    end;
    Seek(m,posUlt+1); //Voy a la ultima posicion que seria EOF ya que antes esta en la anteultima
    //Para trabajar con solo los registros
    //Trunca un fichero en la posición actual. Dicha posición actual se convierte en el fin de fichero (EOF).
    Truncate(m);
    Close(m);
end;
//_________________________________________
var
    m:maestro;
begin
    BajaLogica(m);
    BajaFisica(m);
end.
```

</details>

