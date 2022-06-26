program main;
const
    vA = 9999;
    cantidad = 10;
type
    municipio = record
        localidad:integer;
        cepa:integer;
        activos:integer;
        nuevos:integer;
        recuperados:integer;
        fallecidos:integer;
    end;
    registroM = record
        localidad:integer;
        nombre:string;
        cepa:Integer;
        nombre_cepa:string;
        activos:integer;
        nuevos:Integer;
        recuperados:integer;
        fallecidos:integer;
    end;
    maestro = file of registroM;
    detalle = file of municipio;
    vector_detalle = array [1..cantidad] of detalle;
    vector_detalle_registro = array [1..cantidad] of municipio; 

procedure Leer(var d:detalle;var dato:municipio);
    begin
        if not eof(d) then
            Read(d,dato)
        else
            dato.localidad:=vA;
    end;
procedure ResetDetalles(var vd:vector_detalle;var vdr:vector_detalle_registro);
    var
        i:integer;
        iStr:string;
        dato:municipio;
    begin
        for i:=1 to cantidad do
        begin
            Str(i,iStr);
            Assign(vd[i], 'detalle ' + iStr);
            Reset(vd[i]);
            Leer(vd[i],vdr[i]);
        end;
    end;
procedure CloseDetalles(var vd:vector_detalle);
    var
        i:integer;
    begin
        for i:=1 to cantidad do
        begin
            Close(vd[i]);
        end;
    end;
procedure minimo(var vd:vector_detalle;var vdr:vector_detalle_registro;var min:municipio);
    var 
        pos:integer;
    begin
        min.localidad:=vA;
        min.cepa:=vA;
        for i:=1 to cantidad do
        begin
            if vdr[i].localidad <= min.localidad then
                if vdr[i].cepa < min.cepa then
                begin
                    pos:=i;
                    min:=vdr[i]
                end;
        end;
        if (min.localidad <> vA) then
            Leer(vd[pos],vdr[pos]);
    end;
procedure merge(var m:maestro;var vd:vector_detalle;var vdr:vector_detalle_registro);
var
    datoM:registroM;
    min:municipio;
begin
    Reset(m);
    ResetDetalles(vd,vdr);
    minimo(vd,vdr,min);
    while min.localidad <> vA do
    begin
        Read(m,datoM);
        while (datoM.localidad <> min.localidad) and (datoM.cepa <> min.cepa) do
            Read(m,datoM);
        total_fallecidos:=0;
        total_recuperados:=0;
        while (datoM.localidad = min.localidad) and (datoM.cepa = min.cepa) do
        begin
            datoM.recuperados:=datoM.recuperados+min.recuperados;
            datoM.fallecidos:=datoM.fallecidos+min.fallecidos;
            datoM.activos:=min.activos;
            datoM.nuevos:=min.nuevos;
            minimo(vd,vdr,min);
        end;
        seek(m,FilePos(m)-1);
        write(m,datoM);
    end;
    CloseDetalles(vd);
    Close(m);
end;
var
    m:maestro;
    vd:vector_detalle;
    vdr:vector_detalle_registro;
begin
    Assign(m,'maestro.data');
    merge(m,vd,vdr);
end.