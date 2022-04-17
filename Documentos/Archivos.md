<h1 align="center">📂 Archivos</h1>

Indice
=================

<!--ts-->
*  [Crear](#Crear)
   *  [Un archivo desde Teclado](#Un_Archivo_Desde_Teclado)
   *  [Un archivo desde un Texto](#Un_Archivo_Desde_un_Texto)
   *  [Un Texto desde un archivo](#Un_Texto_Desde_un_Archivo)
*  [Imprimir](#Imprimir)
   * [Un archivo que esta Desordenado](#Un_archivo_que_esta_Desordenado)
   * [Un archivo que esta Ordenado](#Un_archivo_que_esta_Ordenado)
*  [Actualizar](#Actualizar)
   * [Un Archivo Con una constante](#Un_Archivo_Con_una_constante)
   * [Un Archivo desde otro archivo](#Un_Archivo_desde_otro_archivo)
   * [Un Archivo desde dos archivos](#Un_Archivo_desde_dos_archivos)
   * [Un Archivo desde N archivos](#Un_Archivo_desde_N_archivos)
*  [Agregar](#Agregar)
   * [Datos a un archivo Desde teclado]()
*  [Corte De Control](#Corte_De_Control)
*  [Merge](#Merge)
   *  [Con 3 Archivos](#Mege_3_Archivos)
   *  [Con 3 Archivos Con Repetición](#Merge_3_Archivos_Con_Repetición)
   *  [Con N Archivos Con Repetición](#Merge_N_Archivos_Con_Repetición)
*  [Eliminar](#Eliminar)
   * [Baja Logica](#Baja_Logica)



Declarar
========
```Pas
type 
    numero = file of integer;    
Var 
    arch_num: numero;
begin
    assign (arch_num, 'pepe.dat');
End.
```


Crear
=====

Un_Archivo_Desde_Teclado
------------------------

```Pas
procedure Crear(var m:maestro);
var
    nro:integer;
begin
    assign(m,'Archivo.data');
    rewrite(m); 
    read(nro); 
    while (nro <> 0) do 
    begin
        write(m,nro); 
        read(nro);
    end;
    close(m);  
end. 
```

Un_Archivo_Desde_un_Texto
-------------------------

```Pas
procedure CrearConTexto(var m:maestro);
var
	carga: text;
	a: articulo;
begin
	assign(m,'maestro.data');
	assign(carga,'Articulos.txt');
	rewrite(m); reset(carga);
	while(not eof(carga))do begin
	with a do readln(carga, color);
	write(m,a);
	end;
	close(m); close(carga);
end;
```

Un_Texto_Desde_un_Archivo
-------------------------
```Pas
procedure exportarTxt(var x: archivox);
var
	carga:text;
	datox: registrox;
begin
	assign(carga,'archivoDetDia.txt');
	rewrite(carga);
	reset(x);
	while not eof(x)do begin
		read(x,datox);
		with datox do writeln(carga,nroUsuario,' ',cantMailsEnviados);
	end;
	close(x); close(carga);
end;
```

Desde_Teclado
-------------

```Pas
	
procedure importarDetalle(var det:archDet);
procedure leerDatos(var d:detalle);
	begin
	write('Numero de usuario: '); readln(d.nroUsuario);
	if d.nroUsuario <> valoralto then begin
		write('Destinatario: '); readln(d.cuentaDestino);
		write('Mensaje: '); readln(d.cuerpoMensaje);
	end;
end;
  
var
	d: detalle;
begin
	assign(det,'detalle13.data');
	rewrite(det);
	writeln('Escriba el nro 9999 para terminar la carga.');
	leerDatos(d);
	while(d.nroUsuario <> valoralto)do begin
		write(det,d);
		leerDatos(d);
	end;
	close(det);
end;
```


Imprimir
========

Un_archivo_que_esta_Desordenado
-------------------------------

```Pas
Procedure Imprimir(var m:maestro);
var  
    nro:integer;  
begin
    reset(m); 
    while not eof(m) do 
    begin
        read(m, nro );
        write(nro);           
    end;
    close(log);
end;
```

Un_archivo_que_esta_Ordenado
----------------------------
```Pas
procedure leer(var m:maestro; var aux:mesas);
begin
    if(not eof(m))then 
		read(m,aux)
    else 
		aux.codigoP:=valorAlto;
end;
//__________________________________________
procedure listado(var m:maestro);
var
	x,actual:mesas;
    totalP:Integer;
begin
	assign(m,'maestro.data');
	reset(m);
	leer(m,x);
	while (x.codigoP <> valoralto) do begin
		actual:= x;
        totalP:=0;
        WriteLn('___________');
		writeln('Codigo de Provincia: ', actual.codigoP);
		while(actual.codigoP = x.codigoP)do 
        begin
            totalP:=totalP+x.votos;
            leer(m,x);
		end;
        writeln('Total de votos provinciales: ', totalP);
	end;
	close(m);
end;
```

Actualizar
==========

Un_Archivo_Con_una_constante
----------------------------

```Pas
Procedure actualizar(Var log:archivo); 
var 
    nro: integer;
begin
    Reset(log); 
    while not eof(log) do 
    begin
        Read(log,nro); 
        nro:= nro * 2;    
        Seek(log,filepos(log)-1);
        Write(log,nro); 
    end;
    close(log);
end;
```

Un_Archivo_desde_otro_archivo
-----------------------------
```Pas
procedure leer (var d:detalle;var x:registro);
begin
    if (not eof(d))then 
        read (d,x)
    else 
        x.cod := valoralto;
end;
procedure Maestro_Detalle(var m:maestro;var d:detalle);
var
    datoM,datoD:registro;
begin
    assign (m,'maestro.data'); reset (m);
    assign (d,'detalle.data'); reset(d);
    leer(d,datoD);  
    while (datoD.cod <> valoralto) do begin
        read(m, datoM);
        while (datoM.cod <> datoD.cod) do
            read (m,datoM);
        while (datoM.cod = datoD.cod) do 
        begin
            datoM.cant := datoM.cant - datoD.cv;        
	        leer(det1,datoD);          
        end;
        seek (m, filepos(m)-1);
        write(m,datoM);
    end;
End;
```

Un_Archivo_desde_dos_archivos
-----------------------------

```Pas
procedure leer (var archivo: detalle; var x:detalleR);
begin
    if (not eof(archivo))then 
        read (archivo,x)
    else 
        x.nombre := valoralto;
end;
//__________________________________________
procedure minimo (var r1,r2:detalleR;var d1,d2:detalle;
var min:detalleR);
begin
    if (r1.nombre<=r2.nombre)  then 
    begin
        min := r1;  leer(d1,r1)
    end
    else 
    begin
        min := r2; leer(d2,r2)
    end
end;
//_______________________________________________________
procedure actualizarMaestro(var m:maestro;var d1,d2:detalle);
Var   
    x: maestroR;  
    min, r1, r2: detalleR; 
begin
    assign (m, 'maestro.data');    reset (m); 
    assign (d1, 'detalle1.data');  reset (d1);  leer(d1, r1); 
    assign (d2, 'detalle2.data');  reset (d2);  leer(d2, r2); 
    minimo(r1, r2, d1, d2,min);
    while (min.nombre <> valoralto) do  
    begin
        read(m,x);
        while (x.nombre <> min.nombre) do 
            read(m,x);
        while (x.nombre = min.nombre ) do 
        begin
            x.cantidadA:=x.cantidadA + min.cantidadA;
            x.cantidadE:=x.cantidadE + min.cantidadE;
            minimo(r1, r2, d1, d2,min);
        end;
        seek (m, filepos(m)-1);
        write(m,x);
    end;
    Close(m);
    Close(d1);
    Close(d2);
end;
```

Un_Archivo_desde_n_archivos
-----------------------------

```Pas
procedure minimo (var r1,r2,r3:registro; var min:registro);
begin
    if (r1.cod<=r2.cod) and (r1.cod<=r3.cod) then 
    begin
        min := r1;  leer(d1,r1)
    end
    else if (r2.cod<=r3.cod) then 
    begin
        min := r2; leer(d2,r2)
    end
    else 
    begin
        min := r3;leer(d3,r3)
    end;
end;
//_______________________________________________________
procedure leer (var archivo: detalle; var x:registro);
begin
    if (not eof(archivo))then 
        read (archivo,x)
    else 
        x.cod := valoralto;
end;
//_______________________________________________________
procedure Maestro_NDetalles(var m:maestro;var d1,d2,d3:detalle);
Var   
    x: prod;  
    min, r1, r2,r3: registro;
    m: maestro;   
    d1,d2,d3: detalle;
begin
    assign (m, 'maestro.data');    reset (m); 
    assign (d1, 'detalle1.data');  reset (d1);  leer(d1, r1); 
    assign (d2, 'detalle2.data');  reset (d2);  leer(d2, r2); 
    assign (d3, 'detalle3.data');  reset (d3);  leer(d3, r3);
    minimo(r1, r2, r3, min);
    while (min.cod <> valoralto) do  
    begin
        read(m,x);
        while (x.cod <> min.cod) do 
            read(m,x);
        while (x.cod = min.cod ) do 
        begin
            x.cant:=x.cant - min.cantvendida;
            minimo(r1, r2, r3, min);
        end;
        seek (m, filepos(m)-1);
        write(m,x);
    end;
end;
```

Agregar
=============

Datos_a_un_archivo_Desde_teclado
--------------------------------

```Pas
Procedure Agregar(var log:archivo); 
var 
    nro: integer;
begin
    reset(log); 
    seek(log,filesize(nro)); 
    read(nro); 
    while (nro <> 10) do 
    begin
        write(log,nro);     
        read(nro) 
    end;
    close(log);
end;
```

Corte_De_Control
================
```Pas
procedure leer( var archivo: detalle; var dato: registroD);
begin
    if (not(EOF(archivo))) then
        read (archivo, dato)
    else
        dato.cod := valoralto;
end;
procedure CorteDeControl(var m:maestro; var d:detalle);
var
    datoM: registroM;
    datoD: registroD;
    total: integer; actual: integer;
begin
    assign(m, 'maestro'); reset(m); read(m, datoM);
    assign(d, 'detalle'); reset(d); leer(d, datoD);
    while (datoD.cod <> valoralto) do begin
        actual := datoD.cod;
        total := 0;
        while (actual = datoD.cod) do begin
            total := total + datoD.cant_vendida;
            leer(d, datoD);
        end;
        while (datoM.cod <> actual) do
            read (m, datoM);
        datoM.cant := datoM.cant - total;
        seek(m, filepos(m)-1);
        write(m, datoM);
        if (not(EOF(m))) then
            read(m, datoM);
    end;
    close(d);
    close(m);
end;
```
Merge
=====

Con_3_Archivos
---------------
```Pas
program union_de_archivos;
const 
    valoralto = 'zzzz';
type 
    str30 = string[30];
    str10 = string[10];
    alumno = record
        nombre: str30;                
        dni: str10;                   
        direccion: str30;             
        carrera: str10;               
    end;
    detalle = file of alumno;       
    var min,regd1,regd2,regd3: alumno;
    det1,det2,det3,maestro : detalle;
//_______________________________________________________
procedure leer (var archivo:detalle; var dato:alumno);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.nombre := valoralto;
end;
//_______________________________________________________
begin
    assign (det1, 'det1'); assign (det2, 'det2'); assign (det3, 'det3');
    assign (maestro, 'maestro');
    rewrite (maestro);
    reset (det1);    
    reset (det2);    
    reset (det3);
    leer(det1, regd1); 
    leer(det2, regd2); 
    leer(det3, regd3);
    minimo(regd1, regd2, regd3, min);
    while (min.nombre <> valoralto) do
    begin
        write (maestro,min);
        minimo(regd1,regd2,regd3,min);
    end;
    close (maestro);
end.
```
Con_3_Archivos_Con_Repetición
-----------------------------
```Pas
program union_de_archivos_II;
const 
    valoralto = '9999';
type 
    str4 = string[4];
    str10 = string[10];
    vendedor = record
        cod: str4;               
        producto: str10;         
        montoVenta: real;        
    end;
    ventas = record
        cod: str4;                
        total: real;              
    end;
    detalle = file of vendedor; 
    maestro = file of ventas;   
var 
    min, regd1, regd2, regd3: vendedor;
    det1, det2, det3: detalle;
    mae1: maestro;
    regm: ventas;
    aux: str4;
begin
    assign (det1, 'det1'); 
    assign (det2, 'det2'); 
    assign (det3, 'det3');
    assign (mae1, 'maestro');
    reset (det1);
    reset (det2);
    reset (det3);
    rewrite (mae1);
    
    leer (det1, regd1);     
    leer (det2, regd2);     
    leer (det3, regd3);
    minimo (regd1, regd2, regd3,min);
    
    while (min.cod <> valoralto) do 
    begin
        regm.cod := min.cod;
        regm.total := 0;
        while (regm.cod = min.cod ) do begin
            regm.total := regm.total+ min.montoVenta;
            minimo (regd1, regd2, regd3, min);
        end;
        write(mae1, regm);
    end;
End.
```
Con_N_Archivos_Con_Repetición
-----------------------------
```Pas
program union_de_archivos_III;
const 
    valoralto = '9999';
type 
    vendedor = record
        cod: string[4];               
        producto: string[10];         
        montoVenta: real;        
    end;
    ventas = record
        cod: string[4];                
        total: real;              
    end;
    maestro = file of ventas;   
    arc_detalle=array[1..100] of file of vendedor;
    reg_detalle=array[1..100] of vendedor;
//_______________________________________________________
procedure leer (var archivo:detalle; var dato:vendedor);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.cod := valoralto;
end;
//_______________________________________________________
procedure minimo (var reg_det: reg_detalle; var min:vendedor; var deta:arc_detalle);
    var i: integer;
    begin
      { busco el mínimo elemento del 
        vector reg_det en el campo cod,
        supongamos que es el índice i }
      min = reg_det[i];
      leer( deta[i], reg_det[i];
    end; 
//_______________________________________________________
var 
    min: vendedor;
    deta: arc_detalle;
    reg_det: reg_detalle;
    mae1: maestro;
    regm: ventas;
    i,n: integer;
begin
    Read(n)
    for i:= 1 to n do 
    begin
        assign (deta[i], 'det'+i); 
        { ojo lo anterior es incompatible en tipos}    
        reset( deta[i] );
        leer( deta[i], reg_det[i] );
    end;
    assign (mae1, 'maestro'); rewrite (mae1);
    minimo (reg_det, min, deta);
    while (min.cod <> valoralto) do 
    begin
        regm.cod := min.cod;
        regm.total := 0;
        while (regm.cod = min.cod ) do 
        begin
            regm.total := regm.total+ 
            min.montoVenta;
            minimo (regd1, regd2, regd3, min);
        end;
        write(mae1, regm);
    end;    
end.
```

Eliminar
========
Baja_Logica
-----------
```Pas
{se sabe que existe Carlos Garcia}
procedure bajaLogica(var x:archivox);
var
    datox:archivoxR;
begin 
	assign(x, 'x.data');
	reset(x);
	leer(x, datox);
	while (datox.nombre <> 'Carlos Garcia') do	leer(x, datox);
	datox.nombre := '***';	
	seek(x, filepos(x)-1);
	write(x, datox);
	close(x);
end.
```