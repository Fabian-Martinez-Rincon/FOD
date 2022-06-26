Indice
=================

<!--ts-->
   * [Archivos](#Archivos)
     *  [Crear](#Crear)
     *  [Imprimir](#Imprimir)
     *  [Actualizar](#Actualizar)
     *  [Agregar](#Agregar)
     *  [Exportar a TXT](#Exportar_A_TXT)
     *  [Menu](#Menu)


Archivos
========

Crear
-----
    ```Pas
    procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
    var
        p:persona;
    begin
        writeln( 'Ingrese el nombre del archivo:' );
        Readln( arch_fisico );          
        assign( arch_logico, arch_fisico );
        rewrite( arch_logico );        
        readln(x);                
        while x <> 0 do          
        begin
            write( arch_logico, x); 
            readln(x);
        end;
        close( arch_logico ); 
    end;
    ```

Imprimir
---------
    ```Pas
    procedure ImprimirArchivo(var arch_logico:archivo);
    var
        x:integer;
    begin
        reset(arch_logico); 
        while(not eof(arch_logico)) do begin
            read(arch_logico, x);
            WriteLn('x : ',x);
            WriteLn('__________');
        end;
        close(arch_logico);
    end;

    ```
Actualizar
----------
```Pas
procedure Actualizar(var arch_logico:archivo);
var
    x:Integer;
    actual:Integer;
    Encontro:Boolean;
begin
    reset(arch_logico);
    WriteLn('Ingrese un nro para remplazarlo: ');
    ReadLn(x);
    Encontro:=false;
    while(not eof(arch_logico))and(not Encontro) do 
    begin
        read(arch_logico, actual);
        if(actual = x) then Encontro:=true;
    end;
    if Encontro then
    begin
        writeln('Nro de Remplazo: '); readln(x);
        seek(arch_logico, filepos(arch_logico)-1);
        write(arch_logico, x);
    end   
    else
        WriteLn('No existe el nro');
end;
```

Agregar
-------
```Pas
procedure Agregar(var arch_logico:archivo);
var
    x:integer;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,x);
    Readln(x);
    write(arch_logico, x);
    close(arch_logico);
end;
```

Exportar_A_TXT
--------------

```Pas
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
```
Menu
----
```Pas
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
```
