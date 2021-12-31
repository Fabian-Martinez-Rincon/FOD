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
Program Generar_Archivo;
type 
    archivo = file of integer;    {definición del tipo de dato para el archivo }
var 
    arc_logico: archivo;          {variable que define el nombre lógico del archivo}
    nro: integer;                 {nro será utilizada para obtener la información de teclado}
    arc_fisico: string[12];       {utilizada para obtener el nombre físico del archivo desde teclado}
begin
    write( 'Ingrese el nombre del archivo:' );
    read( arc_fisico );           { se obtiene el nombre del archivo}
    assign( arc_logico, arc_fisico );
    rewrite( arc_logico );        { se crea el archivo }
    read( nro );                  { se obtiene de teclado el primer valor }
    while nro <> 0 do 
    begin
        write( arc_logico, nro ); { se escribe en el archivo cada número }
        read( nro );
    end;
    close( arc_logico );          { se cierra el archivo abierto oportunamente con la instrucción rewrite }
end. 

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
