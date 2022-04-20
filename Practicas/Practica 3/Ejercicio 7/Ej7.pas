{7. Se cuenta con un archivo que almacena información sobre especies de ave en
vía de extinción, para ello se almacena: código, nombre de la especie, familia de ave,
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice
un programa que elimine especies de ave, para ello se recibe por teclado las especies a
eliminar. Deberá realizar todas las declaraciones necesarias, implementar todos los
procedimientos que requiera y una alternativa para borrar los registros. Para ello deberá
implementar dos procedimientos, uno que marque los registros a borrar y posteriormente
otro procedimiento que compacte el archivo, quitando los registros marcados. Para
quitar los registros se deberá copiar el último registro del archivo en la posición del registro
a borrar y luego eliminar del archivo el último registro de forma tal de evitar registros
duplicados.
Nota: Las bajas deben finalizar al recibir el código 500000}
program Ej7;
const
    valorAlto = 9999;
type    
    cadena20 = string[20];
    ave = record
        codigo:integer;
        nombre:cadena20;
        familia:cadena20;
        descripcion:cadena20;
        zona:cadena20;
    end;
    maestro = file of ave;
//_________________________________________
procedure Leer (var archivo:maestro; var dato:ave);
begin
    if (not EOF(archivo)) then
        read(archivo,dato) //en dato=el dato apuntado en archivoDeta
    else
        dato.codigo:=valoralto; //para cortar el while 
end;
//_________________________________________
procedure BajaLogica(var m:maestro);
var
    datoM:ave;
    codigoAve:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);       
    WriteLn('El codigo del ave que quiere eliminar: ');
    ReadLn(codigoAve);
    while codigoAve <> 500 do
    begin
        Leer(m,datoM); //Leo lo que tengo en la cabecera
        while datoM.codigo <> valorAlto do 
        begin
            if (datoM.codigo = codigoAve) then
            begin
                datoM.codigo:=-1;
                Seek(m,FilePos(m)-1); Write(m,datoM);
            end;
            Leer(m,datoM);
        end;
        WriteLn('El codigo del ave que quiere eliminar: ');
        ReadLn(codigoAve);
        Seek(m,0);
    end;
    Close(m); 
end;
{procedure marcar(var arch:archivo); //Esto es para preguntar, no le des mucha bola
var
	reg: viaExtincion;
	cod: integer;
begin
	reset(arch);
	cod:=0;
	leer(arch,reg);
	while (reg.cod <> valoralto) and (cod <> valoralto) do begin
		writeln('Ingrese el codigo de especie a eliminar: ');
		read(cod);
		if(cod <> valoralto)and(reg.cod <> valoralto)then begin
			while(cod <> reg.cod)and(valoralto <> reg.cod) do leer(arch,reg);
			if cod = reg.cod then begin
				reg.cod := -1;
				seek(arch,filepos(arch)-1);
				writeln(reg.cod);
				write(arch,reg);
			end;
		end;
		reset(arch);
	end;
	close(arch);
end;}
//_________________________________________
procedure BuscarUltimo(var m:maestro;var ultimo:ave; var posUlt:Integer);
begin
    Seek(m,posUlt); //Nos vamos moviendo para atras
    Read(m,ultimo);
    while ultimo.codigo = -1 do //Busco el ultimo registro no borrado
    begin
        Seek(m,posUlt-1);   //Voy al anterior
        posUlt:=FilePos(m); //Guardo el anterior
        Read(m,ultimo);     //Continuo leyendo normal
    end;
end;
//_________________________________________
procedure BajaFisica(var m:maestro);
var
    datox,ultimo:ave;
    pos,posUlt:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);
    Leer(m,datox);
    //Me quedo con la ultima posicion en la que tengo un registro
    //ya que es mas facil manejar el corte del archivo
    posUlt:=FilePos(m)-1; 
    while (datox.codigo <> valorAlto) and (FilePos(m) <= posUlt) do
    begin
        pos:=FilePos(m);
        if (datox.codigo = -1) then
        begin
            BuscarUltimo(m,ultimo,posUlt);
            posUlt:=posUlt-1;               //Decremento mi posUlt ya que encontre el eliminado
            Seek(m,pos-1); Write(m,ultimo); //remplazo el dato
        end;
        Leer(m,datox);
    end;
    Seek(m,posUlt+1); //Voy a la ultima posicion que seria EOF ya que antes esta en la anteultima
    //Para trabajar con solo los registros
    //Trunca un fichero en la posición actual. Dicha posición actual se convierte en el fin de fichero (EOF).
    Truncate(m);
    Close(m);
end;
//_________________________________________
var
    m:maestro;
begin
    BajaLogica(m);
    BajaFisica(m);
end.