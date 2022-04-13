program Ej4;
const
    valorAlto = 9999;
    dimf = 5;         //Cantidad de maquinas
type
    cadena20 = string[20];
    regDetalle = record
        cod_usuario:integer;
        fecha:integer;
        tiempo_sesion:integer;
    end;
    regMaestro = record
        cod_usuario:integer;
        fecha:integer;
        tiempo_total_de_sesiones_abiertas:integer;
    end;

    archMaestro = file of regMaestro;
    archDetalle = file of regDetalle;

    vector_detalle_registro = array [1..dimf] of regDetalle;
    vector_detalle = array [1..dimf] of archDetalle;
//___________________________________________________
procedure Leer(var detalle:archDetalle; var datoD:regDetalle);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.cod_usuario:=valorAlto;
end;
//___________________________________________________
procedure minimo(var vDetalle:vector_detalle;var vDetalleR:vector_detalle_registro;var min:regDetalle);
var
    i,minPos:integer;
begin
    min.cod_usuario:=9999;
    min.fecha:=9999;
    for i:=1 to dimf do 
    begin
        if ((vDetalleR[i]).cod_usuario < min.cod_usuario) then
        begin
            if((vDetalleR[i]).fecha < min.fecha)then
            begin
                min:=vDetalleR[i];
                minPos:=i;
            end;
        end;
    end;
    if(min.cod_usuario <> 9999)then
        Leer(vDetalle[minPos],vDetalleR[minPos]);
end;
//___________________________________________________
procedure crearMestro(var vDetalle:vector_detalle;var vDetalleR:vector_detalle_registro;var maestro:archMaestro);
var
    min:regDetalle;
    actual:regMaestro;
    i:integer;
begin
    Assign(maestro, 'maestro.data');
    Rewrite(maestro);
    minimo(vDetalle,vDetalleR,min);
    while min.cod_usuario <> 9999 do
    begin
        actual.cod_usuario:=min.cod_usuario;
        while actual.cod_usuario = min.cod_usuario do
        begin
            actual.fecha:=min.fecha;
            actual.tiempo_total_de_sesiones_abiertas:=0;
            while (min.cod_usuario <> 9999) and (min.cod_usuario = actual.cod_usuario) and (min.fecha = actual.fecha) do
            begin
                actual.tiempo_total_de_sesiones_abiertas:= actual.tiempo_total_de_sesiones_abiertas + min.tiempo_sesion;
                minimo(vDetalle,vDetalleR,min);
            end;
            WriteLn(actual.cod_usuario, ' ', actual.fecha, ' ', actual.tiempo_total_de_sesiones_abiertas);
            Write(maestro,actual);
        end;
    end;
    Close(maestro);

end;
//___________________________________________________
var
    i:integer;
    iString:cadena20;
    vDetalleR:vector_detalle_registro;
    vDetalle:vector_detalle;
    maestro:archMaestro;
begin
    iString:='';
    for i := 1 to dimf do
    begin
        
        Str(i,iString);
        Assign(vDetalle[i], 'detalle'+iString);
        Rewrite(vDetalle[i]);
        Leer(vDetalle[i],vDetalleR[i]);
        Close(vDetalle[i]); 
    end;
    crearMestro(vDetalle,vDetalleR,maestro);
end.