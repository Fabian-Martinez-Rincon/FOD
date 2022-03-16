program cinco; //Fabian Martinez Rincon
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
	writeln('Nombre del archivo fisico: ');
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
	writeln('Archivo cargado.');
	close(arch_logico); 
end;
//__________________________________________________
procedure ListarStock(var arch_logico:archivo);
var
    art:articulo;
begin
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
    WriteLn('Ingrese una cadena'); ReadLn(ingresado);
    ingresado:=Concat(' ',ingresado);   
    {
    Lo de arriba lo hago para que me tome el nombre de la descripcion sin necesidad de poner un espacio al principio.
    Ya que si pongo los datos juntos, pascal no los separa a no ser de que pongas un espacio.
    Y en este caso, el espacio lo toma tanto en la descripcion como en el nombre
    }
    Reset(arch_logico);
    while (not eof(arch_logico)) do
    begin
        Read(arch_logico,art);
        if(art.descripcion = ingresado)then
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
end;
//__________________________________________________
var
	arch_logico: archivo;
    arch_fisico:cadena20;
	opcion: integer;
begin
    clrscr;
    opcion:=0;
    arch_fisico:='cinco';                        
	//assign(arch_logico, arch_fisico);
	while(opcion <> 5)do 
    begin
        writeln('Ingrese una opcion: ');
        writeln('1| Crear archivo');
        writeln('2| Listar Objetos');
        WriteLn('3| Lista de Usuario');
        WriteLn('4| Exportar Archivo');
        writeln('5| Cerrar Archivo');
        readln(opcion);
        case opcion of
            1: crearArchivo(arch_logico,arch_fisico);
            2: ListarStock(arch_logico);
            3: ListaUsuario(arch_logico);
            4: ExportarArchivo(arch_logico);
            5: WriteLn('Archivo Cerrado');
            else
                WriteLn('Numero invalido');
        end;
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