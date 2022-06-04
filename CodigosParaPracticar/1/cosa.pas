program cosa;
uses Crt;
const
    vA = 9999;
    dimF = 2;
type
    archivo = file of integer;
    vector = array [1..dimF] of archivo; //Vector para procesar N detalles
    vectorDatos = array [1..dimF] of integer; //Los datos de los detalles
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
procedure Un_Archivo_desde_otro_archivo(var m,d:archivo);
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
var
    m:archivo;
    txt:Text;
    d:archivo;
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
    WriteLn;
    Writeln('Un_Archivo_Con_una_constante MAESTRO');
    Un_Archivo_desde_otro_archivo(m,d);
    Un_archivo_que_esta_Desordenado(m);
    
    //Agregar
    WriteLn;
    Writeln('_____AGREGAR_____');
    Datos_a_un_archivo_Desde_teclado(m);
    Un_archivo_que_esta_Desordenado(m);
    //Corte de Control
    WriteLn;
    
end.