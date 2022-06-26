program main;
const
    vA = 'ZZZ';
type
    registro = record
        nro:integer;
        nom:string;
    end;
    archivo = file of registro;
procedure Leer(var d:archivo;var dato:registro);
    begin
        if not eof(d) then
            Read(d,dato)
        else
            dato.nom:=vA;
    end;
procedure Un_Archivo_desde_otro_archivo(var m,d:archivo);
    var
        datoM,datoD:registro;
        total:integer;
    begin
        Reset(m); Reset(d);
        Leer(d,datoD);
        while datoD.nom <> vA do
        begin
            Read(m,datoM);
            total:=0;
            while (datoM.nom <> datoD.nom) and (datoM.nom <> vA) do
                Read(m,datoM);
            while datoM.nom = datoD.nom do
            begin
                total:=total+datoD.nro;
                Leer(d,datoD);
            end;
            Seek(m,FilePos(m)-1);
            datoM.nro:= total;
            Write(m,datoM);
        end;
        Close(m); Close(d);
    end;
var
    m,d:archivo;
begin
    Assign(m,'maestro.data');
    Assign(d,'detalle.data');
    Un_Archivo_desde_otro_archivo(m,d);
end.