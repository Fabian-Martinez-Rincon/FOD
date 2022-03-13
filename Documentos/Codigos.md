Indice
=================

<!--ts-->
   * [Archivos](#Archivos)
     *  [Crear](#Crear)
     *  [Imprimir](#Imprimir)
     *  [Actualizar](#Actualizar)


Archivos
========

Crear
-----

```Pas
procedure CrearArchivo(var arch_logico:archivo;var arch_fisico:cadena20);
var
    p:persona;
begin
    writeln( 'Ingrese el nombre del archivo:' );
    Readln( arch_fisico );          
    assign( arch_logico, arch_fisico );
    rewrite( arch_logico );        
    readln(x);                
    while x <> 0 do          
    begin
        write( arch_logico, x); 
        readln(x);
    end;
    close( arch_logico ); 
end;

```

Imprimir
---------
```Pas
procedure ImprimirArchivo(var arch_logico:archivo);
var
    x:integer;
begin
    reset(arch_logico); 
    while(not eof(arch_logico)) do begin
		read(arch_logico, x);
		WriteLn('x : ',x);
        WriteLn('__________');
    end;
    close(arch_logico);
end;

```
Actualizar
----------
```Pas
procedure Actualizar(var arch_logico:archivo);
var
    x:Integer;
    actual:Integer;
    Encontro:Boolean;
begin
    reset(arch_logico);
    WriteLn('Ingrese un nro para remplazarlo: ');
    ReadLn(x);
    Encontro:=false;
    while(not eof(arch_logico))and(not Encontro) do 
    begin
        read(arch_logico, actual);
        if(actual = x) then Encontro:=true;
    end;
    if Encontro then
    begin
        writeln('Nro de Remplazo: '); readln(x);
        seek(arch_logico, filepos(arch_logico)-1);
        write(arch_logico, x);
    end   
    else
        WriteLn('No existe el nro');
end;
```
