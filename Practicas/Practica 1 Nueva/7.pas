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