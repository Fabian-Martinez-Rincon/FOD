program reglongvariable;
const
 separador_campo:char='@';
 separador_registro:char='#';
var
  archivo:file;
  buffer,campo:string;
  opcion:char;


procedure mostrar_datos();
var
 car:char;
long:byte;
campo:string;
begin
car:='i';
 while (not eof(archivo))do
 begin
	writeln('REGISTRO...........................');
	while(car<>separador_registro)and(not eof(archivo))do
	begin
		campo:=' ';
		blockread(archivo,car,1);
		while(car<>separador_campo)and(car<>separador_registro)and(not eof(archivo))do
		begin
			campo:=campo+car;
			blockread(archivo,car,1);
		end;
		
		if (car=separador_registro) and (not eof(archivo)) then //hago una lectura de mas para leer el separador
		begin
			writeln('REGISTRO...........................');			
			blockread(archivo,car,1);
			seek(archivo,filepos(archivo)-1);//esto lo hago para no perder un caracter
		end
		else
		begin		
			writeln(campo);
			readln;
		end;
	end;
 end;
end;


procedure escribir_archivo(nombre,descripcion:string;stock:integer);
var
  stock_convertido:string;
begin
  str(stock,stock_convertido);
  nombre:=nombre+separador_campo;//CONCATENO A LA VARIABLE LEIDA EL DELIMITADOR DE CAMPO
  blockwrite(archivo,nombre[1],length(nombre));//GRABO A PARTIR DEL PRIMER CARACTER LEIDO, DESCARTO LA POSICION 0 QUE CONTIENE LA LONGITUD DEL STRING
  descripcion:=descripcion + separador_campo;//CONCATENO A LA VARIABLE LEIDA EL DELIMITADOR DE CAMPO
  blockwrite(archivo,descripcion[1],length(descripcion));//GRABO A PARTIR DEL PRIMER CARACTER LEIDO, DESCARTO LA POSICION 0 QUE CONTIENE LA LONGITUD DEL STRING
  stock_convertido:=stock_convertido+separador_campo;//CONCATENO A LA VARIABLE LEIDA EL DELIMITADOR DE CAMPO
  blockwrite(archivo,stock_convertido[1],length(stock_convertido));//GRABO A PARTIR DEL PRIMER CARACTER LEIDO, DESCARTO LA POSICION 0 QUE CONTIENE LA LONGITUD DEL STRING
  blockwrite(archivo,separador_registro,1);//ESCRIBO EL FIN DE REGISTRO
end;

procedure carga();
var
nombre,descripcion:string;
stock:integer;
begin
  writeln('ingrese en nombre de medicamento - fin nombre nulo');
  readln(nombre);
  while(nombre <> ' ' )do
  begin
  	writeln('ingrese la descripcion');
  	readln(descripcion);
  	writeln('ingrese el stock');
  	readln(stock);
	escribir_archivo(nombre,descripcion,stock);
	writeln('ingrese otro nombre de medicamento - fin nombre nulo');
        readln(nombre);
  end;
end;

procedure menu(var opcion: char);
begin
 writeln('a: Cargar datos');
 writeln('b: Listar datos');
 writeln('q: Salir');
 write('Escriba un comando: ');
 readln(opcion);
end;


begin

  menu(opcion);
  assign(archivo,'Escritorio/registro_variable/archivo.dat');//OJO CON LOS PATH
  while (opcion <> 'q') do
  begin
  if (opcion = 'a') then
  begin
   rewrite(archivo, 1);
   carga;
   close(archivo);
  end else if (opcion = 'b') then
  begin
     reset(archivo, 1);
     mostrar_datos;
     close(archivo);
  end;
  menu(opcion);
 end;
end.
