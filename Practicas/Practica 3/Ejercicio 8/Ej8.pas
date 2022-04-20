{8. Se cuenta con un archivo con información de las diferentes distribuciones de linux
existentes. De cada distribución se conoce: nombre, año de lanzamiento, número de
versión del kernel, cantidad de desarrolladores y descripción. El nombre de las
distribuciones no puede repetirse.
Este archivo debe ser mantenido realizando bajas lógicas y utilizando la técnica de
reutilización de espacio libre llamada lista invertida.
Escriba la definición de las estructuras de datos necesarias y los siguientes
procedimientos:
ExisteDistribucion: módulo que recibe por parámetro un nombre y devuelve verdadero si
la distribución existe en el archivo o falso en caso contrario.
AltaDistribución: módulo que lee por teclado los datos de una nueva distribución y la
agrega al archivo reutilizando espacio disponible en caso de que exista. (El control de
unicidad lo debe realizar utilizando el módulo anterior). En caso de que la distribución que
se quiere agregar ya exista se debe informar “ya existe la distribución”.
BajaDistribución: módulo que da de baja lógicamente una distribución  cuyo nombre se
lee por teclado. Para marcar una distribución como borrada se debe utilizar el campo
cantidad de desarrolladores para mantener actualizada la lista invertida. Para verificar
que la distribución a borrar exista debe utilizar el módulo ExisteDistribucion. En caso de no
existir se debe informar “Distribución no existente”.}
program Ej8;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    distribucion = record
        nombre:cadena20;
        anio:integer;
        numero:Integer;
        cantidad:integer;
        descripcion:cadena20;
    end;
    maestro = file of distribucion;
//___________________________________________________
procedure importarMaestro(var archx:maestro);
var
	carga: text;
	datox: distribucion;
begin
	assign(archx,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(archx); reset(carga);
	while(not eof(carga))do begin
	    with datox do readln(carga, anio, numero, nombre);
        with datox do readln(carga, cantidad, descripcion);
	    write(archx,datox);
	end;
	close(archx); close(carga);
end;
//___________________________________________________
function ExisteDistribucion(var m:maestro;nom:cadena20):Boolean;
var
    existe:Boolean;
    dato:distribucion;
begin
    existe:=False;
    Assign(m, 'maestro.data');
    Reset(m);  
    Read(m,dato);
    while (not eof(m)) and (existe = False) do
    begin
        if (dato.nombre = nom) then
        begin
            existe:=True;
        end;
        Read(m,dato);
    end;
    Close(m);
    ExisteDistribucion:=existe;
end;
//___________________________________________________
procedure LeerDistribucion(var d:distribucion);
begin
    WriteLn('Nombre: '); ReadLn(d.nombre);
    WriteLn('Anio: '); ReadLn(d.anio);
    WriteLn('Numero: '); ReadLn(d.numero);
    WriteLn('Cantidad: '); ReadLn(d.cantidad);
    WriteLn('Descripcion: '); ReadLn(d.descripcion);
end;
//___________________________________________________
procedure leer (var archivo:maestro; var dato:distribucion);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.cantidad := valoralto;
end;
//___________________________________________________
procedure Alta(var m:maestro;d:distribucion);
var
    cabecera:distribucion;
begin
    Seek(m,0); //Es lo mismo que hacer Reset(m)
    leer(m,cabecera);
    if (cabecera.cantidad = 0) then
    begin 
        Seek(m,FileSize(m));
        Write(m,d);
    end
    else 
        begin
            Seek(m,(cabecera.cantidad*(-1))); //Saco el valor absoluto(tambien se puede hacer con abs)
            read(m,cabecera);
            Seek(m,FilePos(m)-1);
            Write(m,d);
            Seek(m,0);
            Write(m,cabecera);
        end;
    //Close(m); No lo hago ya que lo cierro en el programa principal
end;
//___________________________________________________
procedure AltaDistribucion(var m:maestro; d:distribucion);
begin
    Assign(m,'maestro.data');
    Reset(m);
    if (not(ExisteDistribucion(m,d.nombre)) and (not eof(m))) then
    begin
        Alta(m,d);
    end
    else
        WriteLn('La distribucion Existe');
    Close(m);
end;
//___________________________________________________
procedure Baja(var arch:maestro;nom:cadena20);
var 
    datox,actual:distribucion;
    pos:integer; //Pos de la cabecera
begin
    seek(arch,0);//reset(arch);
    read(arch,actual);
    Read(arch,datox);
    while (datox.nombre <> nom) do	    //busco hasta encontrar el dato
		Read(arch,datox);
    if datox.nombre = nom then begin //si lo encuentro guardo la posicion
        datox:=actual;
        pos:=filepos(arch)-1;        //guardo la posicion de la baja
        seek(arch,pos); 
        write(arch,datox);           //sobreescribo la baja con los datos de cabecera
        actual.cantidad:=-pos;

        seek(arch,0); //me paro en el principio de la lista
        write(arch,actual);
    end
    else 
        writeln('No se encuentra el codigo.');
    //close(arch);
end;
//___________________________________________________
procedure BajaDistribucion(var m:maestro; nom:cadena20);
begin
    Assign(m,'maestro.data');
    Reset(m);
    if not(ExisteDistribucion(m,nom)) then
    begin
        Baja(m,nom);
    end
    else
        WriteLn('La distribución Existe');
    Close(m);
end;
//___________________________________________________
var
    m:maestro;
    nom:cadena20;
    d:distribucion;
begin
    nom:='Windows';
    importarMaestro(m);
    if ExisteDistribucion(m,nom) then
        WriteLn('La distribucion existe')
    else
        WriteLn('La distribucion no existe');
    LeerDistribucion(d);
    AltaDistribucion(m,d);
    BajaDistribucion(m,nom);
end.