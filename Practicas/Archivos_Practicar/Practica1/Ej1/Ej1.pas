program Ej1;
const 
    valorAlto = 999;
type
    archivo = file of integer;
//__________________________________________
procedure Escribir(var maestro:archivo);
var
    nro:Integer;
begin
    Rewrite(maestro);
    Read(nro);
    while (nro <> 0) do
    begin
        write(maestro,nro);
        read(nro);
    end;
    Close(maestro);
end;
//__________________________________________
procedure Imprimir(var maestro:archivo);
var
    nro:Integer;
begin
    Reset(maestro);
    while not Eof(maestro) do
    begin    
        read(maestro, nro);
        write(nro);
    end;
    Close(maestro);
end;
Procedure Agregar(var log:archivo); 
var 
    nro: integer;
begin
    reset(log); 
    seek(log,filesize(log)); 
    read(nro); 
    while (nro <> 10) do 
    begin
        write(log,nro);     
        read(nro) 
    end;
    close(log);
end;
procedure CrearTXT(var archx: archivo);
var
	carga:text;
	datox: Integer;
begin
	assign(carga,'archivo.txt');
	rewrite(carga);
	reset(archx);
	while not eof(archx)do begin
		read(archx,datox);
        writeln(carga,datox);
	end;
	close(archx); close(carga);
end;
procedure leer(var archx:archivo; var aux:Integer);
begin
    if(not eof(archx))then 
		read(archx,aux)
    else 
		aux:=valorAlto;
end;
//__________________________________________
procedure imprimirOrd(var archx:archivo);
var
	datox,actual:Integer;
    total:Integer;
begin
	reset(archx);
	leer(archx,datox);
	while (datox <> valoralto) do begin
		actual:= datox;
        total:=0;
		while(actual = datox)do 
        begin
            total:=total+datox;
            leer(archx,datox);
		end;
        writeln('El total de ',actual,' es : ', total);
	end;
	close(archx);
end;

var
    maestro: archivo;
begin
    Assign(maestro, 'maestro.data');
    Escribir(maestro);
    //Imprimir(maestro);
    //CrearTXT(maestro);
    //Agregar(maestro);
    //ImprimirOrd(maestro);
end.