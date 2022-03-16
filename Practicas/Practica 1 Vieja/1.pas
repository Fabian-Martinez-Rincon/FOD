{Realizar un algoritmo que cree e incorpore datos, a un archivo de números enteros no ordenados. Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado por el usuario. La carga finaliza cuando se ingrese el número O (cero),que no debe incorporarse al archivo.}
program uno; //Fabian Martinez Rincon

uses crt;
type 
	archivoNumeros= file of integer;
	cadena20 = string[20];

var 
	fileName:cadena20;
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
