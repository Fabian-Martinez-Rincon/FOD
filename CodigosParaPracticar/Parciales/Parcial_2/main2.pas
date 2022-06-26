program main2;
const 
    CANTIDAD = 2;
    VALOR_ALTO = 9999;
type
    RANGO = 1..CANTIDAD;
    producto = record
        codigo:integer;
        precio:real;
        stock_actual:integer;
        stock_minimo:integer;
    end;
    pedido = record
        codigo:integer;
        fecha:string;
        cant_pedida:integer;
    end;
    maestro = file of producto;
    detalle = file of pedido;
    vector_detalle = array [RANGO] of detalle;
    vector_detalle_registro = array [RANGO] of pedido;
//____________________________________________
procedure Leer(var d:detalle;var dato:pedido);
begin
    if not eof(d) then
        Read(d,pedido)
    else
        dato.codigo:=VALOR_ALTO
end;
//____________________________________________
procedure ResetDetalles(var vd:vector_detalle;var vdr:vector_detalle_registro);
var
    i:integer;
    iStr:string;
begin
    for i:=1 to CANTIDAD do
    begin
        Str(i,iStr);
        Assign(vd[i],'detalle ' + iStr);
        Reset(vd[i]);
        Leer(vd[i],vdr[i]);
    end;
end;
procedure CloseDetalles(var vd:vector_detalle);
var
    i:integer;
begin
    for i:=1 to CANTIDAD do
    begin
        Close(vd[i]);
    end;
end;
procedure minimo();
begin
  
end;
procedure merge();
begin
  
end;
begin

end.