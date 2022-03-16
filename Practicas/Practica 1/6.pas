program seis; //Fabian Martinez Rincon
uses crt;
type
    cadena20 = string[20];
    articulo = record
        nombre:cadena20;
        descripcion:cadena20;
        precio:real;
        stock:integer;
    end;
    archivo = file of articulo;
//__________________________________________________
procedure crearArchivo(var arch_logico:archivo;arch_fisico:cadena20);
var
	carga: text;
	art: articulo;
begin
    arch_fisico:='Seis';
	writeln('Nombre del archivo fisico: ',arch_fisico);                        
	assign(arch_logico,arch_fisico);
	assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\carga2.txt');
	rewrite(arch_logico);
	reset(carga);
	while(not  eof(carga)) do 
    begin
		with art do readln(carga, precio, nombre);
		with art do readln(carga, stock, descripcion);
		write(arch_logico, art);
	end;
    clrscr;
	writeln('-----Archivo Creado Exitosamente-----');
	close(arch_logico); 
end;
//__________________________________________________
procedure ListarStock(var arch_logico:archivo);
var
    art:articulo;
begin
    clrscr;
	writeln('-----Litas con Stock menor a 100-----');
    WriteLn();
    reset(arch_logico);
    while(not eof(arch_logico)) do begin
		read(arch_logico, art);
		if art.stock < 100 then 
        begin
            writeln('Nombre:', art.nombre);
            writeln('Descripcion:', art.descripcion);
            writeln('Precio:', art.precio:2:2);
            writeln('Stock:', art.stock);
            WriteLn('_________');
        end;
	end;
	close(arch_logico);
end;
//__________________________________________________
procedure ListaUsuario(var arch_logico:archivo);
var
    ingresado:cadena20;
    art:articulo;
begin
    clrscr;
	writeln('-----Lista de Usuario-----');
    Write('Nombre del articulo: '); 
    ReadLn(ingresado);      //Este readln no entiendo porque se lo salta
    ReadLn(ingresado);
    ingresado:=Concat(' ',ingresado);   
    WriteLn();
    {
    Lo de arriba lo hago para que me tome el nombre de la descripcion sin necesidad de poner un espacio al principio.
    Ya que si pongo los datos juntos, pascal no los separa a no ser de que pongas un espacio.
    Y en este caso, el espacio lo toma tanto en la descripcion como en el nombre
    }
    Reset(arch_logico);
    while (not eof(arch_logico)) do
    begin
        Read(arch_logico,art);
        if(art.nombre = ingresado)then
        begin
            writeln('Nombre:', art.nombre);
            writeln('Descripcion:', art.descripcion);
            writeln('Precio:', art.precio:2:2);
            writeln('Stock:', art.stock);
            WriteLn('_________');
        end;
    end;
    close(arch_logico);
end;
//__________________________________________________
procedure ExportarArchivo(var arch_logico:archivo);
var
    carga:text;
    art:articulo;
begin

    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\zapatos.txt');
    Reset(arch_logico);
    Rewrite(carga);
    while (not eof(arch_logico)) do
    begin
        read(arch_logico,art);
        with art do
        begin
            writeln(carga,'  |  ',nombre,'  |  ',descripcion,'  |  ',stock,'  |  ',precio:2:2);
        end;
    end;
    Close(arch_logico);close(carga);
    clrscr;
	writeln('-----Archivo Exportado Exitosamente-----');
end;
//__________________________________________________
procedure LeerArticulo(var art:articulo);
begin
    writeln('Nombre:');     ReadLn(art.nombre);
    writeln('Descripcion:');ReadLn(art.descripcion);
    writeln('Precio:');ReadLn(art.precio);
    writeln('Stock:');ReadLn(art.stock);
end;
//__________________________________________________
procedure Agregar(var arch_logico:archivo);
var
    x:articulo;
begin
    reset(arch_logico);
    while (not eof(arch_logico)) do read(arch_logico,x);
    LeerArticulo(x);
    write(arch_logico, x);
    close(arch_logico);
end;
//__________________________________________________
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
//__________________________________________________
procedure Actualizar(var arch_logico:archivo);
var
    nomArticulo:cadena20;
    stockRemplazo:integer;
    actual:articulo;
    Encontro:Boolean;
begin
    clrscr;
	writeln('-----MODIFICAR STOCK DE ARTICULOS-----');
    reset(arch_logico);
    WriteLn('Ingrese un nombre: ');
    ReadLn(nomArticulo);
    ReadLn(nomArticulo);
    nomArticulo:=Concat(' ',nomArticulo); 
    Encontro:=false;
    while(not eof(arch_logico))and(not Encontro) do 
    begin
        read(arch_logico, actual);
        if(actual.nombre = nomArticulo) then Encontro:=true;
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
//__________________________________________________
procedure ExportarArchivo2(var arch_logico:archivo);
var
    carga:text;
    art:articulo;
begin
    assign(carga, 'C:\Users\fabian\Desktop\FOD\Practicas\Practica 1\ArchivosGenerados\SinStock.txt');
    reset(arch_logico);
	rewrite(carga);
	while(not eof(arch_logico)) do 
    begin
		read(arch_logico,art); 
		if(art.stock = 0) then 
        begin
            with art do
				writeln(carga,' ',nombre,' ',descripcion,' ', stock,' ',precio:2:2);
        end;
	end;
	close(arch_logico); close(carga);
    clrscr;
	writeln('-----Archivo Exportado Exitosamente-----');
end;
//__________________________________________________
var
	arch_logico: archivo;
    arch_fisico:cadena20;
	opcion: integer;
begin
    clrscr;
    opcion:=0;
    
	while(opcion <> 9)do 
    begin
        writeln('------MENU------ ');
        writeln('1| Crear archivo');
        writeln('2| Listar Objetos');
        WriteLn('3| Lista de Usuario');
        WriteLn('4| Exportar Archivo "zapateria.txt"');
        WriteLn('5| Agregar un Archivo');
        WriteLn('6| Modificar el stock de un articulo');
        WriteLn('7| Exportar Archivo "SinStock.txt"');
        WriteLn('8| Limpiar consola');
        writeln('9| Cerrar Archivo');
        writeln('------MENU------ ');
        WriteLn();
        write('Opcion: ');read(opcion);
        case opcion of
            1: crearArchivo(arch_logico,arch_fisico);
            2: ListarStock(arch_logico);
            3: ListaUsuario(arch_logico);
            4: ExportarArchivo(arch_logico);
            5: AgregarArchivo(arch_logico);
            6: Actualizar(arch_logico);
            7: ExportarArchivo2(arch_logico);
            8: clrscr;
            9: WriteLn('Archivo Cerrado');
            else
                WriteLn('Numero invalido');
        end;
        WriteLn();
	end;
end.
{Tenemos un limite a la hora de exportar caracteres, yo quiero exportar estos datos

1.1 nombre1
1 descripcion1
2.2 nombre2
2 descripcion2
3.3 nombre3
3 descripcion3                        
4.4 nombre4
4 descripcion4
100.1 nombre100
100 descripcion100
5.5 nombre5
5 descripcion5

pero exporta esto
  |   nombre1  |   descripcion1  |  1  |  1.10
  |   nombre2  |   descripcion2  |  2  |  2.20
  |   nombre3  |   descripcion3  |  3  |  3.30
  |   nombre4  |   descripcion4  |  4  |  4.40
  |   nombre100  |   descripcion100  |  100  |  100.10
  |   no

  Ya esta, me falto el close en cargar :D
}