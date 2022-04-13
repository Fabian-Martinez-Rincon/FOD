{10. Se tiene información en un archivo de las horas extras realizadas por los empleados de una
empresa en un mes. Para cada empleado se tiene la siguiente información: departamento,
división, número de empleado, categoría y cantidad de horas extras realizadas por el
empleado. Se sabe que el archivo se encuentra ordenado por departamento, luego por división,
y por último, por número de empleado. Presentar en pantalla un listado con el siguiente formato:
Departamento
División
Número de Empleado  Total de Hs.    Importe a cobrar
......              ..........      .........
......              ..........      .........

Total de horas división: ____
Monto total por división: ____
División
.................
Total horas departamento: ____
Monto total departamento: ____

Para obtener el valor de la hora se debe cargar un arreglo desde un archivo de texto al
iniciar el programa con el valor de la hora extra para cada categoría. La categoría varía de 1
a 15. En el archivo de texto debe haber una línea para cada categoría con el número de
categoría y el valor de la hora, pero el arreglo debe ser de valores de horas, con la posición
del valor coincidente con el número de categoría.}
program Ej10;
const
    dimF = 15;
    valorAlto = 9999;
type
    rango = 1..15;
    empleado = record
        departamento:Integer;
        division:integer;
        nro:integer;
        categoria:integer;
        horas_extras:integer;
    end;
    maestro = file of empleado;
    vector = array [rango] of integer; //Arreglos con valores de las horas extra
//_____________________________________________
procedure ImportarMaestro(var m:maestro);
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
//_____________________________________________
procedure CargarVector(var v:vector);
var
    i:integer;
begin
    for i:=0 to dimF do
    begin
        v[i]:=i;
    end;
end;
//_____________________________________________
procedure leer(var arch:maestro; var aux:empleado);
begin
    if(not eof(arch))then 
		read(arch,aux)
    else 
		aux.departamento:=valorAlto;
end;
//_____________________________________________
procedure listado(var m:maestro; v:vector);
var
    actualD,actualDiv,actualN,x:empleado;
    totalHD,montoTD:integer;
    totalHDiv,montoTDiv:Integer;
    TotalHs:integer;
    Importe:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);
    leer(m,x);
    while x.departamento <> valoralto do
    begin
        actualD:=x;
        totalHD:=0;
        montoTD:=0;
        WriteLn('___________________');
        WriteLn('Departamento: ', x.departamento);
        while x.departamento = actualD.departamento do
        begin
            actualDiv:=x;
            totalHDiv:=0;
            montoTDiv:=0;
            WriteLn('___________________');
            WriteLn('Division: ', x.division);
            while (x.division = actualDiv.division) and (x.departamento = actualD.departamento) do
            begin
                actualN:=x;
                TotalHs:=0;
                Importe:=0;
                WriteLn('Numero de Empleado: ', x.nro);
                while (x.nro = actualN.nro) and (x.division = actualDiv.division) and (x.departamento = actualD.departamento) do
                begin
                    TotalHs:=TotalHs + x.horas_extras;
                    leer(m,x);
                end;
                totalHDiv:=totalHDiv + TotalHs;
                Importe:=TotalHs*v[x.categoria];
                WriteLn('Total de Hs: ',TotalHs);
                WriteLn('Importe a cobrar: ',Importe);
                montoTDiv:=montoTDiv +Importe;
            end;
            WriteLn('Total de horas division: ', totalHDiv);
            WriteLn('Monto total por division: ',montoTDiv);
            totalHD:=totalHD + totalHDiv;
            montoTD:=montoTD + montoTDiv;
        end;
        WriteLn('Total horas departamento: ', totalHD);
        WriteLn('Monto total departamento: ', montoTD);
    end;
end;
//_____________________________________________
var
    m:maestro;
    v:vector;
begin
    randomize;
    importarMaestro(m);
    CargarVector(v); //Cargo el vector con los precios de las horas extras
    listado(m,v);
end.