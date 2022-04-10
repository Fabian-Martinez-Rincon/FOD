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