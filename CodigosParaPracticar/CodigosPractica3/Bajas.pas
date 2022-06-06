program Bajas;
uses Crt;
const
    vA = 9999;
type
    archivo = file of integer;
procedure Imprimir(var m:archivo);
var
    dato:Integer;
begin
    Reset(m);
    while not eof(m) do
    begin
        read(m,dato);
        Write(dato,' ');
    end;
    Close(m);
end;
procedure Leer(var m:archivo;var dato:integer);
begin
    if not eof(m) then
        Read(m,dato)
    else
        dato:=vA;
end;

procedure Lista_Invertida_Baja(var m:archivo;var borrar:Integer);
var
    cabecera:integer;
    dato:integer;
begin
    Reset(m);
    Leer(m,cabecera);
    Leer(m,dato);
    while (dato <> vA) and (dato <> borrar) do Leer(m,dato);
    if (dato = borrar) then begin
        Seek(m,FilePos(m)-1); 
        Write(m,cabecera);  //Remplazo el elemento que tengo que borrar por la cabecera
        Seek(m,0);
        write(m,dato*-1);
    end;
    Close(m);
end;
procedure Copiar(var m,m2:archivo); //Este modulo es solo para poder borrar y no modificar el original
var
    dato:integer;
begin
    Reset(m);
    Rewrite(m2);
    Read(m,dato);
    while not eof(m) do
    begin
        Write(m2,dato);
        Read(m,dato);
    end;
    Close(m);
    Close(m2);
end;
procedure Lista_Invertida_Alta(var m:archivo;alta:integer);
var
    dato:integer;
    cabecera:integer;
begin
    Reset(m);
    Leer(m,cabecera);
    if (cabecera = 0) then //Lo pongo al final
    begin
        seek(m,FileSize(m));
        Write(m,alta);
    end
    else    
        begin
            seek(m,(cabecera*(-1)));
            Read(m,dato);
            Seek(m,0);
            write(m,dato);
            Seek(m,(cabecera*(-1)));
            Write(m,alta);
        end;
    Close(m);
end;

var
    m,m2:archivo;
    nro:Integer;
begin
    //Usamos la lista invertida desde la creacion
    ClrScr;
    Assign(m,'maestro.data');
    Imprimir(m);
    Assign(m2,'maestro2.data');
    Copiar(m,m2);

    Write();
    WriteLn('Lista_Invertida_Baja');
    WriteLn('Ingrese un nro: '); ReadLn(nro);
    while nro>0 do begin //Bajas logicas con la lista invertida
        Lista_Invertida_Baja(m2,nro);
        Imprimir(m2);
        Writeln;
        WriteLn('Ingrese un nro: '); ReadLn(nro);
    end;
    WriteLn;
    WriteLn('Lista_Invertida_Alta');
    WriteLn('Ingrese un nro: '); ReadLn(nro);
    while nro > 0 do begin      //Bajas logicas con la lista invertida
        Lista_Invertida_Alta(m2,nro);
        Imprimir(m2);
        Writeln;
        WriteLn('Ingrese un nro: '); ReadLn(nro);
    end; 
end.