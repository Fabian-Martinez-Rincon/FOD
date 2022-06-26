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
procedure LeerD(var d:detalle;var dato:pedido);
    begin
        if not eof(d) then
            Read(d,dato)
        else
            dato.codigo:=VALOR_ALTO
    end;
procedure LeerM(var m:maestro;var dato:producto);
    begin
        if not eof(m) then
            Read(m,dato)
        else
            dato:=VALOR_ALTO;
    end;
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
            LeerD(vd[i],vdr[i]);
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
procedure minimo(var vd:vector_detalle;var vdr:vector_detalle_registro;var sucursal:integer;var min:pedido);
    var
        i:integer;
    begin
        min.codigo:=VALOR_ALTO;
        for i:=1 to CANTIDAD do begin
            if vdr[i].codigo<min.codigo then
                min:=vdr[i];
                sucursal:=i;
        end;
        if min.codigo <> VALOR_ALTO then
            LeerD(vd[sucursal],vdr[sucursal]);
    end;
procedure merge(var m:maestro;var vd:vector_detalle;var vdr:vector_detalle_registro;);
var
    min:pedido;
    datoM:producto;
    sucursal:integer;
    cant_total:integer;
    cantidad:integer;
begin
    Reset(m); ResetDetalles(vd,vdr);
    minimo(vd,vdr,min,sucursal);
    while min.codigo <> VALOR_ALTO do
    begin
        LeerM(m,datoM);
        while datoM.codigo < min.codigo do //Puede no existir
            LeerM(m,datoM);
        cant_total:=0;
        while datoM.codigo = min.codigo do
        begin
            cant_total:=cant_total+min.cant_pedida;
            minimo(vd,vdr,min,sucursal);
        end;
        datoM.stock_actual:=datoM.stock_actual-cant_total;
        if (datoM.stock_actual<datoM.stock_minimo) and (0<=datoM.stock_actual) then
        begin
            Write('debajo del stock mínimo ');
            Writeln(datoM.codigo);
        end;
        if datoM.stock_actual<0 then
        begin
            Write(sucursal);
            write(datoM.codigo);
            cantidad:=datoM.stock_actual*-1;
            writeln(cantidad);
            datoM.stock_actual:=0;
        end;
        Seek(m,FilePos(m)-1);
        Write(m,datoM);   
    end;
    Close(m); CloseDetalles(vd);
end;
var
    m:maestro;
    vd:vector_detalle;
    vdr:vector_detalle_registro;
begin
    Assign(m,'maestro.data');
    merge(m,vd,vdr);
end.