<h1 align="center">📂 Archivos</h1>

Indice
=================

<!--ts-->
*  [Crear](#Crear)
   *  [Un archivo desde Teclado](#Un_Archivo_Desde_Teclado)
   *  [Un archivo desde Teclado 2](#Un_Archivo_Desde_Teclado2)
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
   * [Un Dato desde Teclado](#Un_Dato_desde_Teclado)
*  [Agregar](#Agregar)
   * [Datos a un archivo Desde teclado](#Datos_a_un_archivo_Desde_teclado)
*  [Corte De Control](#Corte_De_Control)
*  [Merge](#Merge)
   *  [De 3 Archivos](#Mege_3_Archivos)
   *  [De 3 Archivos Con Repetición](#Merge_3_Archivos_Con_Repetición)
   *  [De N Archivos Con Repetición](#Merge_N_Archivos_Con_Repetición)
*  [Baja](#Baja)
   * [Un Dato Sabiendo Que Existe](#Un_Dato_Sabiendo_QueExiste)
   * [Un Dato Sin Saber Si Existe](#Un_Dato_Sin_Saber_Si_Existe)
   * [Un Dato Ingresado Desde Teclado](#Un_Dato_Ingresado_Desde_Teclado)
   * [Un Dato Ingresado Desde Teclado 2](#Un_Dato_Ingresado_Desde_Teclado2)
   * [De Datos desde un archivo](#De_Datos_desde_un_archivo)
   * [Baja Fisica Archivo Auxiliar](#Baja_Fisica_Archivo_Auxiliar)
*  [Alta](#Alta)
   * [Un Dato Ingresado Desde Teclado](#Un_Registro_Ingresado_Desde_Teclado)


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
procedure Crear(var archx:archivo);
var
    datox:integer;
begin
    assign(archx,'Archivo.data');
    rewrite(archx); 
    read(datox); 
    while (datox <> 0) do 
    begin
        write(archx,datox); 
        read(datox);
    end;
    close(archx);  
end. 
```

Desde_Teclado2
--------------

```Pas
procedure Crear2(var archx:archDet);
//________________________________________
procedure leer(var datox:registroA);
	begin
	write('Numero de usuario: '); readln(datox.nro);
	if datox.nro <> valoralto then begin
		write('Destinatario: '); readln(datox.cuentaDestino);
		write('Mensaje: '); readln(datox.cuerpoMensaje);
	end;
end;
//________________________________________
var
	datox: registroA;
begin
	assign(archx,'archivo.data');
	rewrite(archx);
	leer(datox);
	while(datox.nro <> valoralto)do begin
		write(archx,datox);
		leer(datox);
	end;
	close(archx);
end;
```

Un_Archivo_Desde_un_Texto
-------------------------

```Pas
procedure Crear(var archx:archivo);
var
	carga: text;
	datox: registroA;
begin
	assign(archx,'archivo.data');
	assign(carga,'archivo.txt');
	rewrite(archx); reset(carga);
	while(not eof(carga))do begin
	    with datox do readln(carga, color);
	    write(archx,datox);
	end;
	close(archx); close(carga);
end;
```

Un_Texto_Desde_un_Archivo
-------------------------
```Pas
procedure CrearTXT(var archx: archivox);
var
	carga:text;
	datox: registrox;
begin
	assign(carga,'archivoDetDia.txt');
	rewrite(carga);
	reset(archx);
	while not eof(archx)do begin
		read(archx,datox);
		with datox do 
            writeln(carga,nroUsuario,' ',cantMailsEnviados);
	end;
	close(archx); close(carga);
end;
```

Imprimir
========

Un_archivo_que_esta_Desordenado
-------------------------------

```Pas
Procedure imprimir(var archx:archivo);
var  
    datox:integer;  
begin
    reset(archx); 
    while not eof(archx) do 
    begin
        read(archx, datox );
        write(datox);           
    end;
    close(log);
end;
```

Un_archivo_que_esta_Ordenado
----------------------------
```Pas
procedure leer(var archx:archivo; var aux:archivoR);
begin
    if(not eof(archx))then 
		read(archx,aux)
    else 
		aux.codigo:=valorAlto;
end;
//__________________________________________
procedure imprimir(var archx:archivo);
var
	datox,actual:archivoR;
    total:Integer;
begin
	assign(archx,'maestro.data');
	reset(archx);
	leer(archx,datox);
	while (datox.codigo <> valoralto) do begin
		actual:= datox;
        total:=0;
        WriteLn('___________');
		writeln('Codigo de Provincia: ', actual.codigo);
		while(actual.codigo = datox.codigo)do 
        begin
            total:=total+datox.votos;
            leer(archx,datox);
		end;
        writeln('Total de votos provinciales: ', total);
	end;
	close(archx);
end;
```

Actualizar
==========

Un_Archivo_Con_una_constante
----------------------------

```Pas
Procedure actualizar(Var archx:archivo); 
var 
    datox: integer;
begin
    Reset(archx); 
    while not eof(archx) do 
    begin
        Read(archx,datox); 
        datox:= datox * 2;    
        Seek(archx,filepos(archx)-1);
        Write(archx,datox); 
    end;
    close(archx);
end;
```

Un_Archivo_desde_otro_archivo
-----------------------------
```Pas
procedure leer(var d:detalle;var datox:registro);
begin
    if (not eof(d))then 
        read(d,datox)
    else 
        datox.codigo := valoralto;
end;
procedure actualizar(var m:maestro;var d:detalle);
var
    datoM,datoD:registro;
begin
    assign (m,'maestro.data'); reset(m);
    assign (d,'detalle.data'); reset(d);
    leer(d,datoD);  
    while (datoD.codigo <> valoralto) do begin
        read(m, datoM);
        while (datoM.codigo <> datoD.codigo) do
            read (m,datoM);
        while (datoM.codigo = datoD.codigo) do 
        begin
            datoM.cant := datoM.cant - datoD.cv;        
	        leer(det1,datoD);          
        end;
        seek (m,filepos(m)-1);
        write(m,datoM);
    end;
End;
```

Un_Archivo_desde_dos_archivos
-----------------------------

```Pas
procedure leer (var archivo: detalle; var datox:detalleR);
begin
    if (not eof(archivo))then 
        read (archivo,datox)
    else 
        datox.nombre := valoralto;
end;
//__________________________________________
procedure minimo (var r1,r2:detalleR;var d1,d2:detalle; var min:detalleR);
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
procedure actualizar(var m:maestro;var d1,d2:detalle);
Var   
    datox: maestroR;  
    min,r1,r2:detalleR; 
begin
    assign (m, 'maestro.data');    reset (m); 
    assign (d1, 'detalle1.data');  reset (d1);  leer(d1, r1); 
    assign (d2, 'detalle2.data');  reset (d2);  leer(d2, r2); 
    minimo(r1, r2, d1, d2,min);
    while (min.nombre <> valoralto) do  
    begin
        read(m,datox);
        while (datox.nombre <> min.nombre) do read(m,datox);
        while (datox.nombre = min.nombre ) do 
        begin
            datox.cantidad:=datox.cantidad + min.cantidad;
            minimo(r1, r2, d1, d2,min);
        end;
        seek (m, filepos(m)-1);
        write(m,datox);
    end;
    Close(m); Close(d1); Close(d2);
end;
```

Un_Archivo_desde_n_archivos
-----------------------------

```Pas
procedure minimo (var r1,r2,r3:registroR;var d1,d2,d3:detalle; var min:registroR);
begin
    if (r1.codigo<=r2.codigo) and (r1.codigo<=r3.codigo) then 
    begin
        min := r1;  leer(d1,r1)
    end
    else if (r2.codigo<=r3.codigo) then 
    begin
        min := r2; leer(d2,r2)
    end
    else 
    begin
        min := r3;leer(d3,r3)
    end;
end;
//_______________________________________________________
procedure leer (var archivo: detalle; var datox:registroR);
begin
    if (not eof(archivo))then 
        read (archivo,datox)
    else 
        datox.codigo := valoralto;
end;
//_______________________________________________________
procedure actualizar(var m:maestro;var d1,d2,d3:detalle);
Var   
    datox: maestroR;  
    min, r1, r2,r3: registroR;
    m: maestro;   
    d1,d2,d3: detalle;
begin
    assign (m, 'maestro.data');    reset (m); 
    assign (d1, 'detalle1.data');  reset (d1);  leer(d1, r1); 
    assign (d2, 'detalle2.data');  reset (d2);  leer(d2, r2); 
    assign (d3, 'detalle3.data');  reset (d3);  leer(d3, r3);
    minimo(r1, r2,r3,d1,d2,d3,min);
    while (min.codigo <> valoralto) do  
    begin
        read(m,datox);
        while (datox.codigo <> min.codigo) do 
            read(m,datox);
        while (datox.codigo = min.codigo ) do 
        begin
            datox.cant:=datox.cant - min.cantvendida;
            minimo(r1,r2,r3,d1,d2,d3,min);
        end;
        seek (m, filepos(m)-1);
        write(m,datox);
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
procedure merge(var m:maestro;var d1,d2,d3:archivo);
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
    assign (d1, 'd1.data'); reset (d1); leer(d1, regd1); 
    assign (d2, 'd2.data'); reset (d2); leer(d2, regd2);
    assign (d3, 'd3.data'); reset (d3); leer(d3, regd3);
    assign (maestro, 'maestro'); rewrite (maestro);
    minimo(regd1, regd2, regd3, min);
    while (min.nombre <> valoralto) do
    begin
        write (maestro,min);
        minimo(regd1,regd2,regd3,min);
    end;
    Close(d1); Close(d2); Close(d3);
    Close(maestro);
end;
```
Con_3_Archivos_Con_Repetición
-----------------------------
```Pas
procedure merge(var m:maestro;var d1,d2,d3:detalle);
var 
    min, r1, r2, r3: detalleR;
    datoM: maestroR;
begin
    assign (d1, 'd1.data'); reset (d1); leer (d1, r1);
    assign (d2, 'd2.data'); reset (d2); leer (d2, r2);  
    assign (d3, 'd3.data'); reset (d3); leer (d3, r3);
    assign (m, 'maestro.data'); rewrite (m);
    minimo (r1, r2, r3,min);
    while (min.codigo <> valoralto) do 
    begin
        datoM.codigo := min.codigo;
        datoM.total := 0;
        while (datoM.codigo = min.codigo ) do begin
            datoM.total := datoM.total+ min.montoVenta;
            minimo (r1, r2, r3, min);
        end;
        write(m, datoM);
    end;
End;
```
Con_N_Archivos_Con_Repetición
-----------------------------
```Pas
vdetalle=array[1..100] of file of detalleR;
vdetalleR=array[1..100] of detalleR;
//_______________________________________________________
procedure leer (var archivo:detalle; var dato:detalleR);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.codigo := valoralto;
end;
//_______________________________________________________
procedure minimo (var vdr: vdetalleR; var min:detalleR; var vd:vdetalle);
    var i: integer;
    begin
      { busco el mínimo elemento del 
        vector vdr en el campo codigo,
        supongamos que es el índice i }
      min = vdr[i];
      leer( vd[i], vdr[i];
    end; 
//_______________________________________________________
procedure merge(var m:maestro; var vd:vdetalle;var vdr:vdetalleR);
var 
    min: detalleR;
    dato: maestroR;
    i,n: integer;
begin
    Read(n)
    for i:= 1 to n do 
    begin
        assign (vd[i], 'det'+i); 
        { ojo lo anterior es incompatible en tipos}    
        reset( vd[i] );
        leer( vd[i], vdr[i] );
    end;
    assign (m, 'maestro'); rewrite (m);
    minimo (vdr, min, vd);
    while (min.codigo <> valoralto) do 
    begin
        dato.codigo := min.codigo;
        dato.total := 0;
        while (dato.codigo = min.codigo ) do 
        begin
            dato.total := dato.total+ 
            min.montoVenta;
            minimo (regd1, regd2, regd3, min);
        end;
        write(m, dato);
    end;    
end.
```
Baja
====

Un_Dato_Sabiendo_Que_Existe
---------------------------
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
Un_Dato_Sin_Saber_Si_Existe
---------------------------
```Pas
procedure leer (var archivo:maestro; var dato:empleado);
begin
    if (not eof( archivo ))then 
        read (archivo, dato)
    else 
        dato.codigo := valoralto;
end;
procedure bajaLogica(var x:maestro);
var
    datox:empleado;
begin 
	assign(x, 'maestro.data');
	reset(x);
	leer(x, datox);
    while datox.codigo <> valorAlto do
    begin
        if (datox.dni<800) then
        begin
            datox.apellido:='*'+datox.apellido;
            seek(x, filepos(x)-1);
            write(x, datox);
        end;
        leer(x, datox);        
    end;
	close(x);
end;
```

Un_Dato_Ingresado_Desde_Teclado
-------------------------------
```Pas
procedure bajaLogica(var x:archivo);
var
    datox:empleado;
    ultimoR:empleado;
    nro:integer;
begin 
	assign(x, 'archivo.data');
	reset(x);
    Seek(x,FileSize(x)-1); {Guardo el ultimo Registro}
	leer(x,datox);
    reset(x); {Abro el archivo desde el princio, no se si es buena practica, despues me fijo en el libro}
    
    leer(x,datox);
    WriteLn('Ingrese el nro del empleado que quiere eliminar: ');
    ReadLn(nro);
	while (datox.nro <> nro) and (datox.nro <> valorAlto) do	leer(x, datox);
    if (datox.nro <> valorAlto) then
    begin
	    seek(x, filepos(x)-1);
	    write(x, datox);
        seek(x, FileSize(x)-1);
	    Truncate(x);
    end
    else
        WriteLn('No se encontro el nro del empleado');
	close(x);
end;
```
Un_Dato_Ingresado_Desde_Teclado2
--------------------------------
```Pas
procedure baja(var arch:maestro);
var 
    n,actual:novela;
    num,pos:integer;
begin
    reset(arch);
    read(arch,actual);
    writeln('Ingrese el codigo de la novela a eliminar:'); 
    readln(num);
    leer(arch,n);
    while (n.codigo <> num) do	    //busco hasta encontrar el numero
		leer(arch,n);
    if n.codigo = num then begin //si lo encuentro guardo la posicion
        pos:=filepos(arch)-1; //guardo la posicion de la baja
        n:=actual;
        seek(arch,pos); 
        write(arch,n); //sobreescribo la baja con los datos de cabecera
        actual.codigo:=-pos;

        seek(arch,0); //me paro en el principio de la lista
        write(arch,actual);
    end
    else 
        writeln('No se encuentra el codigo.');
    close(arch);
end;
```

De_Datos_desde_un_archivo
-------------------------
```Pas
procedure bajaLogica(var m:maestro;var d:detalle);
var
    datoM:prenda;
    datoD:Integer;
begin
    Reset(m);       Reset(d);
    LeerD(d,datoD);  
    while datoD <> valorAlto do
    begin
        LeerM(m,datoM); //Leo lo que tengo en la cabecera
        while datoM.cod_prenda <> valorAlto do 
        begin
            if (datoM.cod_prenda = datoD) then
            begin
                datoM.stock:=-1;
                Seek(m,FilePos(m)-1); Write(m,datoM);
            end;
            LeerM(m,datoM);
        end;
        LeerD(d,datoD); 
    end;
    Close(m); Close(d);
end;
```

Baja_Fisica_Archivo_Auxiliar
----------------------------
```Pas
procedure bajaFisica(var m,mAux:maestro);
var
    datoM:prenda;
begin
    Reset(m); Rewrite(mAux);
    LeerM(m,datoM);
    while datoM.cod_prenda <> valorAlto do
    begin
        if (datoM.cod_prenda = -1) then
            Write(mAux,datoM);
        LeerM(m,datoM);
    end;
    Close(m); Close(mAux);
    Erase(m); //Elimino el archivo maestro
    Rename(mAux,'maestro');
end;
```

Alta
====
Un_Registro_Ingresado_Desde_Teclado
-------------------------------
```Pas
procedure Alta(var m:maestro);
var
    cabecera,n:novela;
begin
    Reset(m);
    leer(m,cabecera);
    LeerNovela(n);
    if (cabecera.codigo = 0) then
    begin //Si tengo la cabecera vacia agrego el elemento al final
        Seek(m,FileSize(m));
        Write(m,n);
    end
    else 
        begin
            //Ej si el resultado es -5 voy a la posicion 5
            //(La cabecera siempre tiene que ser un nro negativo o 0)
            Seek(m,(cabecera.codigo*(-1)));
             //Una vez que me ubico, en el lugar libre, remplazo el elemento
            read(m,cabecera);
            Seek(m,FilePos(m)-1);
            Write(m,n);
            Seek(m,0);
            Write(m,cabecera);
            //Guardo el elemento que habia en la posicion 5
        end;
    Close(m);
end;
```
