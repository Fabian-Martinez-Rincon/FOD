{5. Realizar un programa para una tienda de celulares, que presente un menú con
opciones para:
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
correspondientes a los celulares, deben contener: código de celular, el nombre,
descripción, marca, precio, stock mínimo y el stock disponible.
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
stock mínimo.
c. Listar en pantalla los celulares del archivo cuya descripción contenga una
cadena de caracteres proporcionada por el usuario.
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
“celular.txt” con todos los celulares del mismo.

NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el usuario
una única vez.
NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique en
dos líneas consecutivas: en la primera se especifica: código de celular, el precio, marca
y nombre, y en la segunda el stock disponible, stock mínimo y la descripción, en ese
orden. Cada celular se carga leyendo dos líneas del archivo “carga.txt”.}
program cinco;
type
	celular = record
		cod: integer;
		nom: string;
		des: string;
		//marca: string;
		precio: real;
		stockMin: integer;
		stock: integer;
	end;
	archivo_c = file of celular;

{PROCESOS}
{INCISO A}
procedure crearArchivo(var arch: archivo_C);
var
	fisico: string;
	carga: text;
	c: celular;
begin
	writeln(' ');
	writeln('-------------- USTED ELIGIO LA OPCION DE CARGAR UN ARCHIVO BINARIO --------------');
	writeln('Nombre del archivo fisico: ');
	readln(fisico); 
	assign(arch,fisico);
	assign(carga,'C:\Users\guada\Desktop\FACULTAD\2021\PRIMERSEMESTRE\FOD\Practica 1\celulares.txt');
	rewrite(arch);
	reset(carga);
	while(not  eof(carga)) do begin
		with c do readln(carga, cod, precio, nom);
		with c do readln(carga, stock, stockMin, des);
		write(arch, c);
	end;
	writeln('Archivo cargado.');
	close(arch); close(carga);
end;

{INCISO B}
procedure listarStockMin(var arch:archivo_c);
var
	c:celular;
begin
	writeln(' ');
	writeln('-------------- USTED ELIGIO LA OPCION DE LISTAR STOCK MINIMO --------------');
	reset(arch);
	while(not eof(arch)) do begin
		read(arch, c);
		if c.stock < c.stockMin then writeln('Nombre: ',c.nom,' - Codigo:', c.cod);
	end;
	close(arch);
end;

{INCISO C}
procedure listarDescUsuario(var arch:archivo_c);
var
	desc: string;
	c:celular;
begin
	reset(arch);
	writeln(' ');
	writeln('USTED ELIGIO LA OPCION DE LISTAR CELULARES CON SU DESCRIPCION');
	writeln('---------------');
	writeln('Ingrese una descripcion: '); readln(desc);
	while(not eof(arch)) do begin
		read(arch, c);
		if(c.des = desc) then writeln('Nombre: ',c.nom,' - Codigo:', c.cod);
	end;
	close(arch);
end;

{INCISO D}
procedure exportar(var arch:archivo_c);
var
	carga: text;
	c:celular;
begin
	writeln(' ');
	writeln('-------------- USTED ELIGIO LA OPCION DE EXPORTAR A celular.txt --------------');
	assign(carga, 'C:\Users\guada\Desktop\FACULTAD\2021\PRIMERSEMESTRE\FOD\Practica 1\celular.txt');
	reset(arch);
	rewrite(carga);
	while(not eof(arch)) do begin
		read(arch,c);
		with c do
			writeln(carga,' ',cod,' ',nom,' ', des,' ',precio,' ',stockMin,' ',stock);
		end;
	writeln('-------------- Exportado exitosamente --------------');
	close(arch); close(carga);
end;

{PP}
var
	arch: archivo_c;
	opcion: integer;
begin
	opcion:=0;
	while(opcion < 5)do begin
	writeln('Ingrese una opcion: ');
	writeln('1: Crear archivo');
	writeln('2: Listar clulares con stock menor al minimo.');
	writeln('3: Listar celulares con descripcion ingresada por usted.');
	writeln('4: Exportar a txt');
	readln(opcion);
	case opcion of
		1: crearArchivo(arch);
		2: listarStockMin(arch);
		3: listarDescUsuario(arch);
		4: exportar(arch);
	end;
	end;
end.