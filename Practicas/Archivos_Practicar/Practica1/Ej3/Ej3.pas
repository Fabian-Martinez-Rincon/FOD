program Ej3;
const
    vA = 'fin';
type
    cadena20 = string[20];
    empleado = record
        apellido:cadena20;
        nro:integer;
        nombre:cadena20;
        edad:Integer;
        dni:integer;
    end;
    archivo = file of empleado;
procedure leerEmpleado(e:empleado);
begin
    Readln(e.apellido);
    if e.apellido <> vA then
    begin
        ReadLn(e.nro);
        ReadLn(e.nombre);
        ReadLn(e.edad);
        ReadLn(e.dni);

    end;
end;
procedure Crear(var maestro:archivo);
var
    e:empleado;
begin
    Rewrite(maestro);
    leerEmpleado(e);
    while e.apellido <> vA do
    begin
        Write(maestro,e);
        leerEmpleado(e);
    end;
    Close(maestro);
end;
procedure ImprimirEmpleado(var maestro:archivo);
var
    e:empleado;
    nombre:cadena20;
    apellido:cadena20;
begin
    nombre = 'Pepe';
    apellido = 'Argento';
    Reset(maestro);
    while not eof (maestro) do
    begin
        read(maestro,e);
        if (e.nombre = nombre) or (e.apellido = apellido) then
            with e do
                Write(apellido,nro,nombre,edad,dni);
    end;
    Close(maestro);
end;
procedure Imprimir(var maestro:archivo);
var
    e:empleado;
begin
    Reset(maestro);
    while not eof (maestro) do
    begin
        read(maestro,e);
        with e do
            Write(apellido,nro,nombre,edad,dni);
    end;
    Close(maestro);
end;
procedure ImprimirMayores(var maestro:archivo);
var
    e:empleado;
begin
    Reset(maestro);
    while not eof (maestro) do
    begin
        read(maestro,e);
        if (e.edad>70) then
            with e do
                Write(apellido,nro,nombre,edad,dni);
    end;
    Close(maestro);
end;
var
    maestro:archivo;
    opcion:integer;
begin
    Assign(maestro,'maestro.data');
    ReadLn(opcion);

    while opcion <> -1 do
    begin
        WriteLn('1: Crear un archivo');
        WriteLn('2: Imprimir un Empleado');
        WriteLn('3: Imprimir Todo');
        WriteLn('4: Imprimir Mayores de 70 anios');
        case (opcion) of
            1:Crear(maestro);
            2:ImprimirEmpleado(maestro);
            3:Imprimir(maestro);
            4:ImprimirMayores(maestro);
        end;
        ReadLn(opcion);
    end;
    
end.