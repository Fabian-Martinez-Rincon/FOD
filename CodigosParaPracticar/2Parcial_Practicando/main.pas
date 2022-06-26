program main;
type
    registro = record
        nro:integer;
        nom:string;
    end;
    archivo = file of integer;
    archivo_registro = file of registro;
procedure Un_Archivo_Desde_Teclado(var a:archivo);
    var
        dato:integer;
    begin
        Rewrite(a);
        ReadLn(dato);
        while dato <> -1 do
        begin
            write(a,dato);
            ReadLn(dato);
        end;
        Close(a);
    end;

procedure LeerRegistro(var reg:registro);
    begin
        WriteLn('nro: '); ReadLn(reg.nro);
        WriteLn('nom: '); ReadLn(reg.nom);
    end;
procedure Un_Archivo_Desde_Teclado_ConRegistros(var ar:archivo_registro);
    var
        reg:registro;
    begin
        Rewrite(ar);
        LeerRegistro(reg);
        while reg.nro <> -1 do
        begin
            write(ar,reg);
            LeerRegistro(reg);
        end;
        Close(ar);
    end;
procedure Un_Archivo_Desde_un_Texto(var a:archivo;var txt:text);
    var
        dato:integer;
    begin
        Rewrite(a);
        Reset(txt);
        while not eof(txt) do
        begin
            Read(txt,dato);
            Write(a,dato);
        end;
        Close(a);
        Reset(txt);
    end;
procedure Un_Texto_Desde_un_Archivo(var a:archivo;var txt_creado:text);
var
    dato:integer;
begin
    Reset(a); Rewrite(txt_creado);
    while not eof(a) do
    begin
        Read(a,dato);
        Writeln(txt_creado,dato);
    end;
    Close(a); Close(txt_creado);
end;
var
    a:archivo;
    ar:archivo_registro;
    txt,txt_creado:text;
begin
    Assign(a,'archivo.data');
    //Un_Archivo_Desde_Teclado(a);
    //Assign(ar,'archivoRegistro.data');
    //Un_Archivo_Desde_Teclado_ConRegistros(ar);
    //Assign(a,'archivo_texto.data');
    //Assign(txt,'archivo_texto.txt');
    //Un_Archivo_Desde_un_Texto(a,txt);
    Assign(txt_creado,'texto_creado.txt');
    Un_Texto_Desde_un_Archivo(a,txt_creado);

end.