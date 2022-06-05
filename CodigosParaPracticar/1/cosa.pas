program cosa;
uses Crt;
const
    vA = 9999;
    dimF = 2;
type
    archivo = file of integer;
    vector_archivo = array [1..dimF] of archivo; //Vector para procesar N detalles
    vector_datos = array [1..dimF] of integer; //Los datos de los detalles
procedure Un_Archivo_Desde_un_Texto(var m:archivo;var txt:text);
var
    dato:integer;
begin
    Reset(txt);
    Rewrite(m);
    while not eof (txt) do
    begin
        Read(txt,dato);
        Write(m,dato);
    end;
    Close(m);
    Close(txt);
end;
procedure Un_Texto_Desde_un_Archivo(var txt:Text;var m:archivo);
var
    dato:Integer;
begin
    Reset(m);
    Rewrite(txt);
    while not eof (m) do
    begin
        Read(m,dato);
        Writeln(txt,dato);
    end;
    Close(m);
    Close(txt);
end;
procedure Un_archivo_que_esta_Desordenado(var m:archivo);
var
    dato:integer;
begin
    Reset(m);
    while not eof(m) do
    begin
        read(m,dato);
        Write(dato,' ');
    end;
    Close(m);
end;
procedure Un_archivo_que_esta_Ordenado(var m:archivo;var txt:Text);
    procedure Leer(var m:archivo;var dato:integer);
    begin
        if (not eof(m)) then
            read(m,dato)
        else
            dato:=vA;
    end;
var
    dato:integer;
    actual,total:integer;
begin
    
    Rewrite(txt);
    Reset(m);
    Leer(m,dato);  
    while (dato <> vA) do
    begin
        total:=0;
        actual:=dato;
        while (actual = dato) do
        begin
            total:=total+1;
            Leer(m,dato);    
        end;
        Writeln(txt,'El nro: ',actual,' se repitio: ',total);
        Writeln('El nro: ',actual,' se repitio: ',total);
    end;                            
    close(m);
    close(txt);                                                                                                                                  
end;
procedure Un_Archivo_Con_una_constante(var m:archivo);
var
    dato:Integer;
begin
    Reset(m);
    while not eof(m) do
    begin
        Read(m,dato);
        dato:=dato*2;
        seek(m,FilePos(m)-1);
        write(m,dato);
    end;
    Close(m);
end;
procedure Corte_de_control(var m,d:archivo);
    procedure Leer(var d:archivo;var dato:Integer);
    begin
        if (not eof(d)) then
            Read(d,dato)
        else
            dato:=vA;
    end;
var
    total,datoD,datoM:integer;
begin
    Reset(m);
    Reset(d);
    Leer(d,datoD);
    while datoD <> vA do
    begin
        total:=0;
        Read(m,datoM);
        while (datoM <> datoD) and (datoD <> vA) do
            Read(m,datoM);
        while datoM = datoD do
        begin
            total:=total+datoD;
            Leer(d,datoD);  
        end;
        Seek(m,FilePos(m)-1);
        Write(m,total);
    end;
    Close(m);
    Close(d);
end;
procedure Datos_a_un_archivo_Desde_teclado(var m:archivo);
var
    dato:integer;
begin
    Reset(m);
    Seek(m,FileSize(m));
    ReadLn(dato);
    while (dato <> 0) do
    begin
        Write(m,dato);
        ReadLn(dato);
    end;
    Close(m);
end;
procedure merge(var m:archivo;var vd:vector_archivo;var vdr:vector_datos);
    procedure leer(var d:archivo;var dato:integer);
    begin
        if not eof(d)then
            read(d,dato)
        else
            dato:=vA;
    end;
    procedure minimo(var vd:vector_archivo; var vdr:vector_datos;var min:integer);
    var
        i,minPos:Integer;
    begin
        min:=9999;
        for i:=1 to dimF do
        begin
            if (vdr[i] < min) then
            begin
                min:=vdr[i];
                minPos:=i;
            end;
        end;
        //Para avanzar en el archivo leido y que no quede en bucle
        if (min <> vA) then 
            Leer(vd[minPos],vdr[minPos]);
    end;
    procedure ResetDetalles(var vd:vector_archivo;var vdr:vector_datos);
    var
        i:integer;
        istr:String[1];
    begin
        for i:=1 to dimF do
        begin
            Str(i,istr);
            Assign(vd[i],'detalle' + istr);
            Reset(vd[i]);
            Leer(vd[i],vdr[i]);
        end;
    end;
    procedure CloseDetalles (var vd:vector_archivo);
    var
        i:integer;
    begin
        for i:=1 to dimF do
        begin
            Close(vd[i]);
        end;
    end;
