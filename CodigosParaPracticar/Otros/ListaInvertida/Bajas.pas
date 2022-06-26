program BajaFisica;
uses Crt;
const
    vA = 9999;
type
    archivo = file of integer;
procedure Crear(var m:archivo);
var
    dato:integer;
begin
    Rewrite(m);
    Write(m,0); //Agregamos el 0 a la cabecera 
    ReadLn(dato);
    while dato <> 0 do
    begin
        Write(m,dato);
        ReadLn(dato);  
    end;
    Close(m);
end;
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
procedure BajaFisica(var m,n:archivo; nro:Integer);
var
    dato:integer;
begin
    Reset(m);
    Rewrite(n);
    Leer(m,dato);
    while (dato <> vA)and (dato <> nro) do 
    begin
        write(n,dato); 
        Leer(m,dato);
    end;
    Leer(m,dato);
    while (dato <> vA) and (dato <> nro) do 
    begin
        write(n,dato); 
        Leer(m,dato);
    end;
    Close(m);
    Close(n);
end;
procedure Lista_Invertida(var m:archivo;var borrar:Integer);
var
    cabecera:integer;
    dato:integer;
    posBorrar:integer;
begin
    Reset(m);
    Leer(m,cabecera);
    Leer(m,dato);
    while (dato <> vA) and (dato <> borrar) do Leer(m,dato);
    if (dato = borrar) then begin
        posBorrar:=(FilePos(m)-1);
        Seek(m,posBorrar);
        Write(m,cabecera);
        Seek(m,0);
        dato:=dato*-1;
        write(m,dato);
    end;
    Close(m);
end;
procedure Copiar(var m,m2:archivo);
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
var
    n,m,m2:archivo;
    borrar:Integer;
begin
    //Usamos la lista invertida desde la creacion
    ClrScr;
    Assign(m,'maestro.data');
    //Crear(m);
    Imprimir(m);
    Assign(n,'nuevo.data');
    BajaFisica(m,n,6); //Para probar una baja fisica
    Writeln;
    Imprimir(n);
    WriteLn;

    Assign(m2,'maestro2.data');
    Copiar(m,m2);

    repeat      //Bajas logicas con la lista invertida
        WriteLn();
        WriteLn('Ingrese un nro: ');
        ReadLn(borrar);
        Lista_Invertida(m2,borrar);
        Imprimir(m2);
    until borrar < 0

end.