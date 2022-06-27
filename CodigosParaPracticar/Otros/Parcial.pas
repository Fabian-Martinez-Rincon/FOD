program Parcial;
const
    VA = 9999;
type
    registroM = record
        cod_prenda:integer;
        descripcion:string;
        colores:string;
        tipo_prenda:string;
        stock:integer;
        precio_unitario:real;
    end;
    maestro = file of registroM;
    detalle = file of integer;  //cod_prenda
procedure Baja(var m:maestro;var d:detalle);
var
    datoD:integer;
    datoM:registroM;
begin
    Reset(m); Reset(d);
    LeerD(d,datoD);
    LeedM(m,datoM);
    while dato.cod_prenda <> VA do
    begin
        if dato.cod_prenda =  datoD then
            dato.cod_prenda:= dato.cod_prenda *-1;
        seek(m,FilePos(m)-1);
        Write(m,datoM);
        LeedM(m,datoM);
    end;
    Close(m);
    Close(d);
end;
procedure BuscarUltimo(var m:maestro;var ultimo:ave; var posUlt:Integer);
begin
    Seek(m,posUlt); //Nos vamos moviendo para atras
    Read(m,ultimo);
    while 0<ultimo.codigo do //Busco el ultimo registro no borrado
    begin
        Seek(m,posUlt-1);   //Voy al anterior
        posUlt:=FilePos(m); //Guardo el anterior
        Read(m,ultimo);     //Continuo leyendo normal
    end;
end;
//_________________________________________
procedure compactar(var m:maestro);
var
    datox,ultimo:ave;
    pos,posUlt:integer;
begin
    Reset(m);
    Leer(m,datox);
    posUlt:=FilePos(m)-1; 
    while (datox.codigo <> valorAlto) and (FilePos(m) <= posUlt) do
    begin
        pos:=FilePos(m);
        if (0<datox.codigo) then
        begin
            BuscarUltimo(m,ultimo,posUlt);
            posUlt:=posUlt-1;               //Decremento mi posUlt ya que encontre el eliminado
            Seek(m,pos-1); Write(m,ultimo); //remplazo el dato
        end;
        Leer(m,datox);
    end;
    Seek(m,posUlt+1); 
    Truncate(m);
    Close(m);
end;
var
    m:maestro;
    d:detalle;
begin
    Assign(m, 'maestro.data');
    Assign(d, 'detalle.data');
    Baja(m,d);
    compactar(m);
end.