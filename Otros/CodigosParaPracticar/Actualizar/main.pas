program main;
type
    archivo = file of integer;
procedure Actualizar(var a:archivo);
var
    dato:Integer;
begin
    Reset(a);
    while not eof (a) do
    begin
        Read(a,dato);
        dato:=dato*2;
        Seek(a,FilePos(a)-1);
        writeln(dato);
        Write(a,dato);
    end;
    Close(a);
end;
var
    a:archivo;
begin
    Assign(a,'archivo.data');
    Actualizar(a);
end.