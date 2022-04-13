program Ej2;
type
    cadena20 = string[20];
    alumno = record
        codigo:integer;
        apellido:cadena20;
        nombre:cadena20;
        aprobadas:integer;
        promocionadas:integer;
    end;
    archivoMaestro = file of alumno;
	
	alumnoDetalle = record
		codigo:integer;
		nombre:cadena20;
		final_Calificacion:char;
		cursada_Calificacion:char;
	end;
	archivoDetalle = file of alumnoDetalle;
//_____________________________________________________________
procedure CrearArchivoMaestro(var arch_logico:archivoMaestro);
var
	carga: text;
	alum: alumno;
begin
	assign(arch_logico,'maestro.data');
	assign(carga, 'alumnos.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		readln(carga, alum.codigo);
        readln(carga, alum.apellido);
        readln(carga, alum.nombre);
        readln(carga, alum.aprobadas);
        ReadLn(carga, alum.promocionadas);
		write(arch_logico, alum);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure Imprimir(var arch_logico:archivoMaestro);
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
procedure CrearArchivoDetalle(var arch_logico:archivoDetalle);
var
	carga: text;
	alum: alumnoDetalle;
begin
	assign(arch_logico,'detalle.data');
	assign(carga, 'detalle.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with alum do readln(carga, codigo, nombre);
		with alum do readln(carga, final_Calificacion);
		with alum do readln(carga, cursada_Calificacion);
		write(arch_logico, alum);
	end;
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//_____________________________________________________________
procedure ListarArchivoMaestro(var arch_logico:archivoMaestro);
var
	carga: text;
	alum: alumno;
begin
	assign(carga, 'reporteAlumnos.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,alum);
		with alum do
			writeln(carga,' ',codigo,' ',apellido,' ',nombre,' ', aprobadas,' ', promocionadas);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_____________________________________________________________
procedure ListarArchivoDetalle(var arch_logico:archivoDetalle);
var
	carga: text;
	alum: alumnoDetalle;
begin
	assign(carga, 'reporteDetalle.txt');
	reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do begin
		read(arch_logico,alum);
		with alum do
			writeln(carga,' ',codigo,' ',nombre,' ', final_Calificacion,' ', cursada_Calificacion);
		end;
	writeln('________ Exportado Crack ________');
	close(arch_logico); close(carga);
end;
//_____________________________________________________________
procedure leer(var arch:archivoDetalle; var dato:alumnoDetalle);
begin
	if(not eof(arch))then read(arch,dato)
		else dato.codigo:=9999;
end;

//_____________________________________________________________
procedure ActualizarMaestro(var maestro:archivoMaestro; var detalle:archivoDetalle);
var
	regMaestro:alumno;
	regDetalle:alumnoDetalle;
	actual:integer;
	final,cursada:integer;
begin
	Reset(maestro);
	Reset(detalle);
	Read(maestro,regMaestro);
	leer(detalle,regDetalle);
	while regDetalle.codigo <> 9999 do
	begin
		final:=0;
		cursada:=0;
		actual:=regDetalle.codigo;
		while actual = regDetalle.codigo do
		begin
			if regDetalle.final_Calificacion = 'A' then
				final:=final+1;
			if regDetalle.cursada_Calificacion = 'A' then
				cursada:=cursada+1;
			leer(detalle,regDetalle);
		end;
		while (regMaestro.codigo <> actual) do 
			Read(maestro,regMaestro);
		regMaestro.aprobadas:=regMaestro.aprobadas+cursada;
		regMaestro.promocionadas:=regMaestro.promocionadas+final;
		Seek(maestro, FilePos(maestro)-1);
		Write(maestro,regMaestro);
		if (not eof(maestro)) then read(maestro,regMaestro);
	end;
	Close(maestro);
	Close(detalle)
end;
//_____________________________________________________________
procedure ListarMasDeCuatro(var maestro:archivoMaestro);
var
	carga:text;
	alum:alumno;
begin
	assign(carga, 'masDe4.txt');
	assign(maestro, 'maestro.data');
	Reset(maestro);
	Rewrite(carga);
	while (not eof(maestro)) do
	begin
		Read(maestro,alum);
		if((alum.promocionadas-alum.aprobadas)>=4) then //alum.aprobadas-alum.promocionadas Es asi pero lo hice de otra forma para probar
		begin
			with alum do
				WriteLn(carga, ' ', codigo, ' ',apellido, ' ', nombre, ' ',aprobadas,' ', promocionadas );
		end;
	end;
	close(maestro);
	close(carga);
end;
//_____________________________________________________________
var
    maestro:archivoMaestro;
	detalle:archivoDetalle;
    opcion:integer;
begin
    opcion:=0;
	while(opcion < 7) do begin
		writeln('1: Crear el archivoMaestro maestro a partir de un archivoMaestro de texto llamado "alumnos.txt"');
		writeln('2: Crear el archivoMaestro detalle a partir de un archivoMaestro de texto llamado "detalle.txt"');
		writeln('3: Listar el contenido del archivo maestro en un archivo de texto llamado "reporteAlumnos.txt".');
		writeln('4: Listar el contenido del archivo detalle en un archivo de texto llamado "reporteDetalle.txt"');
		WriteLn('5: Actualizar el archivo maestro');
		WriteLn('6: Alumnos que tengan más de cuatro materias con cursada aprobada pero no aprobaron el final. Deben listarse todos los campos. ');
		readln(opcion);
		case opcion of 
			1:CrearArchivoMaestro(maestro);
			2:CrearArchivoDetalle(detalle);
			3:ListarArchivoMaestro(maestro);
			4:ListarArchivoDetalle(detalle);
			5:ActualizarMaestro(maestro,detalle);
			6:ListarMasDeCuatro(maestro);
		end;
	end;
end.