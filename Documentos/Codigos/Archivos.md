<h1 align="center">📂 Archivos</h1>

Indice
=================

<!--ts-->

- [Declarar](#declarar)
- [Crear](#crear) 
  - [Un_Archivo_Desde_Teclado](#un_archivo_desde_teclado)
  - [Un_Archivo_Desde_Teclado_ConRegistros](#un_archivo_desde_teclado_conregistros)
  - [Un_Archivo_Desde_un_Texto](#un_archivo_desde_un_texto)
  - [Un_Texto_Desde_un_Archivo](#un_texto_desde_un_archivo)
- [Imprimir](#imprimir) 
  - [Un_archivo_que_esta_Desordenado](#un_archivo_que_esta_desordenado)
  - [Un_archivo_que_esta_Ordenado](#un_archivo_que_esta_ordenado)
- [Actualizar](#actualizar)
- [Agregar](#agregar) 
- [Corte_De_Control](#corte_de_control) 
- [Merge (N Detalles)](#merge)
    - [Crear Maestro](#Crear_Maestro)
    - [Actualizar Maestro](#Actualizar_Maestro)
- [Baja](#baja)
  - [Un_Dato_Sabiendo_Que_Existe](#un_dato_sabiendo_que_existe)
  - [Un_Dato_Sin_Saber_Si_Existe](#un_dato_sin_saber_si_existe)
  - [Un_Dato_Ingresado_Desde_Teclado](#un_dato_ingresado_desde_teclado)
  - [Un_Dato_Ingresado_Desde_Teclado2](#un_dato_ingresado_desde_teclado2)
  - [De_Datos_desde_un_archivo](#de_datos_desde_un_archivo)
  - [Un_Dato_Ingresado_Desde_Teclado3](#un_dato_ingresado_desde_teclado3)
- [Baja_Fisica](#baja_fisica)           
  - [Con_Archivo_Auxiliar](#con_archivo_auxiliar)
  - [Con_Datos_Desde_Teclado](#con_datos_desde_teclado)
- [Alta](#alta)
  - [Un_Registro_Ingresado_Desde_Teclado](#un_registro_ingresado_desde_teclado)

- [Codigos que no usamos](#Codigos_que_no_usamos)

Declarar
========
```Pas
type 
    archivo = file of integer;    
Var 
    m: archivo;
begin
    assign (m, 'maestro.data');
End.
```

## Se asume que los assing(archivo, 'nombre') se encuentran fuera del modulo

Crear
=====

Un_Archivo_Desde_Teclado
------------------------

```Pas
procedure Crear(var m:archivo);
var
    dato:integer;
begin
    rewrite(m); 
    read(dato); 
    while (dato <> 0) do 
    begin
        write(m,dato); 
        read(dato);
    end;
    close(m);  
end;
```

Un_Archivo_Desde_Teclado_ConRegistros
-------------------------------------

```Pas
procedure leerRegistro(var dato:registro);
begin
	write('Numero de usuario: '); readln(dato.nro);
	if dato.nro <> vA then begin
		write('Destinatario: '); readln(dato.cuentaDestino);
		write('Mensaje: '); readln(dato.cuerpoMensaje);
	end;
end;
//________________________________________
procedure Crear(var m:archivo);
var
	dato: registro;
begin
	rewrite(m);
	leerRegistro(dato);
	while(dato.nro <> vA)do begin
		write(m,dato);
		leerRegistro(dato);
	end;
	close(m);
end;
```

Un_Archivo_Desde_un_Texto
-------------------------

```Pas
procedure Crear(var m:archivo;var txt:text);
var
	dato: registroM;
begin
    reset(txt);
    rewrite(m);
	while(not eof(txt))do begin
	    with dato do 
            read(txt, color);
	    write(m,dato);
	end;
	close(m); 
    close(txt);
end;
```

Un_Texto_Desde_un_Archivo
-------------------------
```Pas
procedure CrearTXT(var m: archivoM;var txt:text);
var
	dato: registroM;
begin
	rewrite(txt);
	reset(m);
	while not eof(m)do 
    begin
		read(m,dato);
		with dato do 
            writeln(txt,nroUsuario,' ',cantMailsEnviados);
	end;
	close(m); 
    close(txt);
end;
```

Imprimir
========

Un_archivo_que_esta_Desordenado
-------------------------------

```Pas
Procedure imprimir(var m:archivo);
var  
    dato:integer;  
begin
    reset(m); 
    while not eof(m) do 
    begin
        read(m, dato );
        write(dato);           
    end;
    close(m);
end;
```

Un_archivo_que_esta_Ordenado
----------------------------
```Pas
procedure leer(var m:archivo; var dato:Integer);
begin
    if(not eof(m))then 
		read(m,dato)
    else 
		dato:=vA;
end;
//__________________________________________
procedure imprimirOrd(var m:archivo);
var
	dato,actual:Integer;
    total:Integer;
begin
	reset(m);
	leer(m,dato);
	while (dato <> valoralto) do begin
		actual:= dato;
        total:=0;
		while(actual = dato)do 
        begin
            total:=total+dato;
            leer(m,dato);
		end;
        writeln('El total de ',actual,' es : ', total);
	end;
	close(m);
end;
```

Actualizar
==========

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

Agregar
=============

```Pas
Procedure Agregar(var m:archivo); 
var 
    nro: integer;
begin
    reset(m); 
    seek(m,filesize(m)); 
    read(nro); 
    while (nro <> 10) do 
    begin
        write(m,nro);     
        read(nro) 
    end;
    close(m);
end;
```

Corte_De_Control
================

```Pas
procedure Un_Archivo_desde_otro_archivo(var m,d:archivo);
    procedure Leer(var d:archivo;var dato:Integer);
    begin
        if (not eof(d)) then
            Read(d,dato)
        else
            dato:=vA;
    end;
var
    total,datoD,datoM:integer;
begin
    Reset(m);
    Reset(d);
    Leer(d,datoD);
    while datoD <> vA do
    begin
        total:=0;
        Read(m,datoM);
        while (datoM <> datoD) and (datoD <> vA) do
            Read(m,datoM);
        while datoM = datoD do
        begin
            total:=total+datoD;
            Leer(d,datoD);  
        end;
        Seek(m,FilePos(m)-1);
        Write(m,total);
    end;
    Close(m);
    Close(d);
end;
```

Merge
=====

### Declarar

 ```pas
 type
    archivo = file of integer;
    vector_archivo = array [1..dimF] of archivo; //Vector para procesar N detalles
    vector_datos = array [1..dimF] of integer; //Los datos de los detalles
 ```

### Cuando tenemos un archivo que esta ordenado por mas de una condición

```Pas
procedure minimo(var vd:vector_archivo; var vdr:vector_datos;var min:registro);
var
    i,minPos:integer;
begin
    min.cod:=9999;
    min.fecha:=22221231;
    for i:=1 to dimF do begin
        if (vdr[i].cod < min.cod) then begin
            if (vdr[i].fecha < min.fecha) then begin
                min:=vdr[i];
                minPos:=i;
            end;
        end;
    end;
    if (min.cod <> valoralto) then
        leer(vr[minPos],vdr[minPos]);
end;
```

Crear_Maestro
-------------

```pascal
procedure merge(var m:maestro;var vd:vector_detalle;var vdr:vector_detalle_registro);
var
    min:carrera;
    datoM:registroM;
    actual:carrera;
begin
    Rewrite(m); ResetDetalles(vd,vdr);
    minimo(vd,vdr,min);
    while (min.dni <> VA) do
    begin
        actual:=min;
        while actual.dni = min.dni do
        begin
            datoM.kms_total:= datoM.kms_total + min.kms;
            datoM.ganadas:= datoM.ganadas + min.ganoSiNo;
            minimo(vd,vdr,min);
        end;
        write(m,datoM);
    end;
    Close(m); CloseDetalle(vd);
end;
```

Actualizar_Maestro
------------------

```Pas
procedure merge(var m:archivo;var vd:vector_archivo;var vdr:vector_datos);
var
    datoM:registro;
    min:registro;
begin
    Reset(m);
    ResetDetalles(vd,vdr);
    minimo(vd,vdr,min);
    while min.codigo <> vA do
    begin
        LeerM(m,datoM);
        while (datoM.codigo <> min.codigo) do
            LeerM(m,datoM);
        while datoM.codigo = min.codigo do
        begin
            datoM.cantidad:=datoM.cantidad+min.cantidad;
            minimo(vd,vdr,min);
        end;
        Seek(m,FilePos(m)-1);
        Write(m,datoM);
    end;
    Close(m);
    CloseDetalles(vd);
end;
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
procedure Un_Dato_Sin_Saber_Si_Existe(var m:archivo;nro_baja:Integer);
    procedure Leer(var m:archivo;var dato:integer);
    begin
        if not eof(m) then 
            read(m,dato)
        else
            dato:=vA;
    end;
var
    dato:integer;
begin
    reset(m);
    Leer(m,dato);
    while (dato <> vA) and (dato <> nro_baja) do Leer(m,dato);
    if dato <> vA then
    begin
        Seek(m,FilePos(m)-1);
        dato:=-1;
        Write(m,dato);
    end;
    close(m);
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

Un_Dato_Ingresado_Desde_Teclado3
--------------------------------
```Pas
procedure BajaLogica(var m:maestro);
var
    datoM:ave;
    codigoAve:integer;
begin
    Assign(m,'maestro.data');
    Reset(m);       
    WriteLn('El codigo del ave que quiere eliminar: ');
    ReadLn(codigoAve);
    while codigoAve <> 500 do
    begin
        Leer(m,datoM); //Leo lo que tengo en la cabecera
        while datoM.codigo <> valorAlto do 
        begin
            if (datoM.codigo = codigoAve) then
            begin
                datoM.codigo:=-1;
                Seek(m,FilePos(m)-1); Write(m,datoM);
            end;
            Leer(m,datoM);
        end;
        WriteLn('El codigo del ave que quiere eliminar: ');
        ReadLn(codigoAve);
        Seek(m,0);
    end;
    Close(m); 
end;
```

Baja_Fisica
===========

Con_Archivo_Auxiliar
--------------------
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

Compactar
---------

[Programa completo](/Compactar/)

```Pas
procedure compactar(var a:archivo;n:integer);
var
    pos:integer;
    dato:cosa;
begin
    reset(a);
    Leer(a,dato);
    while (dato.codigo <> VA) do begin
        if (dato.codigo=n) then begin  
            pos:= (filePos(a)-1); // pos 0
            seek(a,fileSize(a)-1);  
            read(a,dato);           //me quedo con el elemento al final del archivo
            while (dato.codigo = n) do begin
                seek(a,fileSize(a)-1);
                truncate(a);
                seek(a,fileSize(a)-1);
                read(a,dato);
            end;
            seek(a,pos);
            write(a,dato);
            seek(a,fileSize(a)-1);
            truncate(a);
            seek(a,pos);
        end;
        Leer(a,dato);
    end;
    close(a);
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

Codigos_que_no_usamos
---------------------

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

Un_Archivo_desde_tres_archivos
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

Corte_de_control
----------------
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
    close(d1);close(d2);close(d3);
    close(m);
End;
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