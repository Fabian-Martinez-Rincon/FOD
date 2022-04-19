{6. Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado
con la información correspondiente a las prendas que se encuentran a la venta. De
cada prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y
precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las prendas
a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las prendas que
quedarán obsoletas. Deberá implementar un procedimiento que reciba ambos archivos
y realice la baja lógica de las prendas, para ello deberá modificar el stock de la prenda
correspondiente a valor negativo.
Por último, una vez finalizadas las bajas lógicas, deberá efectivizar las mismas
compactando el archivo. Para ello se deberá utilizar una estructura auxiliar, renombrando
el archivo original al finalizar el proceso.. Solo deben quedar en el archivo las prendas
que no fueron borradas, una vez realizadas todas las bajas físicas.
}
program Ej6;
const
    valorAlto = 9999;
type
    cadena20 = string[20];
    prenda = record
        cod_prenda:integer;
        descripcion:cadena20;
        colores:cadena20;
        tipo_prenda:cadena20;
        stock:integer;
        precio:real;
    end;
    maestro = file of prenda;
    detalle = file of integer; //Archivo con los codigos de prendas
//____________________________________________
procedure ImportarMaestro(var m:maestro);
var
	carga: text;
	a: prenda;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); Reset(carga);
	while(not eof(carga))do begin
	    with a do readln(carga, cod_prenda,descripcion,colores,tipo_prenda,stock,precio);
	    write(m,a);
	end;
	close(m); close(carga);
end;
//____________________________________________
procedure ImportarDetalle(var d:detalle);
var
	carga: text;
	a: Integer;
begin
	assign(d,'detalle.data');
	assign(carga,'detalle.txt');
	rewrite(d); Reset(carga);
	while(not eof(carga))do begin
        readln(carga, a);
	    write(d,a);
	end;
	close(d); close(carga);
end;
//____________________________________________
procedure LeerD(var arch:detalle; var dato:integer);
begin
	if(not eof(arch))then 
        read(arch,dato)
	else 
        dato:=valoralto;
end;
procedure LeerM(var arch:maestro; var dato:prenda);
begin
	if(not eof(arch))then 
        read(arch,dato)
	else 
        dato.cod_prenda:=valoralto;
end;
//____________________________________________
procedure bajaLogica(var m:maestro;var d:detalle);
var
    datoM:prenda;
    datoD:Integer;
begin
    Reset(m);       Reset(d);
    LeerD(d,datoD);  
    while datoD <> valorAlto do
    begin
        Seek(m,0); LeerM(m,datoM); //Leo lo que tengo en la cabecera
        while datoM.cod_prenda <> valorAlto do 
        begin
            if (datoM.cod_prenda = datoD) then
            begin
                datoM.stock:=-1;
                Seek(m,FilePos(m)-1); Write(m,datoM);
            end;
            LeerM(m,datoM);
        end;
        LeerD(d,datoD); 
    end;
    Close(m); Close(d);
end;
//____________________________________________
procedure bajaFisica(var m,mAux:maestro);
var
    datoM:prenda;
begin
    Reset(m); Rewrite(mAux);
    LeerM(m,datoM);
    while datoM.cod_prenda <> valorAlto do
    begin
        if (datoM.cod_prenda = -1) then
            Write(mAux,datoM);
        LeerM(m,datoM);
    end;
    Close(m); Close(mAux);
    Erase(m); //Elimino el archivo maestro
    Rename(mAux,'maestro');
end;
//____________________________________________
var
    m,mAux:maestro;
    d:detalle;
begin
    Assign(mAux,'maestrox.data');
    ImportarMaestro(m);
    ImportarDetalle(d);
    bajaLogica(m,d);
    bajaFisica(m,mAux);
end.