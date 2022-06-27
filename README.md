<h1 align="center"><img src="https://media.giphy.com/media/sXD7snjkFWKaWzNt9D/giphy.gif" height="38" /> FOD </a>
</h1>


<table><tr><td> Codigos </td> <td> Practicas </td><td> Teoria </td><td> Parciales </td></tr>
<tr><td>
 
- [Listas 🧾](/Documentos/Codigos/Listas.md)
- [Vectores 📚](/Documentos/Codigos/Vectores.md)
- [Arboles 🌳](/Documentos/Codigos/Arboles.md)
- [Archivos 📁](/Documentos/Codigos/Archivos.md)
- [Indices 👈🏼](/Documentos/Codigos/Indices.md)
- [Hashing #️⃣](/Documentos/Codigos/Hashing.md)

</td><td>
 
- [Practica 1](/Documentos/Practicas/Practica1Nueva.md)
- [Practica 2](/Documentos/Practicas/Practica2.md)
- [Practica 3](/Documentos/Practicas/Practica3.md)
- [Practica 4](/Documentos/Practicas/Practica4.md)
 
</td><td>

- [Archivos 📁](/Documentos/Teoria/Archivos.md)
- [Arboles 🌳](/Documentos/Teoria/Arboles.md)
- [Hashing #️⃣](/Documentos/Teoria/Hashing.md)

</td><td>

- [Archivos 📁](/Documentos/ParArchivos.md)
</td></tr></table>



# Parciales de archivos

---

### Merge, corte de control

Una empresa de productos de limpieza posee un archivo conteniendo información sobre los productos que tiene a la venta al público. 
De cada producto se registra: código de producto, precio, stock actual y stock mínimo. 
Diariamente se efectúan envíos a cada uno de las 2 sucursales que posee. 
Para esto, cada sucursal envía un archivo con los pedidos de los productos que necesita cada sucursal.
Cada pedido contiene código de producto, fecha y cantidad pedida. 
Se pide realizar el proceso de actualización del archivo maestro con los dos archivos detalle, obteniendo un informe en pantalla de aquellos productos que quedaron
debajo del stock mínimo y de aquellos pedidos que no pudieron satisfacerse totalmente, informando: la sucursal, el producto y la cantidad que no pudo ser enviada
(diferencia entre lo que pidió y lo que se tiene en stock) .


NOTA 1: Todos los archivos están ordenados por código de producto y el archivo maestro debe ser recorrido sólo una vez y en forma simultánea con los detalle. 

NOTA 2: En los archivos detalle puede no aparecer algún producto del maestro. Además, tenga en cuenta que puede aparecer el mismo producto en varios detalles.
Sin embargo, en un mismo detalle cada producto aparece a lo sumo una vez.

<details><summary>📘 Codigo</summary>

```pascal
program Parcial;
const 
    CANTIDAD = 2;
    VALOR_ALTO = 9999;
type
    RANGO = 1..CANTIDAD;
    producto = record
        codigo:integer;
        precio:real;
        stock_actual:integer;
        stock_minimo:integer;
    end;
    pedido = record
        codigo:integer;
        fecha:string;
        cant_pedida:integer;
    end;
    maestro = file of producto;
    detalle = file of pedido;
    vector_detalle = array [RANGO] of detalle;
    vector_detalle_registro = array [RANGO] of pedido;
//____________________________________________
procedure LeerD(var d:detalle;var dato:pedido);
    begin
        if not eof(d) then
            Read(d,dato)
        else
            dato.codigo:=VALOR_ALTO
    end;
procedure LeerM(var m:maestro;var dato:producto);
    begin
        if not eof(m) then
            Read(m,dato)
        else
            dato:=VALOR_ALTO;
    end;
procedure ResetDetalles(var vd:vector_detalle;var vdr:vector_detalle_registro);
    var
        i:integer;
        iStr:string;
    begin
        for i:=1 to CANTIDAD do
        begin
            Str(i,iStr);
            Assign(vd[i],'detalle ' + iStr);
            Reset(vd[i]);
            LeerD(vd[i],vdr[i]);
        end;
    end;
procedure CloseDetalles(var vd:vector_detalle);
    var
        i:integer;
    begin
        for i:=1 to CANTIDAD do
        begin
            Close(vd[i]);
        end;
    end;
procedure minimo(var vd:vector_detalle;var vdr:vector_detalle_registro;var sucursal:integer;var min:pedido);
    var
        i:integer;
    begin
        min.codigo:=VALOR_ALTO;
        for i:=1 to CANTIDAD do begin
            if vdr[i].codigo<min.codigo then
                min:=vdr[i];
                sucursal:=i;
        end;
        if min.codigo <> VALOR_ALTO then
            LeerD(vd[sucursal],vdr[sucursal]);
    end;
procedure merge(var m:maestro;var vd:vector_detalle;var vdr:vector_detalle_registro;);
var
    min:pedido;
    datoM:producto;
    sucursal:integer;
    cant_total:integer;
    cantidad:integer;
begin
    Reset(m); ResetDetalles(vd,vdr);
    minimo(vd,vdr,min,sucursal);
    while min.codigo <> VALOR_ALTO do
    begin
        LeerM(m,datoM);
        while datoM.codigo <> min.codigo do //Puede no existir
            LeerM(m,datoM);
        cant_total:=0;
        while datoM.codigo = min.codigo do
        begin
            cant_total:=cant_total+min.cant_pedida;
            minimo(vd,vdr,min,sucursal);
        end;
        datoM.stock_actual:=datoM.stock_actual-cant_total;
        if (datoM.stock_actual<datoM.stock_minimo) and (0<=datoM.stock_actual) then
        begin
            Write('debajo del stock mínimo ');
            Writeln(datoM.codigo);
        end;
        if datoM.stock_actual<0 then
        begin
            Write(sucursal);
            write(datoM.codigo);
            cantidad:=datoM.stock_actual*-1;
            writeln(cantidad);
            datoM.stock_actual:=0;
        end;
        Seek(m,FilePos(m)-1);
        Write(m,datoM);   
    end;
    Close(m); CloseDetalles(vd);
end;
var
    m:maestro;
    vd:vector_detalle;
    vdr:vector_detalle_registro;
begin
    Assign(m,'maestro.data');
    merge(m,vd,vdr);
end.
```

</details>

---

### Lista invertida

Se dispone de un archivo que contiene información de jugadores de futbol.

Se sabe que el archivo utiliza la técnica de lista invertida para aprovechamiento de espacio.Es decir,las bajas se realizan apilando registros borradosylas altas reutilizando registros borrados.El registro en la posición0del archivo se usa como cabecera de la pila de registros borrados.El campo de enlace es el campo dni.

Nota: El valor 0 en el campo dni significa que no existen registros borrados, y el valor -N indica que el próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido.

```pas
const
    valorAlto=9999;
Type
    tJugador = Record
        dni : longInt:
        nombre:String:
        apellido:String:
        pais nacimiento:String
    end;
    tArchivo=File of tJugador:
```

Se solicita implementar los siguientes módulos:

- Abre el archivo y agrega un jugador, el mismo se recibe como parámetro y debe utilizar la política descripta anteriormente para recuperación de espacio

- Abre el archivo y elimina el jugador con el dni recibido como parámetro(si existe), manteniendo la política descripta anteriormente

```pas
program Parcial;

procedure Baja(var a:tArchivo;dni_borrar:longInt);
var
    dato,cabecera:tJugador;
begin
    Reset(a);
    Leer(a,cabecera);
    Leer(a,dato);
    while (dato.dni <> valorAlto) and (dato.dni <> dni_borrar) do
            Leer(a,dato);
    if (dato.dni = dni_borrar) then begin
        Seek(a,filePos(a)-1);
        write(a,cabecera);
        cabecera.dni := (filePos(a) -1) * -1;
        seek(a, 0);
        write(a, cabecera);
    end;
    Close(a);
end;

procedure Alta(var a:tArchivo;jugador:tJugador);
var
    cabecera:tJugador;
begin
    Reset(a);
    Leer(a,cabecera);
    if (cabecera.dni = 0) then begin
        Seek(a, fileSize(a));
        Write(a, jugador);
    end
    else begin
        Seek(a,(cabecera.dni*-1));
        Leer(a,cabecera);
        Seek(a,filePos(a)-1);    
        write(a,jugador);
        Seek(a,0);
        write(a,cabecera);
    end;
    Close(a);
end;
```

---

### Merge, corte control

Una cadena de restaurantes posee un archivo de productos que a la venta,de cada producto se registra : código de producto, nombre, descripción, código de barras, categoría de producto, stock actual y stock mínimo. Diariamente el depósito debe efectuar envíos acada uno de los tres restaurantes que se encuentran en la ciudad de Laprida. Para esto,cada restaurante envia un archivo por mail con los pedidos de productos. Cada pedido contiene:código de producto,cantidad pedida y una breve descripción del producto.

Se pide realizar el proceso de actualización del archivo maestro con los tres archivos de detalle,obteniendo un informe de aquellos productos que quedaron por debajo del stock mínimo y sobre estos productos informar la categoría a la que pertenecen. 

Además,informar aquellos pedidos que no pudieron satisfacerse totalmente por falta de stock,indicando la diferencia que no pudo ser enviada a cada restaurante. Si el stock no es suficiente para satisfacer un pedido en su totalidad, entonces el mismo debe satisfacerse con la cantidad que se disponga.

Nota: Todos los archivos están ordenados por código de producto

<details><summary>📘 Codigo</summary>

```pas
program Parcial;
const
    DIMF = 3;
    VALORALTO = 9999;

type
    cadena20 = string[20];
    producto = record
        codigo:integer;
        nombre:cadena20;
        codigo_barras:integer;
        categoria:cadena20;
        stock_actual:integer;
        stock_min:integer;
    end;
    registroD = record
        codigo:integer;
        cant_pedida:integer;
        descripcion:cadena20;
    end;
    archivoM = file of producto;
    archivoD = file of registroD;
    vector_archivoD = array [1..DINF] of archivoD;
    vector_datosD = array [1..DIMF] of registroD;

//________________________________________
procedure ResetDetalles(var vd:vector_archivoD;var vdd:vector_datosD);
var
    i:integer;
    iStr:cadena20;
begin
    for i:=1 to DIMF do
    begin
        Str(i,iStr);
        assign(vd[i],'detalle'+iStr);
        reset(vd[i]);
        LeerD(vd[i],vdd[i]);
    end;
end;
//________________________________________
procedure CloseDetalles(var vd:vector_archivoD);
var
    i:integer;
begin
    for i:=1 to DIMF do
        Close(vd[i]);
end;
//________________________________________
procedure LeerM(var m:archivoM;dato:producto);
begin
    if not eof (m) then
        Read(m,dato)
    else
        dato.codigo:=VALORALTO;
end;
procedure LeerD(var d:archivoD;dato:registroD);
begin
    if not eof (d) then
        Read(d,dato)
    else
        dato.codigo:=VALORALTO;
end;
//________________________________________
procedure minimo(var vd:vector_archivoD;var vdd:vector_datosD;var min:archivoD;var minPos:integer);
var
    i:integer;
begin
    min.codigo:=VALORALTO;
    for i:=1 to DIMF do
    begin
        if (vdd[i].codigo< min.codigo ) then
        begin
            min:=vdd[i];
            minPos:=i;
        end;
    end;
    if (min.codigo <> VALORALTO) then 
        LeerD(vd[minPos],vdd[minPos]);
end;
//________________________________________
procedure Merge(var m:archivoM;var vd:vector_archivoD;var vdd:vector_datosD);
var
    datoM:producto;
    min:producto;
    posMin:integer;
    diferencia:integer;
begin
    posMin:=valorAlto;
    diferencia:=0;
    Reset(m);
    ResetDetalles(vd,vdd);
    minimo(vd,vdd,min,posMin);
    while (min.codigo<>VALORALTO) do
    begin
        LeerM(m,datoM);
        while (datoM.codigo <> min.codigo) do
            LeerM(m,datoM);
        while (datoM.codigo = min.codigo) and (min.codigo<>VALORALTO) do begin
            if (datoM.stock_actual < min.cant_pedida) then
            begin
                diferencia = (datoM.stock_actual - min.cant_pedida)*-1;
                writenln('Diferencia ', diferencia, 'en la sucursal ', posMin); 
            end;
            datoM.stock_actual:=datoM.stock_actual - min.cant_pedida;
            if (datoM.stock_actual< 0) then
                datoM.stock_actual:=0;
            minimo(vd,vdd,min,posMin);
        end;
        if (datoM.stock_actual < datoM.stock_min) then
        begin
            writeln(datoM.codigo);
            writeln(datoM.categoria);
        end;

        seek(m,filePos(m)-1);
        write(m,datoM);
    end;
    Close(m);
    CloseDetalles(vd);
end;
//________________________________________
var
    m:archivoM;
    vd:vector_archivoD;
    vdd:vector_datosD;
begin
    Assign(m,'maestro.data');
    Merge(m,vd,vdd);
end;
```

</details>

---


![image](https://user-images.githubusercontent.com/55964635/175982889-28b6814a-ff23-4972-a413-6bace4e0182a.png)


<details><summary>📘 Codigo</summary>

```Pas
program primeraFecha;
const
    CANTIDAD = 5;
    VA = 9999;
type
    carrera = record
        dni:integer;
        apellido:string;
        nombre:string;
        kms:integer;
        ganoSiNo:integer;
    end;
    detalle = file of carrera;
    registroM = record
        dni:integer;
        apellido:string;
        kms_total:integer;
        ganadas:integer;
    end;
    maestro = file of registroM;
    vector_detalle = array [1..CANTIDAD] of detalle;
    vector_detalle_registro = array [1..CANTIDAD] of carrera;

procedure LeerD(var d:detalle;var dato:carrera);
begin
    if not eof (d) then
        Read(d,dato);
    else
        dato.dni:=VA;
end;

procedure ResetDetalles(var vd:vector_detalle;var vdr:vector_detalle_registro);
var
    i:integer;
    iStr:string;
    dato:carrera;
begin
    for i:=1 to CANTIDAD do
    begin
        Str(i,iStr);
        Assign(vd[i],'detalle' + iStr);
        Reset(vd[i]);
        LeerD(vd[i],vdr[i]);
    end;
end.
procedure CloseDetalles(var vd:vector_detalle);
var
    i:integer;
begin
    for i:=1 to CANTIDAD do
        Close(vd[i]);
end;
procedure minimo(var vd:vector_detalle;var vdr:vector_detalle_registro;var min:carrera);
var
    i:integer;
    pos:integer;
begin
    min.dni:=VA;
    for i:=1 to CANTIDAD do
    begin
        if (vdr[i].dni < min.dni) then
        begin
            min:=vdr[i];
            pos:=i;
        end;
    end;
    if min.dni <> VA then
        LeerD(vd[pos],vdr[pos]);
end;

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
var
    m:maestro;
    vd:vector_detalle;
    vdr:vector_detalle_registro;
begin
    Assign(m,'maestro.data');
    merge(m,vd,vdr);
end.
```

</details>

![image](https://user-images.githubusercontent.com/55964635/176000672-e84f9fa7-3e0c-416e-a7e7-4847a51740e2.png)

<details><summary>📘 Codigo</summary>

```pas
type
    persona = record
        DNI:integer;
        nombre:string;
        apellido:string;
        sueldo:real;
    end;
    tArchivo = file of persona;
```

```pas
procedure crear(var arch: tArchivo; var info:TEXT);
var
    dato:persona;
begin
    Rewrite(arch); Reset(info);
    while not eof(info) begin
        Read(info,dato);
        write(arch,dato);
    end;
    Close(arch); Close(info);
end;

//_____________________________
procedure agregar(var arch: tArchivo; p:persona);
var
    cabecera:persona;
    dato:persona;
begin
    Reset(arch);
    Leer(arch,cabecera);
    if (cabecera.DNI = 0); //Lo agrega al ginal
    begin
        Seek(arch,fileZise(arch));
        write(arch,p);
    end
    else
        begin
            Seek(arch,(cabecera.DNI*-1));
            Leer(arch,dato)
            Seek(a,filePos(arch)-1);   
            write(arch,p);
            Seek(arch,0);
            write(arch,dato);
        end;
    Close(arch);
end;

procedure eliminar(var arch:tArchivo:DNI:integer);
var
    dato:persona;
    cabecera:persona;
begin
    Reset(arch);
    Leer(arch,cabecera)
    Leer(arch,dato)
    while (dato.DNI <> DNI) and (dato.DNI <> VA) do
        Leer(arch,dato)
    if (dato.DNI = DNI) then 
    begin
        Seek(arch,filePos(arch)-1);
        Leer(a,cabecera);
        cabecera.DNI:= (seek(arch, filePos(arch)-1))*-1;
        Seek(arch,0);
        write(arch,cabecera);
    end;
    Close(arch);
end;
```


</details>


![image](https://user-images.githubusercontent.com/55964635/176021332-be5b11a7-2ca2-4d1d-b828-e3f9247a397d.png)

```Pascal
type
    registroM = record
        cod_prenda:integer;
        descripcion:string;
        colores:string;
        tipo_prenda:string;
        stock:integer;
        precio_unitario:real;
    end;
    registroM = record
        cod_prenda:integer;
    end;
```