program main;
const
    vA =  9999;
type
    archivo = file of integer;
procedure Leer(var a:archivo;var dato:integer);
    begin
        if not eof (a) then
            Read(a,dato)
        else
            dato:=vA;
    end;
procedure Un_archivo_que_esta_Desordenado(var a:archivo);
    var
        dato:integer;
    begin
        Reset(a);
        Leer(a,dato);
        while dato <> vA do
        begin
            Writeln(dato);
            Leer(a,dato);
        end;
        Close(a);
    end;
procedure Un_archivo_que_esta_Ordenado(var a:archivo);
var
    dato,actual,total:integer;
begin
    Reset(a);
    total:=0;
    Leer(a,dato);
    while dato <> vA do
    begin
        actual:=dato;
        while actual = dato do
        begin
            total:=total+dato;
            Leer(a,dato);
        end;
    end;
    WriteLn('total: ',total);
    Close(a);
end;
var
    a:archivo;
begin
    Assign(a,'archivo.data');
    Un_archivo_que_esta_Desordenado(a);
    Un_archivo_que_esta_Ordenado(a);
end.