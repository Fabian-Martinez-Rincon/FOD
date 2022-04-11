program ejemplo_3_2;
type
    producto = record
        cod: str4;
        descripcion: string[30];
        pu: real;
        stock: integer;
    end;
    venta_prod = record
        cod: str4;
        cant_vendida: integer;
    end;
    detalle = file of venta_prod;
    maestro = file of producto;
var
    regm: producto;
    regd: venta_prod;
    mae1: maestro;
    det1: detalle;
    cod_actual: str4;
    tot_vendido: integer;
begin
    assign (mae1, 'maestro');
    assign (det1, 'detalle');
    reset (mae1);
    reset (det1);
    while (not eof(det1)) do
    begin
        read(mae1,regm);
        read(det1,regd);
        while (regm.cod <> regd.cod) do
            read (mae1,regm);
        cod_actual := regd.cod;
        tot_vendido := 0;
        while (regd.cod = cod_actual) do
        begin
            tot_vendido := tot_vendido + regd.cant_vendida;
            read(det1,regd);
        end;
        regm.stock := regm.stock - tot_vendido;
        seek (mae1, filepos(mae1)-1);
        write(mae1,regm);
    end;
    close(det1);
    close(mae1);
end.