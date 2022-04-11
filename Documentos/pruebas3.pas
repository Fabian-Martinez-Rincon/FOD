program ejemplo_3_3;
const valoralto='9999';
type str4 = string[4];
    producto = record
        cod: str4;
        descripcion: string[30];
        pu: real;
        cant: integer;
    end;
    venta_prod = record
        cod: str4;
        cant_vendida: integer;
    end;
    detalle = file of venta_prod;
    maestro = file of producto;
procedure leer (var archivo:detalle; var dato:venta_prod);
begin
    if (not eof(archivo))then
        read (archivo,dato)
    else
        dato.cod:= valoralto;
end;
var
    regm: producto;
    regd: venta_prod;
    mae1: maestro;
    det1: detalle;
    total: integer;
    aux: str4;
{programa principal}
begin
    assign (mae1, 'maestro'); Rewrite (mae1);
    assign (det1, 'detalle'); Rewrite (det1);
    read(mae1,regm);
    leer(det1,regd);

    while (regd.cod <> valoralto) do
    begin
    aux := regd.cod;
    total := 0;
    while (aux = regd.cod ) do
    begin
        total := total + regd.cant_vendida;
        leer(det1,regd);
    end;
    while (regm.cod <> aux) do
        read (mae1,regm);
    regm.cant := regm.cant - total;
    seek (mae1, filepos(mae1)-1);
    write(mae1,regm);
    if (not eof (mae1))
    then
        read(mae1,regm);
    end;
    close (det1);
    close (mae1);
end.