const valoralto = '9999';
type 
    registroM = record
        cod: integer;
        descripcion: string[30];
        pu: real;
        stock: integer;
    end;
    registroD = record
        cod: integer;
        cant_vendida: integer;
    end;
    detalle = file of registroD;
    maestro = file of registroM;
procedure leer( var archivo: detalle; var dato: registroD);
begin
    if (not(EOF(archivo))) then
        read (archivo, dato)
    else
        dato.cod := valoralto;
end;
procedure CorteDeControl(var m:maestro; var d:detalle);
var
    datoM: registroM;
    datoD: registroD;
    total: integer; actual: integer;
begin
    assign(m, 'maestro'); reset(m); read(m, datoM);
    assign(d, 'detalle'); reset(d); leer(d, datoD);
    while (datoD.cod <> valoralto) do begin
        actual := datoD.cod;
        total := 0;
        while (actual = datoD.cod) do begin
            total := total + datoD.cant_vendida;
            leer(d, datoD);
        end;
        while (datoM.cod <> actual) do
            read (m, datoM);
        datoM.cant := datoM.cant - total;
        seek(m, filepos(m)-1);
        write(m, datoM);
        if (not(EOF(m))) then
            read(m, datoM);
    end;
    close(d);
    close(m);
end;