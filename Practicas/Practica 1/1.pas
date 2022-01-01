program FabianMartinezPrograma1;

uses crt;
type 

archivoNumeros= file of integer;

var 
	fileName:string;
	archivo:archivoNumeros;
	numero:integer;
BEGIN
	clrscr;
	write('Ingrese nombre de archivo:' ); 
	readln(fileName);
	assign(archivo,fileName);
	rewrite (archivo); // se crea el archivo
	write (' Ingrese un numero : ');
	readln(numero);
	while numero <> 0 do begin
		write(archivo,numero);
		write (' Ingrese un numero : ');
		readln(numero);
	end;
	close (archivo);
END.
