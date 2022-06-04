program cosa;
const
    vA = 9999;
type
    archivo = file of integer;
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
procedure Un_Texto_Desde_un_Archivo(var txt:Text);
var
    m:archivo;
    dato:Integer;
begin
    Assign(m,'maestro.data');
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
        Writeln(dato);
    end;
    Close(m);
end;
procedure Un_archivo_que_esta_Ordenado(var m:archivo);
    procedure Leer(var m:archivo;var dato:integer);
    begin
        if (not eof(m)) then
            read(m,dato)
        else
            dato:=vA;
    end;
var
    dato:integer;
    txt:Text;
    actual,total:integer;
begin
    Assign(txt,'texto3.txt');
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
    actual,total,datoD,datoM:integer;
begin
    Reset(m);
    Reset(d);
    Leer(d,datoD);
    while datoD <> vA do
    begin
        total:=0;
        Read(m,datoM);
        while datoM <> datoD do
            Read(m,datoM);
        while datoM = datoD do
        begin
            total:=total+datoD;
            Leer(d,datoD);  
        end;
        Seek(m,FilePos(m)-1);
        Write(m,total);
        Write('Cosa');
    end;
    Close(m);
    Close(d);
end;
var
    m:archivo;
    txt:Text;
    d:archivo;
begin
    //Crear
    Assign(m,'maestro.data');
    Assign(txt,'nrosSinRepe.txt');
    Un_Archivo_Desde_un_Texto(m,txt);
    
    Assign(d,'detalle.data');
    Assign(txt,'texto.txt');
    Un_Archivo_Desde_un_Texto(d,txt);

    Assign(txt,'texto2.txt');
    Un_Texto_Desde_un_Archivo(txt);
    //Imprimir
    Un_archivo_que_esta_Desordenado(m);
    Un_archivo_que_esta_Ordenado(m);
    //Actualizar 
    Un_Archivo_Con_una_constante(m);
    Un_Archivo_desde_otro_archivo(m,d);
    //Imprimir
    Un_archivo_que_esta_Desordenado(m);
    
    
end.