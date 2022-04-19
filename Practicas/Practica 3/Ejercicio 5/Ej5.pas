program Ej5;
const
    valorAlto = 'ZZZZ';
type
    tTitulo = String[50];
    tArchRevistas = file of tTitulo ;
//__________________________________________
procedure CrearConTexto(var m:tArchRevistas);
var
	carga: text;
	a: tTitulo;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
	    readln(carga, a);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//__________________________________________
procedure Leer(var archivo:tArchRevistas; var dato:tTitulo);
begin
    if(not EOF(archivo)) then
        read(archivo,dato)
    else
        dato:=valoralto;
end;
//__________________________________________
procedure agregar(var t:tArchRevistas; titulo:tTitulo);
var
    nro:integer;
    nroString,aux:tTitulo;
begin
    Reset(t);
    Leer(t,nroString);
    Val(nroString,nro); //Leo la cabecera y lo convierto a entero
    if (nro <> 0) then
    begin
        Seek(t,nro); Read(t,aux);              //Me posiciono en la cabecera y me quedo con lo que tenia
        Seek(t,FilePos(t)-1); Write(t,titulo); //Agrego el dato en el lugar que tenia una baja 
        Seek(t,0);   Write(t,aux);             //Guardo el dato en aux
    end
    else
        begin
            Seek(t,FilePos(t)); Write(t,aux); //Agrego al final del todo
        end;
    Close(t);
end;
//__________________________________________
procedure listado(var m:tArchRevistas);
var
	t:tTitulo;
    tInt:Integer;
begin
	assign(m,'maestro.data');
	reset(m);
	leer(m,t);
    WriteLn('Los titulos que no se borraron');
	while (t <> valoralto) do begin
        Val(t,tInt);
        if (tInt <> 0) then
            WriteLn(tInt);
        leer(m,t);
	end;
	close(m);
end;
//__________________________________________
procedure eliminar(var t:tArchRevistas; titulo:tTitulo);
var
    dato,cabecera,posString:tTitulo;
    pos:integer;
begin
    Assign(t,'maestro.data');
    Reset(t);
    Leer(t,cabecera); //Guardo la cabecera
    while (dato <> valorAlto) and (dato <> titulo) do Leer(t,dato);

    if (dato = titulo) then
    begin
        pos:=(FilePos(t)-1);        //Guardo la posicion del archivo a eliminar
        Seek(t,pos); Write(t,cabecera); //Remplazo el dato
        
        Str(pos,posString);
        Seek(t,0); Write(t,posString);//Pongo en la cabecera el archivo que elimine
    end
    else
        WriteLn('El titulo no se encontro');    
    Close(t);
end;
//__________________________________________
var
    titulo:tTitulo;
    t:tArchRevistas;
begin
    titulo:='Hola';
    CrearConTexto(t);
    agregar(t,titulo);
    listado(t);
    eliminar(t,titulo);
end.