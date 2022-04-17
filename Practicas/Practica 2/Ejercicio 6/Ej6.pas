{Se cuenta con un archivo maestro con los artículos de una cadena de venta de
indumentaria. De cada artículo se almacena: código del artículo, nombre, descripción,talle,
color, stock disponible, stock mínimo y precio del artículo.
Se recibe diariamente un archivo detalle de cada una de las 15 sucursales de la cadena. Se
debe realizar el procedimiento que recibe los 15 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: código de artículo y cantidad
vendida. Además, se deberá informar en un archivo de texto: nombre de artículo,
descripción, stock disponible y precio de aquellos artículo que tengan stock disponible por
debajo del stock mínimo.
Nota: todos los archivos se encuentran ordenados por código de artículo. En cada detalle
puede venir 0 o N registros de un determinado artículo.}
program Ej6;
const
    dimF = 15;
    valoralto = 9999;
type
    cadena20 = string[20];
    articulo = record
        codigo:integer;
        nombre:cadena20;
        descripcion:cadena20;
        talle:integer;
        color:cadena20;
        stockD:integer;
        stockM:integer;
        precio:real;
    end;
    regDetalle = record
        codigo:integer;
        cantidad:integer;
    end;
    maestro = file of articulo;
    detalle = file of regDetalle;
    vecDetalle = array [1..dimF] of detalle;
    vecDetalleR = array [1..dimF] of regDetalle;
//__________________________________________________________________________
procedure Leer(var archivoDeta:detalle; var datoD:regDetalle);
begin
    if(not EOF(archivoDeta)) then
        read(archivoDeta,datoD)
    else
        datoD.codigo:=valoralto;
end;
//__________________________________________________________________________
procedure importarMaestro(var mae: maestro);
var
	carga: text;
	a: articulo;
begin
	assign(mae,'maestro.data');
	assign(carga,'Articulos.txt');
	rewrite(mae); reset(carga);
	while(not eof(carga))do begin
		with a do readln(carga, codigo, talle, nombre);
		with a do readln(carga, stockD, stockM, color);
		with a do readln(carga, precio, descripcion);
		write(mae,a);
	end;
	close(mae); close(carga);
end;
//__________________________________________________________________________
procedure minimo(var v:vecDetalle; var vr:vecDetalleR; var min:regDetalle);
var
    i,minPos:integer;
begin
    min.codigo:=9999;
    for i:=1 to dimF do begin
        if (vr[i].codigo < min.codigo) then begin
            min:=vr[i];
            minPos:=i;
        end;
    end;
    if (min.codigo <> valoralto) then
        Leer(v[minPos],vr[minPos]);
end;
//__________________________________________________________________________
procedure actualizarMaestro(var v:vecDetalle; var vr:vecDetalleR; var mae:maestro);
var
    regM:articulo;
    i:integer;
    min:regDetalle;
begin
	reset(mae);
    minimo(v,vr,min);//busco el codigo minimo entre los archivos detalles
    while (min.codigo <> valoralto) do begin //mientras el archivo detalle no termine
        read(mae,regM);
        while(regM.codigo <> min.codigo) do
            read(mae,regM);
        while(regM.codigo = min.codigo) do begin
            regM.stockD:=regM.stockD-min.cantidad;
            minimo(v,vr,min);
        end;
        seek(mae,filepos(mae)-1);
        write(mae,regM);
    end;
    close(mae);
    for i:=1 to dimF do begin
        close(v[i]);
    end;
end;
//__________________________________________________________________________
procedure ExportarATxtMaestro(var m:maestro);
var
    texto:Text;
    r:articulo;
begin
    assign(m,'maestro.data');
    reset(m); //abro mi archivo binario
    assign(texto,'articulosStockDispMin.txt');
    rewrite(texto); //creo mi archivo de texto
    while(not EOF(m)) do begin
        read(m,r);
        if r.stockD < r.stockM then 
			with r do begin
				writeln(texto,' ',nombre,' ',descripcion,' ',stockD,' ',precio);
			end;
    end;
    close(texto);
    close(m);
end;
//__________________________________________________________________________
var
    i:integer;
    iString:cadena20;
    vd:vecDetalle;
    vdr:vecDetalleR;
    m:maestro;
begin
    for i:=1 to dimF do 
    begin
        Str(i,iString);
        assign(vd[i],'detalle'+iString);
        Reset(vd[i]); 
        Leer(vd[i],vdr[i]);
    end;
    importarMaestro(m);
    actualizarMaestro(vd,vdr,m);
    ExportarATxtMaestro(m);
end.