program main;
type
    archivo = file of integer;
procedure Agregar(var a:archivo; dato:Integer);
begin
    Reset(a);
    Seek(a,FileSize(a));
    write(a,dato);
    Close(a);
end;
var
    a:archivo;
    dato:integer;
begin
    Assign(a,'archivo.data');
    dato:=111;
    Agregar(a,dato);
end.