program dos;
type
    cadena20 = string[20];
    alumno = record
        codigo:integer;
        apellido:cadena20;
        nombre:cadena20;
        aprobadas:integer;
        promocionadas:integer;
    end;
    archivo = file of alumno;
//_____________________________________________________________
procedure crearArchivo(var arch_logico:archivo);
var
	carga: text;
	alum: alumno;
begin
	assign(arch_logico,'maestro_dos.data');
	assign(carga, 'alumnos.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		readln(carga, alum.codigo);
        readln(carga, alum.apellido);
        readln(carga, alum.nombre);
        readln(carga, alum.apellido);
        ReadLn(carga, alum.promocionadas);
		write(arch_logico, alum);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure Imprimir(var arch_logico:archivo);
var
    alum:alumno;
begin
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, alum);
        WriteLn('Codigo:',alum.codigo);
        writeln('Nombre:', alum.nombre);
        WriteLn('_________');
	end;
	close(arch_logico);
end;
//_____________________________________________________________
procedure crearArchivoDetalle(var arch_logico:archivo);
var
	carga: text;
	alum: alumno;
begin
	assign(arch_logico,'detalle_dos.data');
	assign(carga, 'detalle.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		readln(carga, alum.codigo);
        readln(carga, alum.apellido);
        readln(carga, alum.nombre);
        readln(carga, alum.apellido);
        ReadLn(carga, alum.promocionadas);
		write(arch_logico, alum);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
var
    maestro:archivo;
    fisico:cadena20;
    opcion:integer;
begin
     
    opcion:=0;
	while(opcion < 7) do begin
		writeln('1: Crear el archivo maestro a partir de un archivo de texto llamado "alumnos.txt"');
		writeln('2: Crear el archivo detalle a partir de un archivo de texto llamado "detalle.txt"');
		readln(opcion);
		case opcion of 
			1:CrearArchivo(maestro);
			2:crearArchivoDetalle(maestro);
		end;
        Imprimir(maestro);
	end;
    
end.