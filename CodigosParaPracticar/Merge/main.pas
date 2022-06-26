program main;
const
    cantidad = 10;
    vA = 9999;
type
   archivo = file of integer;
   vector_detalle = array [1..cantidad] of archivo;
   vector_detalle_datos = array [1..cantidad] of integer;  
procedure Leer(var d:archivo;var dato:integer);
    begin
        if not eof(d) then
            Read(d,dato)
        else
            dato:=vA;
    end;

procedure ResetDetalles(var vd:vector_detalle;var vdd:vector_detalle_datos);
    var
        dato,i:integer;
        iStr:string;
    begin
        for i:=1 to cantidad do
        begin
            Str(i,iStr);
            Assign(vd[i],'detalle' + iStr);
            Reset(vd[i]);
            Leer(vd[i],vdd[i]);
        end;
    end;
procedure CloseDetalles(var vd:vector_detalle);
    var
        i:Integer;
    begin
        for i:=1 to cantidad do
        begin
            Close(vd[i]);
        end;
    end;
procedure minimo(var vd:vector_detalle;var vdd:vector_detalle_datos;var min:integer);
    var
        pos:integer;
    begin
        min:=vA;
        for i:=1 to cantidad do
        begin
            if (vdd[i]<min) then
            begin
                pos:=i;
                min:=vdd[i];
            end;
        end;
        if min <> vA then
        begin
            Leer(vd[pos],vdd[pos]);
        end;
    end;
procedure Merge(var m:archivo;var vd:vector_detalle;var vdd:vector_detalle_datos);
var
    min,datoM:integer;
begin
    Reset(m);
    ResetDetalles(vd,vdd);
    minimo(vd,vdd,min);
    while min <> vA do
    begin
        Read(m,datoM);
        while (min <> datoM) and (datoM <> vA) do
            Read(m,datoM);
        while (min = datoM) do
        begin
            datoM:=datoM+min;
            minimo(vd,vdd,min);
        end;
        Seek(m,FilePos(m)-1);
        write(m,datoM);
    end;
    Close(m);
    CloseDetalles(vd);
end;
var
    m:archivo;
    vd:vector_detalle;
    vdd:vector_detalle_datos;
begin
    Assigin(m,'maestro.data');
    Merge(m,vd,vdd);
end.