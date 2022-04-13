program Ej3;
const 
    dimF = 30;
    valorAlto = 9999;
type
    rango = 1..dimF;
    cadena20 = string[20];
    producto = record
        codigo:integer;
        nombre:cadena20;
        descripcion:cadena20;
        stock_disponible:integer;
        stock_minimo:integer;
        precio:real;
    end;
    prodDetalle = record
        codigo:integer;
        cantidad_vendida:integer;
    end;

    archivo_Maestro = file of producto;
    archivo_Detalle = file of prodDetalle;

    
    vector_Detalle = array [rango] of archivo_Detalle;
    vector_Prod_Detalle = array [rango] of prodDetalle;
//____________________________________________________________
procedure importarMaestro(var maestro:archivo_Maestro);
var
    carga:text;
    p:producto;
begin
    assign(carga,'maestro.txt');
	assign(maestro,'maestro.data');
	rewrite(maestro); reset(carga);
    
    while(not eof(maestro)) do
    begin
        with p do readln(carga, codigo, precio, nombre);
        with p do readln(carga, stock_disponible, stock_minimo, descripcion);
        Write(maestro,p);
    end;
    Close(carga);
    Close(maestro);
end;
//____________________________________________________________
procedure Leer(var detalle:archivo_Detalle; var datoD:prodDetalle);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.codigo:=valorAlto;
end;
//____________________________________________________________
procedure buscar_Minimo(var min_Detalle:prodDetalle;var vDetalle:vector_Detalle;var vDetalle_Reg:vector_Prod_Detalle);
var
    i,minPos:integer;
begin
    min_Detalle.codigo:=9999;
    for i:=1 to dimF do begin
        if (vDetalle_Reg[i].codigo < min_Detalle.codigo) then begin
            min_Detalle:=vDetalle_Reg[i];
            minPos:=i;
        end;
    end;
    if (min_Detalle.codigo <> valorAlto) then
        Leer(vDetalle[minPos],vDetalle_Reg[minPos]);
end;
//____________________________________________________________
procedure actualizarMaestro(var maestro:archivo_Maestro;var vDetalle:vector_Detalle;var vDetalle_Reg:vector_Prod_Detalle);
var
    min_Maestro:producto;
    i:integer;
    min_Detalle:prodDetalle;
begin
    buscar_Minimo(min_Detalle,vDetalle,vDetalle_Reg);
    while (min_Detalle.codigo <> valorAlto) do //mientras el archivo detalle no termine
    begin
        read(maestro,min_Maestro);
        while (min_Maestro.codigo <> min_Detalle.codigo) do
            read(maestro,min_Maestro);
        while (min_Maestro.codigo = min_Detalle.codigo) do
        begin
            min_Maestro.stock_disponible:= min_Maestro.stock_disponible-min_Detalle.cantidad_vendida;
            buscar_Minimo(min_Detalle,vDetalle,vDetalle_Reg);
        end;
        seek(maestro,filepos(maestro)-1);
        Write(maestro,min_Maestro);
    end;
    Close(maestro);
end;
//____________________________________________________________
procedure Exportar_Txt(var maestro:archivo_Maestro);
var
    texto:text;
    dato:producto;
begin
    assign(maestro,'maestro.data');
    reset(maestro); 
    assign(texto,'reporteProductos.txt');
    rewrite(texto);
    while(not EOF(maestro)) do begin
        read(maestro,dato);
        with dato do begin
          writeln(texto,' ',codigo,' ',nombre);
          writeln(texto,' ',stock_disponible,' ',stock_minimo,' ',precio:5:2);
        end;
    end;
    close(texto);
    close(maestro);
end;
//____________________________________________________________
procedure Exportar_StockMin(var maestro:archivo_Maestro);
var
    texto:text;
    datos:producto;
begin
    Assign(maestro,'maestro.data');
    reset(maestro);
    Assign(texto,'menorStock.txt');
    Rewrite(texto);
    while (not EOF(maestro)) do
    begin
        Read(maestro,datos);
        if (datos.stock_disponible < datos.stock_minimo) then
        begin
            with datos do WriteLn(texto, ' ', codigo, ' ' , nombre);
            with datos do WriteLn(texto, ' ', stock_disponible, ' ' , stock_minimo, ' ', precio:5:2);
        end;
    end;
    Close(texto);
    Close(maestro);
end;
//____________________________________________________________
var
    vDetalle_Reg:vector_Prod_Detalle;
    vDetalle:vector_Detalle;
    i:integer;
    iString:cadena20; //Para poder crear los detalles
    maestro:archivo_Maestro;
begin
    
    importarMaestro(maestro);
    for i:=1 to dimF do
    begin
        Str(i,iString);
        Assign(vDetalle[i], 'detalle'+iString);
        Rewrite(vDetalle[i]);
        Leer(vDetalle[i],vDetalle_Reg[i]);
        Close(vDetalle[i]);
    end;
    Assign(maestro, 'maestro.data');
    Rewrite(maestro);
    actualizarMaestro(maestro,vDetalle,vDetalle_Reg);
    Exportar_Txt(maestro);
    Exportar_StockMin(maestro);
end.