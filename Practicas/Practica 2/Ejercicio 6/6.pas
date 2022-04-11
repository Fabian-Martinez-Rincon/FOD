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
puede venir 0 o N registros de un determinado artículo.
}
program seis;
const
    dimF = 15;
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
begin
    WriteLn('Hola');
end.