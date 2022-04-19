{3. Realizar un programa que genere un archivo de novelas filmadas durante el presente
año. De cada novela se registra: código, género, nombre, duración, director y precio.
El programa debe presentar un menú con las siguientes opciones:
a. Crear el archivo y cargarlo a partir de datos ingresados por teclado. Se
utiliza la técnica de lista invertida para recuperar espacio libre en el
archivo. Para ello, durante la creación del archivo, en el primer registro del
mismo se debe almacenar la cabecera de la lista. Es decir un registro
ficticio, inicializando con el valor cero (0) el campo correspondiente al 
código de novela, el cual indica que no hay espacio libre dentro del
archivo.
b. Abrir el archivo existente y permitir su mantenimiento teniendo en cuenta el
inciso a., se utiliza lista invertida para recuperación de espacio. En
particular, para el campo de ´enlace´ de la lista, se debe especificar los
números de registro referenciados con signo negativo, (utilice el código de
novela como enlace).Una vez abierto el archivo, brindar operaciones para:
i. Dar de alta una novela leyendo la información desde teclado. Para
esta operación, en caso de ser posible, deberá recuperarse el
espacio libre. Es decir, si en el campo correspondiente al código de
novela del registro cabecera hay un valor negativo, por ejemplo -5,
se debe leer el registro en la posición 5, copiarlo en la posición 0
(actualizar la lista de espacio libre) y grabar el nuevo registro en la
posición 5. Con el valor 0 (cero) en el registro cabecera se indica
que no hay espacio libre.
ii. Modificar los datos de una novela leyendo la información desde
teclado. El código de novela no puede ser modificado.
iii. Eliminar una novela cuyo código es ingresado por teclado. Por
ejemplo, si se da de baja un registro en la posición 8, en el campo
código de novela del registro cabecera deberá figurar -8, y en el
registro en la posición 8 debe copiarse el antiguo registro cabecera.
c. Listar en un archivo de texto todas las novelas, incluyendo las borradas, que
representan la lista de espacio libre. El archivo debe llamarse “novelas.txt”.
NOTA: Tanto en la creación como en la apertura el nombre del archivo debe ser
proporcionado por el usuario.
}
program Ej3;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    novela = record
        codigo:integer;
        genero:integer;
        nombre:cadena20;
        duracion:integer;
        director:cadena20;
        precio:Integer;
    end;
    maestro = file of novela;
//_________________________________________
procedure LeerNovela(var n:novela);
begin
    writeln('Codigo: ');ReadLn(n.codigo);
    if (n.codigo <> valorAlto) then
    begin
        writeln('Genero: ');ReadLn(n.genero);
        writeln('Nombre: ');ReadLn(n.nombre);
        writeln('Duración: ');ReadLn(n.duracion);
        writeln('Director: ');ReadLn(n.director);
        writeln('Precio: ');ReadLn(n.precio);
    end;
    
end;
//_________________________________________
procedure Crear(var m:maestro);
var
    nov:novela;
begin
    assign(m,'maestro.data');
    rewrite(m); 
    nov.codigo:=0;           //lista invertida
    write(m,nov);
    LeerNovela(nov);
    while (nov.codigo <> valorAlto) do 
    begin
        write(m,nov); 
        LeerNovela(nov);
    end;
    close(m);  
end;
//_________________________________________
procedure Leer (var archivo:maestro;var dato:novela);
begin
    if(not EOF(archivo)) then
        read(archivo,dato)
    else
        dato.codigo:=valoralto;
end;
//_________________________________________
procedure Alta(var m:maestro);
var
    cabecera,n:novela;
begin
    Reset(m);
    leer(m,cabecera);
    LeerNovela(n);
    if (cabecera.codigo = 0) then
    begin //Si tengo la cabecera vacia agrego el elemento al final
        Seek(m,FileSize(m));
        Write(m,n);
    end
    else 
        begin
            //Ej si el resultado es -5 voy a la posicion 5
            //(La cabecera siempre tiene que ser un nro negativo o 0)
            Seek(m,(cabecera.codigo*(-1)));
             //Una vez que me ubico, en el lugar libre, remplazo el elemento
            read(m,cabecera);
            Seek(m,FilePos(m)-1);
            Write(m,n);
            Seek(m,0);
            Write(m,cabecera);
            //Guardo el elemento que habia en la posicion 5
        end;
    Close(m);
end;
//_________________________________________
procedure modificar(var arch:maestro);
var
	n:novela;
	cod:integer;
begin
    writeln('Ingrese el codigo de la novela a modificar:');
    readln(cod);
    reset(arch);
    leer(arch,n);
    if(n.codigo <> valoralto)then begin
		while(n.codigo <> cod)do leer(arch,n);
		n.codigo:=cod;
		write('Genero de novela:'); readln(n.genero);
        write('Nombre de novela:'); readln(n.nombre);
        write('Duracion de novela:'); readln(n.duracion);
        write('Director de novela:'); readln(n.director);
        write('Precio de novela:'); readln(n.precio);
		seek(arch,filepos(arch)-1);
		write(arch,n);
    end;
    close(arch);
end;
//_________________________________________
procedure baja(var arch:maestro);
var 
    n,actual:novela;
    num,pos:integer;
begin
    reset(arch);
    read(arch,actual);
    writeln('Ingrese el codigo de la novela a eliminar:'); 
    readln(num);
    leer(arch,n);
    while (n.codigo <> num) do	    //busco hasta encontrar el numero
		leer(arch,n);
    if n.codigo = num then begin //si lo encuentro guardo la posicion
        pos:=filepos(arch)-1; //guardo la posicion de la baja
        n:=actual;
        seek(arch,pos); 
        write(arch,n); //sobreescribo la baja con los datos de cabecera
        actual.codigo:=-pos;

        seek(arch,0); //me paro en el principio de la lista
        write(arch,actual);
    end
    else 
        writeln('No se encuentra el codigo.');
    close(arch);
end;
//_________________________________________
procedure Menu(var m:maestro);
var
    opcion:integer;
begin
    opcion:=0;
    while opcion <= 3 do
    begin
        WriteLn('1| Dar de alta');
        WriteLn('2| Modificar');
        WriteLn('3| Baja');
        WriteLn('4| Cerrar programa');
        ReadLn(opcion);
        case opcion of
            1: Alta(m);
            2: Modificar(m);
            3: Baja(m);
        end;
    end;
  
end;
//_________________________________________
procedure exportarTxt(var x: maestro);
var
	carga:text;
	datox: novela;
begin
	assign(carga,'novelas.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,codigo,' ',nombre, ' ', genero);
	end;
	close(x); close(carga);
end;
//_________________________________________
var
    m:maestro;
begin
    Crear(m);
    Menu(m);
    exportarTxt(m);
end.