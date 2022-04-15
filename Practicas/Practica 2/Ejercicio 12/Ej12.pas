{12. La empresa de software ‘X’ posee un servidor web donde se encuentra alojado el sitio de la
organización. En dicho servidor, se almacenan en un archivo todos los accesos que se realizan
al sitio.
La información que se almacena en el archivo es la siguiente: año, mes, dia, idUsuario y tiempo
de acceso al sitio de la organización. El archivo se encuentra ordenado por los siguientes
criterios: año, mes, dia e idUsuario.
Se debe realizar un procedimiento que genere un informe en pantalla, para ello se indicará el
año calendario sobre el cual debe realizar el informe. El mismo debe respetar el formato
mostrado a continuación:
Año : ---
Mes:-- 1
día:-- 1
idUsuario 1 Tiempo Total de acceso en el dia 1 mes 1
--------
idusuario N Tiempo total de acceso en el dia 1 mes 1
Tiempo total acceso dia 1 mes 1
-------------
día N
idUsuario 1 Tiempo Total de acceso en el dia N mes 1
--------
idusuario N Tiempo total de acceso en el dia N mes 1
Tiempo total acceso dia N mes 1
Total tiempo de acceso mes 1
------
Mes 12
día 1
idUsuario 1 Tiempo Total de acceso en el dia 1 mes 12
--------
idusuario N Tiempo total de acceso en el dia 1 mes 12
Tiempo total acceso dia 1 mes 12
-------------
día N
idUsuario 1 Tiempo Total de acceso en el dia N mes 12
--------
idusuario N Tiempo total de acceso en el dia N mes 12
Tiempo total acceso dia N mes 12
Total tiempo de acceso mes 12
Total tiempo de acceso año
Se deberá tener en cuenta las siguientes aclaraciones:
- El año sobre el cual realizará el informe de accesos debe leerse desde teclado.
- El año puede no existir en el archivo, en tal caso, debe informarse en pantalla “año no
encontrado”.
- Debe definir las estructuras de datos necesarias.
- El recorrido del archivo debe realizarse una única vez procesando sólo la información
necesaria.}
program Ej12;
const 
    valorAlto = 9999;
type
    anios = 1900..2022;
    meses = 1..12;
    dias = 1..31;
    archivoR = record
        anio:integer;
        mes:meses;
        dia:dias;
        id:integer;
        tiempo:integer;
    end;
    archivo = file of archivoR;
//_______________________________________________________
procedure importarArchivo(var m:archivo);
var
	carga: text;
	a: archivoR;
begin
	assign(m,'maestro.data');
	assign(carga,'maestro.txt');
	rewrite(m); Reset(carga);
	while(not eof(carga))do begin
		with a do readln(carga, anio, mes, dia,id,tiempo);
		write(m,a);
	end;
	close(m); close(carga);
end;
//_______________________________________________________
procedure leer(var m:archivo; var aux:archivoR);
begin
    if(not eof(m))then 
		read(m,aux)
    else 
		aux.anio:=valorAlto;
end;
//__________________________________________
procedure ListadoEsta(var m:archivo;anio:integer;var x,actual:archivoR);
var
        totalD,totalM,totalA:Integer;
begin
    totalA:=0;
    WriteLn('Anio: ' ,anio);
    while (x.anio <> valoralto) and (anio = x.anio) do begin
        actual:= x;
        totalM:=0;
        WriteLn('Mes ', x.mes);
        while (actual.mes = actual.mes) and (actual.anio = x.anio)do 
        begin
            totalD:=0;
            WriteLn('Dia ',x.dia);
            while (x.dia = actual.dia) and (x.mes = actual.mes) do
            begin
                totalD:=totalD+x.tiempo;
                leer(m,x);
            end;
            WriteLn(x.id, ' Tiempo Total de acceso al dia ', x.dia , ' mes ', x.mes);
            WriteLn(totalD);
            totalM:=totalM+totalD;
        end;

        WriteLn('El total del mes ',x.mes,' es ', totalM);    
        totalA:=totalA + totalM;
    end;
    WriteLn('El total del anio ',anio,' es ', totalA);
end;
//__________________________________________
procedure Listado(var m:archivo; anio:integer);
var
	x,actual:archivoR;
begin
	assign(m,'maestro.data');
	reset(m);
    if not eof(m) then
    begin
        leer(m,x);
        while (x.anio <> anio) and (not Eof(m)) do
            Read(m,x);
        if (x.anio = anio) then
        begin
            ListadoEsta(m,anio,x,actual);
        end
        else
            WriteLn('No se encontro el anio');
    end;
	close(m);
end;
//_______________________________________________________
var
    arch:archivo;
    anio:integer;
begin
    importarArchivo(arch);
    WriteLn('Ingrese un anio'); ReadLn(anio);
    Listado(arch,anio);
end.