var
    dato:integer;
    min:integer;
begin
    Reset(m);
    ResetDetalles(vd,vdr);
    minimo(vd,vdr,min);
    while min <> vA do
    begin
        read(m,dato);
        while (dato <> min) do
            read(m,dato);
        while dato = min do
        begin
            dato:=dato+min;
            minimo(vd,vdr,min);
        end;
        Seek(m,FilePos(m)-1);
        Write(m,dato);
    end;
    Close(m);
    CloseDetalles(vd);
end;
procedure Un_Dato_Sabiendo_Que_Existe(var m:archivo;nro_baja:Integer);
    procedure Leer(var m:archivo;var dato:Integer);
    begin
        if not eof (m) then
            Read(m,dato)
        else 
            dato:=vA;
    end;
var
    dato:integer;
begin
    Reset(m);
    leer(m,dato);
    while dato <> nro_baja do Read(m,dato);
    dato:=-1;
    Seek(m,FilePos(m)-1);
    Write(m,dato);
    Close(m);
end;
procedure Un_Dato_Sin_Saber_Si_Existe(var m:archivo;nro_baja:Integer);
    procedure Leer(var m:archivo;var dato:integer);
    begin
        if not eof(m) then 
            read(m,dato)
        else
            dato:=vA;
    end;
var
    dato:integer;
begin
    reset(m);
    Leer(m,dato);
    while (dato <> vA) and (dato <> nro_baja) do Leer(m,dato);
    if dato <> vA then
    begin
        Seek(m,FilePos(m)-1);
        dato:=-1;
        Write(m,dato);
    end;
    close(m);
end;
procedure Un_Dato_Ingresado_Desde_Teclado(var m:archivo);
begin

end;
var
    m,d:archivo;
    txt:Text;
    vd:vector_archivo; //Vector con los archivos detalles
    vdr:vector_datos;  //Vector con los datos para leer cada archivo
    nro_baja:Integer;
begin
    ClrScr;
    //Crear
        Assign(m,'maestro.data');
        Assign(txt,'maestro.txt');
        Un_Archivo_Desde_un_Texto(m,txt);
        
        Assign(d,'detalle.data');
        Assign(txt,'detalle.txt');
        Un_Archivo_Desde_un_Texto(d,txt);

        Assign(txt,'maestroResultado.txt');
        Un_Texto_Desde_un_Archivo(txt,m);

    //Imprimir
        writeln('_____IMPRIMIR_____');
        Writeln('Un_archivo_que_esta_Desordenado DETALLE');
        Un_archivo_que_esta_Desordenado(d);
        WriteLn;
        Writeln('Un_archivo_que_esta_Ordenado DETALLE');
        Assign(txt,'detalleOrdenado.txt');
        Un_archivo_que_esta_Ordenado(d,txt);
    
    
    //Actualizar 
        writeln('_____ACTUALIZAR_____');
        Writeln('Un_Archivo_Con_una_constante MAESTRO');
        //Un_Archivo_Con_una_constante(m); //Se modifica el maestro
        Un_archivo_que_esta_Desordenado(m);
    
    //Agregar
        WriteLn;
        Writeln('_____AGREGAR_____');
        //Datos_a_un_archivo_Desde_teclado(m);
        Un_archivo_que_esta_Desordenado(m);
        //Corte de Control
        WriteLn;
        //Corte_de_control(m,d);
        //Merge
        //merge(m,vd,vdr);

    //Bajas
        WriteLn;
        Writeln('_____BAJAS_____');
        nro_baja:=5;
        Un_Dato_Sabiendo_Que_Existe(m,nro_baja);
        Un_archivo_que_esta_Desordenado(m);
        writeln;
        nro_baja:=8;
        Un_Dato_Sin_Saber_Si_Existe(m,nro_baja);
        Un_archivo_que_esta_Desordenado(m);
        
        Un_Dato_Ingresado_Desde_Teclado(m);
        Un_archivo_que_esta_Desordenado(m);
        
    
end.