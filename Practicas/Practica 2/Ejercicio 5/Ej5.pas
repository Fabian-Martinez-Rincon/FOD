program Ej5;
const
    dimF = 5; //Tendira que ser 50
    valorAlto = 9999;
type
    cadena20 = string[20];
    direccion = record
        calle:integer;
        nro:integer;
        piso:integer;
        depto:integer;
        ciudad:cadena20;
    end;
    datos = record
        nombre:cadena20;
        apellido:cadena20;
        dni:cadena20;
    end;
    nacimiento = record
        nroNaci:integer;
        nombre:cadena20;
        apellido:cadena20;
        dir:direccion;
        matricula:integer;
        madre:datos;
        padre:datos;
    end;
    
    fallecimiento = record
        nroNaci:integer;
        dni:integer;
        nombre:cadena20;
        apellido:cadena20;
        matricula:integer; //Matricula del medico
        fecha:Integer;
        hora:integer;
        lugar:cadena20;
    end;
    
    RegFallecio = record
        matricula:integer;
        fecha:integer;
        hora:integer;
        lugar:cadena20;
    end;
    regMaestro = record
        nroNaci:integer;
        nombre:cadena20;
        apellido:cadena20;
        dir:direccion;
        matricula:Integer;
        madre:datos;
        padre:datos;
        siFallecio:RegFallecio;
    end;

    archNacimiento = file of nacimiento;
    nacimientos = array [1..dimF] of archNacimiento;
    nacimientoReg = array [1..dimF] of nacimiento;

    archFallecimiento = file of fallecimiento;
    fallecimientos = array [1..dimF] of archFallecimiento;
    fallecimientosReg = array [1..dimF] of fallecimiento; 

    archMaestro = file of regMaestro;
//________________________________________________________________________
procedure LeerN(var detalle:archNacimiento; var datoD:nacimiento);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.nroNaci:=valorAlto;
end;
//________________________________________________________________________
procedure LeerF(var detalle:archFallecimiento; var datoD:fallecimiento);
begin
    if(not EOF(detalle)) then
        read(detalle,datoD)
    else
        datoD.nroNaci:=valorAlto;
end;
//________________________________________________________________________
procedure minimoN(var vN:nacimientos;var vNR:nacimientoReg;var minN:nacimiento);
var
    i,minPos:integer;
begin
    minN.nroNaci:=9999;
    for i:=1 to dimF do begin
        if (vNR[i].nroNaci < minN.nroNaci) then begin
            minN:=vNR[i];
            minPos:=i;
        end;
    end;
    if (minN.nroNaci <> valorAlto) then
        LeerN(vN[minPos],vNR[minPos]);
end;
//________________________________________________________________________
procedure minimoF(var vF:fallecimientos;var vNR:fallecimientosReg;var minF:fallecimiento);
var
    i,minPos:integer;
begin
    minF.nroNaci:=9999;
    for i:=1 to dimF do begin
        if (vNR[i].nroNaci < minF.nroNaci) then begin
            minF:=vNR[i];
            minPos:=i;
        end;
    end;
    if (minF.nroNaci <> valorAlto) then
        LeerF(vF[minPos],vNR[minPos]);
end;
//________________________________________________________________________
procedure cargarMaestroN(var actual:regMaestro;minN:nacimiento);
begin
    actual.nroNaci:=minN.nroNaci;
    actual.nombre:=minN.nombre;
    actual.apellido:=minN.apellido;
    actual.dir:=minN.dir;
    actual.matricula:=minN.matricula;
    actual.madre:=minN.madre;
    actual.padre:=minN.padre;
    //Como es de nacimiento supongo que los pongo en blanco de momento :(
    actual.siFallecio.matricula:=-1;
    actual.siFallecio.fecha:=-1;
    actual.siFallecio.hora:=-1;
    actual.siFallecio.lugar:=' ';

end;
//________________________________________________________________________
procedure cargarMaestroF(var actual:regMaestro;minF:fallecimiento);
begin
    actual.siFallecio.matricula:=minF.matricula;
    actual.siFallecio.fecha:=minF.fecha;
    actual.siFallecio.hora:=minF.hora;
    actual.siFallecio.lugar:=minF.lugar;
end;
//________________________________________________________________________
procedure crearMaestro(var maestro:archMaestro;var vN:nacimientos;var vNR:nacimientoReg;var vF:fallecimientos;var vFR:fallecimientosReg);
var
    actual:regMaestro;
    i:integer;
    minN:nacimiento; 
    minF:fallecimiento;
begin
    Assign(maestro, 'siniestro.data');
    Rewrite(maestro);
    minimoN(vN,vNR,minN);
    while (minN.nroNaci <> valorAlto) do
    begin
        cargarMaestroN(actual,minN);
        write(maestro,actual);
        minimoN(vN,vNR,minN);
    end;
    //Esto lo hago para volver al primer elemento y agregar si fallecieron
    for i:=1 to dimF do 
        close(vN[i]);
    Close(maestro); 
    Reset(maestro);
    minimoF(vF,vFR,minF);
    while (minF.nroNaci <> valorAlto) and (not Eof(maestro)) do
    begin
        while (actual.nroNaci <> minF.nroNaci) do
            Read(maestro,actual);
        cargarMaestroF(actual,minF);
        seek(maestro,FilePos(maestro)-1);
        Write(maestro,actual);
        minimoF(vF,vFR,minF);
    end;
    
    for i:=1 to dimF do 
        close(vF[i]);
    close(maestro);

end;
//________________________________________________________________________
procedure ExportarATxtMaestro(var archivoMae:archMaestro);
var
    texto:Text;
    r:regMaestro;
begin
    assign(archivoMae,'maestroSiniestro.data');
    Reset(archivoMae); //abro mi archivo binario
    assign(texto,'reporteSiniestros.txt');
    rewrite(texto); //creo mi archivo de texto
    while(not EOF(archivoMae)) do begin
        read(archivoMae,r);
        with r do begin
          writeln(texto,' ',nroNaci,' ',nombre,' ',apellido,' ',matricula);
        end;
    end;
    close(texto);
    close(archivoMae);
end;
//________________________________________________________________________
var
    i:integer;
    iString:cadena20;
    maestro:archMaestro;
    vN:nacimientos;     vNR:nacimientoReg;
    vF:fallecimientos;  vFR:fallecimientosReg;
begin
    for i:=1 to dimF do
    begin
        Str(i,iString);
        Assign(vN[i],'detalleN'+iString); Assign(vF[i],'detalleF'+iString);
        Reset(vN[i]);                     Reset(vF[i]);
        
        LeerN(vN[i],vNR[i]);              LeerF(vF[i],vFR[i]);
    end;
    crearMaestro(maestro,vN,vNR,vF,vFR);
    ExportarATxtMaestro(maestro);
end.