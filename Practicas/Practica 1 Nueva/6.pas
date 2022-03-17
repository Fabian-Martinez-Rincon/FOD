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