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