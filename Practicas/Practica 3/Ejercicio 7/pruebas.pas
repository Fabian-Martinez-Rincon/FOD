program pruebas;
procedure probar(var ultimo:Integer);
begin
    WriteLn('cosa: ', ultimo-1);
end;
var
    u:integer;
begin
    u:=5;
    probar(u);
    WriteLn(u);
end.