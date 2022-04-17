{14. Una compañía aérea dispone de un archivo maestro donde guarda información sobre sus
próximos vuelos. En dicho archivo se tiene almacenado el destino, fecha, hora de salida y la
cantidad de asientos disponibles. La empresa recibe todos los días dos archivos detalles para
actualizar el archivo maestro. En dichos archivos se tiene destino, fecha, hora de salida y
cantidad de asientos comprados. Se sabe que los archivos están ordenados por destino más
fecha y hora de salida, y que en los detalles pueden venir 0, 1 ó más registros por cada uno del
maestro. Se pide realizar los módulos necesarios para:
g. Actualizar el archivo maestro sabiendo que no se registró ninguna venta de pasaje
sin asiento disponible.
h. Generar una lista con aquellos vuelos (destino y fecha y hora de salida) que tengan
menos de una cantidad específica de asientos disponibles. La misma debe ser
ingresada por teclado.
NOTA: El archivo maestro y los archivos detalles sólo pueden recorrerse una vez}
program Ej14;
type
    cadena20 = string[20];
    maestroR = record
        destino:cadena20;
        fecha:integer;
        hora:integer;
        asientosD:Integer;
    end;
    detalleR = record
        destino:cadena20;
        fecha:Integer;
        hora:integer;
        asientosC:Integer;
    end;
    maestro = file of maestroR;
    detalle = file of detalleR;
//_________________________________________________
procedure importarMaestro();
begin
  
end;
//_________________________________________________
var
    m:maestroR;
    d:detalleR;
begin
    importarMaestro();
  
end.