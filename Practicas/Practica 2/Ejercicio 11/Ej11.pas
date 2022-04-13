{11. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle.
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia}
program Ej11;
type
    cadena20 = string[20];
    maestroR = record
        nombre:cadena20;
        cantidadA:integer;
        cantidadE:integer; //Cantidad de Encuestados
    end;
    detalleR = record
        nombre:cadena20;
        codigo:integer;
        cantidadA:integer;
        cantidadE:integer;
    end;
    maestro = file of maestroR;
    detalle = file of detalleR;
//__________________________________________
procedure importarDetalles(var d1,d2:detalle);
var
    carga1,carga2:text;
    dato1,dato2:detalleR;
begin
    //Detalle 1
    Assign(d1,'detalle1.data'); Assign(carga1,'detalle1.txt');
    Rewrite(d1);
    Reset(carga1); 
    while (not (Eof(carga1))) do
    begin
        with dato1 do readln(carga1, nombre, codigo, cantidadA, cantidadE);
        Write(d1,dato1);
    end;
    Close(d1);
    Close(carga1);

    //Detalle 2
    Assign(d2,'detalle2.data'); Assign(carga2,'detalle2.txt');
    Rewrite(d2);
    Reset(carga2);
    while (not (Eof(carga2))) do
    begin
        with dato2 do readln(carga2, nombre, codigo, cantidadA, cantidadE);
        Write(d2,dato2);
    end;
    Close(d2);
    Close(carga2);
end;
//__________________________________________
procedure importarMaestro(var m:tipoArchivo);
var
    carga:text;
    dato:empleado;
begin
    Assign(m,'maestro.data');
    Assign(carga,'maestro.txt');
    Rewrite(m);
    Reset(carga);
    while (not (Eof(carga))) do
    begin
        with dato do readln(carga, departamento, division, nro, categoria, horas_extras);
        Write(m,dato);
    end;
    Close(m);
    Close(carga);
end;
//__________________________________________
var
    m:maestroR;
    d1,d2:detalle;
begin
    importarDetalles(d1,d2);
    importarMaestro(m);
end.