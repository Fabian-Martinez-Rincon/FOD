Indice
=================

<!--ts-->
   * [Archivos](#Archivos)
     *  [Crear](#Crear)
     *  [Recorrido](#Recorrido)
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

Recorrido
---------
```Pas
Procedure Recorrido(var arc_logico: archivo );
var  
    nro: integer;                 { para leer elemento del archivo}
begin
    reset( arc_logico );          {archivo ya creado, para operar debe abrirse como de lect/escr} 
    while not eof( arc_logico) do begin
        read( arc_logico, nro );  {se obtiene elemento desde archivo }
        write( nro );             {se presenta cada valor en pantalla}
    end;
    close( arc_logico );
end;

```
Actualizar
----------
```Pas
Procedure actualizar (Var archi:archivo); 
var 
    E: Integer;
begin
    Reset( archi ); 
    while not eof( archi ) do 
    begin
        Read( archi, E); 
        E:=E * 2;    
        Seek( archi,  filepos(archi) -1 );
        Write( archi, E ); 
    end;
    close( archi );
end;
```
