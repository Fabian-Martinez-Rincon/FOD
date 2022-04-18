{Definir un programa que genere un archivo con registros de longitud fija conteniendo
información de empleados de una empresa de correo privado. Se deberá almacenar:
código de empleado, apellido y nombre, dirección, teléfono, D.N.I y fecha
nacimiento. Implementar un algoritmo que, a partir del archivo de datos generado,
elimine de forma lógica todo los empleados con DNI inferior a 8.000.000.
Para ello se podrá utilizar algún carácter especial delante de algún campo String a su
elección. Ejemplo: ‘*PEDRO.}
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